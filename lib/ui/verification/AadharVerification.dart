import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:elevarm_ui/elevarm_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pinput/pinput.dart';
import 'package:swfl/Data/SharedPrefs/SharedUtility.dart';
import 'package:swfl/Domain/AuthenticationService/AuthenticationService.dart';
import 'package:swfl/ui/home/DashboardMenu/AddDirectorPartner/EditDirectorPartnerScreen.dart';
import 'package:swfl/ui/utils/colors.dart';
import 'package:swfl/ui/utils/extensions.dart';
import 'package:swfl/ui/utils/routes.dart';
import 'package:swfl/ui/utils/routes_strings.dart';
import 'package:swfl/ui/utils/widgets.dart';

class Aadharverification extends ConsumerStatefulWidget {
  const Aadharverification({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AadharverificationState();
}

class _AadharverificationState extends ConsumerState<Aadharverification> {
  final _isOtpSentProvider = StateProvider((ref) => false);
  final _aadharNumberController = TextEditingController();
  final _agreementCheckedProvider = StateProvider((ref) => false);
  final _requestIdProvider = StateProvider((ref) => '');
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _aadharNumberController.text =
          ref.watch(sharedUtilityProvider).getMongoDbUser()?.aadharNo ?? "";
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return !ref.watch(_isOtpSentProvider)
        ? _aadharConsentLayout(ref, context)
        : _otpVerificationLayout(ref, context);
  }

  Widget _aadharConsentLayout(WidgetRef ref, BuildContext context) => Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ElevarmTextInputField(
            isRequired: true,
            keyboardType: TextInputType.number,
            maxLength: 12,
            controller: _aadharNumberController,
            hintText: 'Enter Aadhar number',
            label: "Enter Aadhar Number",
            validator: (value) {
              if (value == null || value.length != 12) {
                return 'enter valid aadhar number';
              }

              return null;
            },
          ),
          const SizedBox(
            height: 10,
          ),
          ElevarmCheckboxListTile(
            checked: ref.watch(_agreementCheckedProvider),
            onPressed: () {
              if (!ref.watch(_agreementCheckedProvider)) {
                ref.watch(_agreementCheckedProvider.notifier).state = true;
              } else
                ref.watch(_agreementCheckedProvider.notifier).state = false;
            },
            title:
                'I Hereby declare my consent agreement for fetching my information',
            subtitle: '',
            padding: const EdgeInsets.all(16.0),
            size: ElevarmCheckboxSize.sm,
            trailingWidget: Container(),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevarmPrimaryButton.text(
            text: 'Send Otp',
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                ref
                    .watch(sendAadharVerificationOtpProvider(
                            aadharNo: _aadharNumberController.text)
                        .future)
                    .then((value) {
                  if (value['status'].toString() == "1") {
                    ref.watch(_isOtpSentProvider.notifier).state = true;
                    ref.watch(_requestIdProvider.notifier).state =
                        value['data']['request_id'];
                    successToast(context, value['message']);
                  } else {
                    showErrorDialog(context,
                        titleText: 'Error!',
                        messageText: value['message'].toString());
                  }
                });
              }
            },
            buttonThemeData: const ElevarmPrimaryButtonThemeData(
                primaryColor: ColorsConstant.secondaryColor),
          )
        ],
      ));

  Widget _otpVerificationLayout(WidgetRef ref, BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(0),
            child: Pinput(
              autofocus: true,
              length: 6,
              onCompleted: (pin) {
                _onOtpCompleted(ref, context,
                    aadharNo: _aadharNumberController.text,
                    otp: pin,
                    requestID: ref.watch(_requestIdProvider));
              },
              defaultPinTheme: PinTheme(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: ColorsConstant.primaryColor.withOpacity(0.1),
                  border: Border.all(
                    color: ColorsConstant.primaryColor.withOpacity(0.1),
                  ),
                ),
              ),
              focusedPinTheme: PinTheme(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: ColorsConstant.primaryColor.withOpacity(0.1),
                  border: Border.all(color: ColorsConstant.secondColorDark),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
              '* An OTP has been sent on your aadhar registered mobile number, Submit that OTP to verify your aadhar identity.'),
          SizedBox(
            height: 20,
          ),
          ElevarmPrimaryButton.text(
            text: 'Re-Send OTP',
            onPressed: () {
              ref
                  .watch(sendAadharVerificationOtpProvider(
                          aadharNo: _aadharNumberController.text)
                      .future)
                  .then((value) {
                if (value['status'].toString() == "1") {
                  successToast(context, value['message']);
                  // ref.watch(_isOtpSentProvider.notifier).state = true;
                  // ref.watch(_requestIdProvider.notifier).state =
                  //     value['data']['request_id'];
                } else {
                  showErrorDialog(context,
                      titleText: 'Error!',
                      messageText: value['message'].toString());
                }
              });
            },
            buttonThemeData: const ElevarmPrimaryButtonThemeData(
                primaryColor: ColorsConstant.secondaryColor),
          )
        ],
      );

  _onOtpCompleted(WidgetRef ref, BuildContext context,
      {required aadharNo, required otp, required requestID}) {
    ref
        .watch(verifyAadharVerificationOtpProvider(
                aadharNo: _aadharNumberController.text,
                otp: otp,
                requestId: requestID)
            .future)
        .then((value) {
      if (value['status'].toString() == "1") {
        successToast(context, 'aadhar verified successfully!');
        Navigator.of(context).pop();
      } else {
        showErrorDialog(context,
            titleText: 'Error!', messageText: value['message'].toString());
        // ref.watch(_isOtpSentProvider.notifier).state = false;
      }
    });
  }
}
