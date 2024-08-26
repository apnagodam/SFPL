// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AuthenticationService.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$registerUserHash() => r'8f3de4dbbc2efaf3964f09c02c0c38a28b0f5f23';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [registerUser].
@ProviderFor(registerUser)
const registerUserProvider = RegisterUserFamily();

/// See also [registerUser].
class RegisterUserFamily extends Family<AsyncValue<Map<String, dynamic>>> {
  /// See also [registerUser].
  const RegisterUserFamily();

  /// See also [registerUser].
  RegisterUserProvider call({
    String? panCard,
    String? phone,
    String? userName,
    String? constitution,
    String? email,
    String? adharNo,
    String? address,
    String? locationState,
    String? district,
    String? pincode,
    String? bankName,
    String? bankBranch,
    String? bankAccount,
    String? ifscCode,
    String? propDocType,
    String? propDocNumber,
    String? firmName,
    File? panCardImage,
    File? profileImage,
    File? chequeImage,
    File? aadharImage,
    File? adharBackImage,
    File? proprietorProof,
  }) {
    return RegisterUserProvider(
      panCard: panCard,
      phone: phone,
      userName: userName,
      constitution: constitution,
      email: email,
      adharNo: adharNo,
      address: address,
      locationState: locationState,
      district: district,
      pincode: pincode,
      bankName: bankName,
      bankBranch: bankBranch,
      bankAccount: bankAccount,
      ifscCode: ifscCode,
      propDocType: propDocType,
      propDocNumber: propDocNumber,
      firmName: firmName,
      panCardImage: panCardImage,
      profileImage: profileImage,
      chequeImage: chequeImage,
      aadharImage: aadharImage,
      adharBackImage: adharBackImage,
      proprietorProof: proprietorProof,
    );
  }

  @override
  RegisterUserProvider getProviderOverride(
    covariant RegisterUserProvider provider,
  ) {
    return call(
      panCard: provider.panCard,
      phone: provider.phone,
      userName: provider.userName,
      constitution: provider.constitution,
      email: provider.email,
      adharNo: provider.adharNo,
      address: provider.address,
      locationState: provider.locationState,
      district: provider.district,
      pincode: provider.pincode,
      bankName: provider.bankName,
      bankBranch: provider.bankBranch,
      bankAccount: provider.bankAccount,
      ifscCode: provider.ifscCode,
      propDocType: provider.propDocType,
      propDocNumber: provider.propDocNumber,
      firmName: provider.firmName,
      panCardImage: provider.panCardImage,
      profileImage: provider.profileImage,
      chequeImage: provider.chequeImage,
      aadharImage: provider.aadharImage,
      adharBackImage: provider.adharBackImage,
      proprietorProof: provider.proprietorProof,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'registerUserProvider';
}

/// See also [registerUser].
class RegisterUserProvider
    extends AutoDisposeFutureProvider<Map<String, dynamic>> {
  /// See also [registerUser].
  RegisterUserProvider({
    String? panCard,
    String? phone,
    String? userName,
    String? constitution,
    String? email,
    String? adharNo,
    String? address,
    String? locationState,
    String? district,
    String? pincode,
    String? bankName,
    String? bankBranch,
    String? bankAccount,
    String? ifscCode,
    String? propDocType,
    String? propDocNumber,
    String? firmName,
    File? panCardImage,
    File? profileImage,
    File? chequeImage,
    File? aadharImage,
    File? adharBackImage,
    File? proprietorProof,
  }) : this._internal(
          (ref) => registerUser(
            ref as RegisterUserRef,
            panCard: panCard,
            phone: phone,
            userName: userName,
            constitution: constitution,
            email: email,
            adharNo: adharNo,
            address: address,
            locationState: locationState,
            district: district,
            pincode: pincode,
            bankName: bankName,
            bankBranch: bankBranch,
            bankAccount: bankAccount,
            ifscCode: ifscCode,
            propDocType: propDocType,
            propDocNumber: propDocNumber,
            firmName: firmName,
            panCardImage: panCardImage,
            profileImage: profileImage,
            chequeImage: chequeImage,
            aadharImage: aadharImage,
            adharBackImage: adharBackImage,
            proprietorProof: proprietorProof,
          ),
          from: registerUserProvider,
          name: r'registerUserProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$registerUserHash,
          dependencies: RegisterUserFamily._dependencies,
          allTransitiveDependencies:
              RegisterUserFamily._allTransitiveDependencies,
          panCard: panCard,
          phone: phone,
          userName: userName,
          constitution: constitution,
          email: email,
          adharNo: adharNo,
          address: address,
          locationState: locationState,
          district: district,
          pincode: pincode,
          bankName: bankName,
          bankBranch: bankBranch,
          bankAccount: bankAccount,
          ifscCode: ifscCode,
          propDocType: propDocType,
          propDocNumber: propDocNumber,
          firmName: firmName,
          panCardImage: panCardImage,
          profileImage: profileImage,
          chequeImage: chequeImage,
          aadharImage: aadharImage,
          adharBackImage: adharBackImage,
          proprietorProof: proprietorProof,
        );

  RegisterUserProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.panCard,
    required this.phone,
    required this.userName,
    required this.constitution,
    required this.email,
    required this.adharNo,
    required this.address,
    required this.locationState,
    required this.district,
    required this.pincode,
    required this.bankName,
    required this.bankBranch,
    required this.bankAccount,
    required this.ifscCode,
    required this.propDocType,
    required this.propDocNumber,
    required this.firmName,
    required this.panCardImage,
    required this.profileImage,
    required this.chequeImage,
    required this.aadharImage,
    required this.adharBackImage,
    required this.proprietorProof,
  }) : super.internal();

  final String? panCard;
  final String? phone;
  final String? userName;
  final String? constitution;
  final String? email;
  final String? adharNo;
  final String? address;
  final String? locationState;
  final String? district;
  final String? pincode;
  final String? bankName;
  final String? bankBranch;
  final String? bankAccount;
  final String? ifscCode;
  final String? propDocType;
  final String? propDocNumber;
  final String? firmName;
  final File? panCardImage;
  final File? profileImage;
  final File? chequeImage;
  final File? aadharImage;
  final File? adharBackImage;
  final File? proprietorProof;

  @override
  Override overrideWith(
    FutureOr<Map<String, dynamic>> Function(RegisterUserRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RegisterUserProvider._internal(
        (ref) => create(ref as RegisterUserRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        panCard: panCard,
        phone: phone,
        userName: userName,
        constitution: constitution,
        email: email,
        adharNo: adharNo,
        address: address,
        locationState: locationState,
        district: district,
        pincode: pincode,
        bankName: bankName,
        bankBranch: bankBranch,
        bankAccount: bankAccount,
        ifscCode: ifscCode,
        propDocType: propDocType,
        propDocNumber: propDocNumber,
        firmName: firmName,
        panCardImage: panCardImage,
        profileImage: profileImage,
        chequeImage: chequeImage,
        aadharImage: aadharImage,
        adharBackImage: adharBackImage,
        proprietorProof: proprietorProof,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Map<String, dynamic>> createElement() {
    return _RegisterUserProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RegisterUserProvider &&
        other.panCard == panCard &&
        other.phone == phone &&
        other.userName == userName &&
        other.constitution == constitution &&
        other.email == email &&
        other.adharNo == adharNo &&
        other.address == address &&
        other.locationState == locationState &&
        other.district == district &&
        other.pincode == pincode &&
        other.bankName == bankName &&
        other.bankBranch == bankBranch &&
        other.bankAccount == bankAccount &&
        other.ifscCode == ifscCode &&
        other.propDocType == propDocType &&
        other.propDocNumber == propDocNumber &&
        other.firmName == firmName &&
        other.panCardImage == panCardImage &&
        other.profileImage == profileImage &&
        other.chequeImage == chequeImage &&
        other.aadharImage == aadharImage &&
        other.adharBackImage == adharBackImage &&
        other.proprietorProof == proprietorProof;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, panCard.hashCode);
    hash = _SystemHash.combine(hash, phone.hashCode);
    hash = _SystemHash.combine(hash, userName.hashCode);
    hash = _SystemHash.combine(hash, constitution.hashCode);
    hash = _SystemHash.combine(hash, email.hashCode);
    hash = _SystemHash.combine(hash, adharNo.hashCode);
    hash = _SystemHash.combine(hash, address.hashCode);
    hash = _SystemHash.combine(hash, locationState.hashCode);
    hash = _SystemHash.combine(hash, district.hashCode);
    hash = _SystemHash.combine(hash, pincode.hashCode);
    hash = _SystemHash.combine(hash, bankName.hashCode);
    hash = _SystemHash.combine(hash, bankBranch.hashCode);
    hash = _SystemHash.combine(hash, bankAccount.hashCode);
    hash = _SystemHash.combine(hash, ifscCode.hashCode);
    hash = _SystemHash.combine(hash, propDocType.hashCode);
    hash = _SystemHash.combine(hash, propDocNumber.hashCode);
    hash = _SystemHash.combine(hash, firmName.hashCode);
    hash = _SystemHash.combine(hash, panCardImage.hashCode);
    hash = _SystemHash.combine(hash, profileImage.hashCode);
    hash = _SystemHash.combine(hash, chequeImage.hashCode);
    hash = _SystemHash.combine(hash, aadharImage.hashCode);
    hash = _SystemHash.combine(hash, adharBackImage.hashCode);
    hash = _SystemHash.combine(hash, proprietorProof.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin RegisterUserRef on AutoDisposeFutureProviderRef<Map<String, dynamic>> {
  /// The parameter `panCard` of this provider.
  String? get panCard;

  /// The parameter `phone` of this provider.
  String? get phone;

  /// The parameter `userName` of this provider.
  String? get userName;

  /// The parameter `constitution` of this provider.
  String? get constitution;

  /// The parameter `email` of this provider.
  String? get email;

  /// The parameter `adharNo` of this provider.
  String? get adharNo;

  /// The parameter `address` of this provider.
  String? get address;

  /// The parameter `locationState` of this provider.
  String? get locationState;

  /// The parameter `district` of this provider.
  String? get district;

  /// The parameter `pincode` of this provider.
  String? get pincode;

  /// The parameter `bankName` of this provider.
  String? get bankName;

  /// The parameter `bankBranch` of this provider.
  String? get bankBranch;

  /// The parameter `bankAccount` of this provider.
  String? get bankAccount;

  /// The parameter `ifscCode` of this provider.
  String? get ifscCode;

  /// The parameter `propDocType` of this provider.
  String? get propDocType;

  /// The parameter `propDocNumber` of this provider.
  String? get propDocNumber;

  /// The parameter `firmName` of this provider.
  String? get firmName;

  /// The parameter `panCardImage` of this provider.
  File? get panCardImage;

  /// The parameter `profileImage` of this provider.
  File? get profileImage;

  /// The parameter `chequeImage` of this provider.
  File? get chequeImage;

  /// The parameter `aadharImage` of this provider.
  File? get aadharImage;

  /// The parameter `adharBackImage` of this provider.
  File? get adharBackImage;

  /// The parameter `proprietorProof` of this provider.
  File? get proprietorProof;
}

class _RegisterUserProviderElement
    extends AutoDisposeFutureProviderElement<Map<String, dynamic>>
    with RegisterUserRef {
  _RegisterUserProviderElement(super.provider);

  @override
  String? get panCard => (origin as RegisterUserProvider).panCard;
  @override
  String? get phone => (origin as RegisterUserProvider).phone;
  @override
  String? get userName => (origin as RegisterUserProvider).userName;
  @override
  String? get constitution => (origin as RegisterUserProvider).constitution;
  @override
  String? get email => (origin as RegisterUserProvider).email;
  @override
  String? get adharNo => (origin as RegisterUserProvider).adharNo;
  @override
  String? get address => (origin as RegisterUserProvider).address;
  @override
  String? get locationState => (origin as RegisterUserProvider).locationState;
  @override
  String? get district => (origin as RegisterUserProvider).district;
  @override
  String? get pincode => (origin as RegisterUserProvider).pincode;
  @override
  String? get bankName => (origin as RegisterUserProvider).bankName;
  @override
  String? get bankBranch => (origin as RegisterUserProvider).bankBranch;
  @override
  String? get bankAccount => (origin as RegisterUserProvider).bankAccount;
  @override
  String? get ifscCode => (origin as RegisterUserProvider).ifscCode;
  @override
  String? get propDocType => (origin as RegisterUserProvider).propDocType;
  @override
  String? get propDocNumber => (origin as RegisterUserProvider).propDocNumber;
  @override
  String? get firmName => (origin as RegisterUserProvider).firmName;
  @override
  File? get panCardImage => (origin as RegisterUserProvider).panCardImage;
  @override
  File? get profileImage => (origin as RegisterUserProvider).profileImage;
  @override
  File? get chequeImage => (origin as RegisterUserProvider).chequeImage;
  @override
  File? get aadharImage => (origin as RegisterUserProvider).aadharImage;
  @override
  File? get adharBackImage => (origin as RegisterUserProvider).adharBackImage;
  @override
  File? get proprietorProof => (origin as RegisterUserProvider).proprietorProof;
}

String _$verifyOtpHash() => r'b36b4d9de00ac027b302118e15a47113b700feab';

/// See also [verifyOtp].
@ProviderFor(verifyOtp)
const verifyOtpProvider = VerifyOtpFamily();

/// See also [verifyOtp].
class VerifyOtpFamily extends Family<AsyncValue<OtpVerifyModel>> {
  /// See also [verifyOtp].
  const VerifyOtpFamily();

  /// See also [verifyOtp].
  VerifyOtpProvider call({
    String? panCard,
    String? otp,
  }) {
    return VerifyOtpProvider(
      panCard: panCard,
      otp: otp,
    );
  }

  @override
  VerifyOtpProvider getProviderOverride(
    covariant VerifyOtpProvider provider,
  ) {
    return call(
      panCard: provider.panCard,
      otp: provider.otp,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'verifyOtpProvider';
}

/// See also [verifyOtp].
class VerifyOtpProvider extends AutoDisposeFutureProvider<OtpVerifyModel> {
  /// See also [verifyOtp].
  VerifyOtpProvider({
    String? panCard,
    String? otp,
  }) : this._internal(
          (ref) => verifyOtp(
            ref as VerifyOtpRef,
            panCard: panCard,
            otp: otp,
          ),
          from: verifyOtpProvider,
          name: r'verifyOtpProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$verifyOtpHash,
          dependencies: VerifyOtpFamily._dependencies,
          allTransitiveDependencies: VerifyOtpFamily._allTransitiveDependencies,
          panCard: panCard,
          otp: otp,
        );

  VerifyOtpProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.panCard,
    required this.otp,
  }) : super.internal();

  final String? panCard;
  final String? otp;

  @override
  Override overrideWith(
    FutureOr<OtpVerifyModel> Function(VerifyOtpRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: VerifyOtpProvider._internal(
        (ref) => create(ref as VerifyOtpRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        panCard: panCard,
        otp: otp,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<OtpVerifyModel> createElement() {
    return _VerifyOtpProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is VerifyOtpProvider &&
        other.panCard == panCard &&
        other.otp == otp;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, panCard.hashCode);
    hash = _SystemHash.combine(hash, otp.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin VerifyOtpRef on AutoDisposeFutureProviderRef<OtpVerifyModel> {
  /// The parameter `panCard` of this provider.
  String? get panCard;

  /// The parameter `otp` of this provider.
  String? get otp;
}

class _VerifyOtpProviderElement
    extends AutoDisposeFutureProviderElement<OtpVerifyModel> with VerifyOtpRef {
  _VerifyOtpProviderElement(super.provider);

  @override
  String? get panCard => (origin as VerifyOtpProvider).panCard;
  @override
  String? get otp => (origin as VerifyOtpProvider).otp;
}

String _$loginHash() => r'759668ab01a83f8765bb1f01961fbb0fe0aceb51';

/// See also [login].
@ProviderFor(login)
const loginProvider = LoginFamily();

/// See also [login].
class LoginFamily extends Family<AsyncValue<Map<String, dynamic>>> {
  /// See also [login].
  const LoginFamily();

  /// See also [login].
  LoginProvider call({
    String? panNumber,
  }) {
    return LoginProvider(
      panNumber: panNumber,
    );
  }

  @override
  LoginProvider getProviderOverride(
    covariant LoginProvider provider,
  ) {
    return call(
      panNumber: provider.panNumber,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'loginProvider';
}

/// See also [login].
class LoginProvider extends AutoDisposeFutureProvider<Map<String, dynamic>> {
  /// See also [login].
  LoginProvider({
    String? panNumber,
  }) : this._internal(
          (ref) => login(
            ref as LoginRef,
            panNumber: panNumber,
          ),
          from: loginProvider,
          name: r'loginProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$loginHash,
          dependencies: LoginFamily._dependencies,
          allTransitiveDependencies: LoginFamily._allTransitiveDependencies,
          panNumber: panNumber,
        );

  LoginProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.panNumber,
  }) : super.internal();

  final String? panNumber;

  @override
  Override overrideWith(
    FutureOr<Map<String, dynamic>> Function(LoginRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: LoginProvider._internal(
        (ref) => create(ref as LoginRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        panNumber: panNumber,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Map<String, dynamic>> createElement() {
    return _LoginProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LoginProvider && other.panNumber == panNumber;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, panNumber.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin LoginRef on AutoDisposeFutureProviderRef<Map<String, dynamic>> {
  /// The parameter `panNumber` of this provider.
  String? get panNumber;
}

class _LoginProviderElement
    extends AutoDisposeFutureProviderElement<Map<String, dynamic>>
    with LoginRef {
  _LoginProviderElement(super.provider);

  @override
  String? get panNumber => (origin as LoginProvider).panNumber;
}

String _$logoutHash() => r'9849f181e3ae8f8fcf43b220c264071f4050ebb3';

/// See also [logout].
@ProviderFor(logout)
final logoutProvider = AutoDisposeFutureProvider<Map<String, dynamic>>.internal(
  logout,
  name: r'logoutProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$logoutHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef LogoutRef = AutoDisposeFutureProviderRef<Map<String, dynamic>>;
String _$loginInfoHash() => r'8c3fba4d6d52b0f873f501fac7356ac1f5cc33de';

/// See also [loginInfo].
@ProviderFor(loginInfo)
final loginInfoProvider = AutoDisposeFutureProvider<OtpVerifyModel>.internal(
  loginInfo,
  name: r'loginInfoProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$loginInfoHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef LoginInfoRef = AutoDisposeFutureProviderRef<OtpVerifyModel>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member