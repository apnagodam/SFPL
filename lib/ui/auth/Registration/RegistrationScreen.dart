import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:elevarm_ui/elevarm_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_device_identifier/mobile_device_identifier.dart';
import 'package:otp_autofill/otp_autofill.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pinput/pinput.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:swfl/Data/Model/MongoDbUserModel.dart';
import 'package:swfl/Data/SharedPrefs/SharedUtility.dart';
import 'package:swfl/Domain/AuthenticationService/AuthenticationService.dart';
import 'package:swfl/ui/auth/Login/login_screen.dart';
import 'package:swfl/ui/utils/SmsStrategy.dart';
import 'package:swfl/ui/utils/debouncer.dart';
import 'package:swfl/ui/utils/extensions.dart';
import 'package:swfl/ui/utils/routes.dart';
import 'package:swfl/ui/utils/routes_strings.dart';
import 'package:swfl/ui/utils/widgets.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:mongo_dart/mongo_dart.dart' as mongo;

import '../../../Data/Model/DistrictsResponseModel.dart';
import '../../../Data/Model/StatesResponseModel.dart';
import '../../utils/colors.dart';
import '../../utils/enums.dart';

class Registrationscreen extends ConsumerStatefulWidget {
  const Registrationscreen({super.key});

  @override
  ConsumerState<Registrationscreen> createState() => _RegistrationscreenState();
}

class _RegistrationscreenState extends ConsumerState<Registrationscreen> {
  var statesProvider = StateProvider<Datum?>((ref) => null);

  var districtProvider = StateProvider<StateDatum?>((ref) => null);
  var propProvider = StateProvider<int?>((ref) => null);
  var propNameProvider = StateProvider((ref) => "Select Constitution");
  var propTypeList = ['Individual', "Proprietorship Firm", "Partnership Firm"];
  var regTypeList = ['Commodity Finance', "BNPL"];
  var regNameProvider = StateProvider((ref) => "Select Registration type");
  final FocusNode otpNode = FocusNode();
  var registrationTypeProvider =
      StateProvider<RegistrationType?>((ref) => null);
  var constitutionTypeProvider =
      StateProvider<ConstitutionType?>((ref) => null);
  var userDetailsProvider = StateProvider<Map<String, dynamic>?>((ref) => null);
  final _pancardController = TextEditingController();
  final _autologinPhoneController = TextEditingController();
  final _autologinOtpController = TextEditingController();
  final _autoFormKey = GlobalKey<FormState>();
  late OTPInteractor _otpInteractor;
  OTPTextEditController? controller;

  @override
  void initState() {
    super.initState();
    _otpInteractor = OTPInteractor();
    _initializeOtpListener();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      var db = await mongo.Db.create(
          "mongodb+srv://apnagodam:l2F97uxKZ73eq251@cluster0.humxj.mongodb.net/");
      await db.open();

      final mobileDeviceIdentifier =
          await MobileDeviceIdentifier().getDeviceId();

      var userDetailsCollection =
          db.collection(mobileDeviceIdentifier.toString());

      userDetailsCollection.find().first.then((value) {
        if (value['constitution'] != null) {
          if (value['constitution'].toString() == "1") {
            ref.watch(constitutionTypeProvider.notifier).state =
                ConstitutionType.individual;
            setState(() {});
          }
          if (value['constitution'].toString() == "2") {
            ref.watch(constitutionTypeProvider.notifier).state =
                ConstitutionType.proprietorship;
          }
          if (value['constitution'].toString() == "3") {
            ref.watch(constitutionTypeProvider.notifier).state =
                ConstitutionType.partnership;
          }
          if (value['constitution'].toString() == "4") {
            ref.watch(constitutionTypeProvider.notifier).state =
                ConstitutionType.company;
          } else {
            ref.watch(constitutionTypeProvider.notifier).state =
                ConstitutionType.defaultType;
          }
        }
      });
    });
  }

  Future<void> _initializeOtpListener() async {
    await _otpInteractor.getAppSignature();

    var smsPermission = await Permission.sms.status;
    if (!smsPermission.isGranted) {
      final result = await Permission.sms.request();
      if (!result.isGranted) {
        errorToast(
            context, "SMS permission is required for auto OTP detection.");
        return;
      }
    }

    _startListening();
  }

  void _startListening() {
    controller = OTPTextEditController(
      codeLength: 6,
      otpInteractor: _otpInteractor,
      onCodeReceive: (code) {
        final otp = code.trim();
        if (otp.isNotEmpty) {
          _autologinOtpController.text = otp;
        }
        setState(() {});
      },
      onTimeOutException: _startListening,
    )..startListenUserConsent(
        (code) {
          final exp = RegExp(r'(\d{6})');
          return exp.stringMatch(code ?? '') ?? '';
        },
        strategies: [Smsstrategy()],
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(10),
      child: ListView(
        children: [
          SizedBox(
            height: Adaptive.h(5),
          ),
          Center(
            child: Image.asset(
              'assets/swfl.png',
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: Text(
              "Welcome!",
              style: TextStyle(
                  color: ColorsConstant.secondaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: Adaptive.sp(20)),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Create your account to access Apnagodam's Financial Services",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.grey.shade500,
                fontWeight: FontWeight.bold,
                fontSize: Adaptive.sp(17)),
          ),
          const SizedBox(
            height: 20,
          ),
          const SizedBox(
            height: 10,
          ),
          _autoLoginUi(),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton(
              onPressed: () async {
                _autoFetchUserDetails();
              },
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(15),
                  backgroundColor: ColorsConstant.primaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              child: Text(
                "Submit",
                style: TextStyle(
                    color: Colors.white,
                    shadows: const [
                      Shadow(color: Colors.white, blurRadius: 0.3)
                    ],
                    fontWeight: FontWeight.w700,
                    fontSize: Adaptive.sp(16)),
              ),
            ),
          ),
        ],
      ),
    ));
  }

  Future<void> _autoFetchUserDetails() async {
    if (_autoFormKey.checkFormValidtion()) {
      ref
          .watch(fetchRegisteredUserDataProvider(
                  panCardNo: _pancardController.text,
                  phone: _autologinPhoneController.text)
              .future)
          .then((value) {
        if (value['status'].toString() == "1") {
          successToast(context, value['message']);
          otpNode.requestFocus();
          showBottomSheet(
              context: context,
              builder: (otpContext) => ElevarmBottomSheet(
                      title: "Verify Otp",
                      children: [
                        _autoLoginOtpUi(
                            ref, value['constitution'].toString(), otpContext)
                      ]));
        }
        ;
      });
    }
  }

  _autoLoginUi() => Consumer(
      builder: (context, ref, child) => Form(
          key: _autoFormKey,
          child: Column(
            children: [
              ElevarmTextInputField(
                label: 'Input Pan card no.',
                helperText: 'E.g ABCDE1234F',
                hintText: 'Input Pan card no.',
                controller: _pancardController,
                maxLength: 10,
                inputFormatters: [UpperCaseTextFormatter()],
                validator: (value) {
                  if (value == null || !value.isValidPanCardNo()) {
                    return 'Please input valid pan card no.';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              ElevarmTextInputField(
                label: 'Input Phone no.',
                hintText: 'Input Phone no.',
                maxLength: 10,
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.length != 10) {
                    return 'Please input valid mobile no.';
                  }
                  return null;
                },
                controller: _autologinPhoneController,
              )
            ],
          )));

  _autoLoginOtpUi(WidgetRef ref, String constitution, BuildContext context) =>
      Form(
          child: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Pinput(
                autofocus: true,
                focusNode: otpNode,
                controller: _autologinOtpController,
                length: 6,
                defaultPinTheme: PinTheme(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: ColorsConstant.primaryColor.withOpacity(0.1),
                        border: Border.all(
                            color:
                                ColorsConstant.primaryColor.withOpacity(0.1)))),
                focusedPinTheme: PinTheme(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: ColorsConstant.primaryColor.withOpacity(0.1),
                        border:
                            Border.all(color: ColorsConstant.secondColorDark))),
                onCompleted: (pin) {
                  if (pin.length == 6) {
                    Debouncer(delay: const Duration(milliseconds: 500))
                        .call(() {
                      Map<String, dynamic> data = {
                        'pancard_no': _pancardController.text,
                        'phone': _autologinPhoneController.text,
                        'constitution': constitution,
                        'otp': pin
                      };
                      Navigator.of(context, rootNavigator: false).pop();

                      _handleOtpSubmission(data);
                      //showloader(context);
                    });
                  }
                },
              ),
            ),
          ),
          Center(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Didn't Received the Otp?",
                style: TextStyle(
                    color: ColorsConstant.primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: Adaptive.sp(16)),
              ),
              TextButton(
                onPressed: () {
                  _autoFetchUserDetails();
                },
                child: Text(
                  "Resend OTP",
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      decorationColor: ColorsConstant.secondColorSuperDark,
                      color: ColorsConstant.secondColorSuperDark,
                      fontWeight: FontWeight.bold,
                      fontSize: Adaptive.sp(16)),
                ),
              )
            ],
          )),
        ],
      ));

  _handleOtpSubmission(Map<String, dynamic> data) => ref
          .watch(verifyRegisteredUserOtpProvider(data: data).future)
          .then((otpResponse) {
        _autologinOtpController.clear();
        if (otpResponse['status'].toString() == "1") {
          ref.watch(userDetailsProvider.notifier).state = otpResponse['data'];

          ref
              .watch(sharedUtilityProvider)
              .setMongoDbUser(MongoDbUserModel.fromJson(otpResponse['data']));

          if (ref.watch(userDetailsProvider)?['constitution'].toString() ==
              '1') {
            ref
                .watch(goRouterProvider)
                .go(RoutesStrings.individualRegistration);
          } else if (ref
                  .watch(userDetailsProvider)?['constitution']
                  .toString() ==
              '2') {
            ref.watch(goRouterProvider).go(RoutesStrings.propRegistration);
          } else if (ref
                  .watch(userDetailsProvider)?['constitution']
                  .toString() ==
              '3') {
            ref
                .watch(goRouterProvider)
                .go(RoutesStrings.partnershipRegistration);
          } else if (ref
                  .watch(userDetailsProvider)?['constitution']
                  .toString() ==
              '4') {
            ref
                .watch(goRouterProvider)
                .go(RoutesStrings.companyRegistration);
          }
        }
      });
}
