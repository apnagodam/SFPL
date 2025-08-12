// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AuthenticationService.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$registerUserHash() => r'18a585aeddf56cee0693b7fc1c2e576daccaf7e9';

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
    String? partnerDirectorCount,
    dynamic panCardImage,
    dynamic profileImage,
    dynamic chequeImage,
    dynamic aadharImage,
    dynamic adharBackImage,
    dynamic proprietorProof,
    dynamic moaAoa,
    dynamic boardResolution,
    dynamic directorProof,
    dynamic addressProof,
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
      partnerDirectorCount: partnerDirectorCount,
      panCardImage: panCardImage,
      profileImage: profileImage,
      chequeImage: chequeImage,
      aadharImage: aadharImage,
      adharBackImage: adharBackImage,
      proprietorProof: proprietorProof,
      moaAoa: moaAoa,
      boardResolution: boardResolution,
      directorProof: directorProof,
      addressProof: addressProof,
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
      partnerDirectorCount: provider.partnerDirectorCount,
      panCardImage: provider.panCardImage,
      profileImage: provider.profileImage,
      chequeImage: provider.chequeImage,
      aadharImage: provider.aadharImage,
      adharBackImage: provider.adharBackImage,
      proprietorProof: provider.proprietorProof,
      moaAoa: provider.moaAoa,
      boardResolution: provider.boardResolution,
      directorProof: provider.directorProof,
      addressProof: provider.addressProof,
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
    String? partnerDirectorCount,
    dynamic panCardImage,
    dynamic profileImage,
    dynamic chequeImage,
    dynamic aadharImage,
    dynamic adharBackImage,
    dynamic proprietorProof,
    dynamic moaAoa,
    dynamic boardResolution,
    dynamic directorProof,
    dynamic addressProof,
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
            partnerDirectorCount: partnerDirectorCount,
            panCardImage: panCardImage,
            profileImage: profileImage,
            chequeImage: chequeImage,
            aadharImage: aadharImage,
            adharBackImage: adharBackImage,
            proprietorProof: proprietorProof,
            moaAoa: moaAoa,
            boardResolution: boardResolution,
            directorProof: directorProof,
            addressProof: addressProof,
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
          partnerDirectorCount: partnerDirectorCount,
          panCardImage: panCardImage,
          profileImage: profileImage,
          chequeImage: chequeImage,
          aadharImage: aadharImage,
          adharBackImage: adharBackImage,
          proprietorProof: proprietorProof,
          moaAoa: moaAoa,
          boardResolution: boardResolution,
          directorProof: directorProof,
          addressProof: addressProof,
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
    required this.partnerDirectorCount,
    required this.panCardImage,
    required this.profileImage,
    required this.chequeImage,
    required this.aadharImage,
    required this.adharBackImage,
    required this.proprietorProof,
    required this.moaAoa,
    required this.boardResolution,
    required this.directorProof,
    required this.addressProof,
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
  final String? partnerDirectorCount;
  final dynamic panCardImage;
  final dynamic profileImage;
  final dynamic chequeImage;
  final dynamic aadharImage;
  final dynamic adharBackImage;
  final dynamic proprietorProof;
  final dynamic moaAoa;
  final dynamic boardResolution;
  final dynamic directorProof;
  final dynamic addressProof;

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
        partnerDirectorCount: partnerDirectorCount,
        panCardImage: panCardImage,
        profileImage: profileImage,
        chequeImage: chequeImage,
        aadharImage: aadharImage,
        adharBackImage: adharBackImage,
        proprietorProof: proprietorProof,
        moaAoa: moaAoa,
        boardResolution: boardResolution,
        directorProof: directorProof,
        addressProof: addressProof,
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
        other.partnerDirectorCount == partnerDirectorCount &&
        other.panCardImage == panCardImage &&
        other.profileImage == profileImage &&
        other.chequeImage == chequeImage &&
        other.aadharImage == aadharImage &&
        other.adharBackImage == adharBackImage &&
        other.proprietorProof == proprietorProof &&
        other.moaAoa == moaAoa &&
        other.boardResolution == boardResolution &&
        other.directorProof == directorProof &&
        other.addressProof == addressProof;
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
    hash = _SystemHash.combine(hash, partnerDirectorCount.hashCode);
    hash = _SystemHash.combine(hash, panCardImage.hashCode);
    hash = _SystemHash.combine(hash, profileImage.hashCode);
    hash = _SystemHash.combine(hash, chequeImage.hashCode);
    hash = _SystemHash.combine(hash, aadharImage.hashCode);
    hash = _SystemHash.combine(hash, adharBackImage.hashCode);
    hash = _SystemHash.combine(hash, proprietorProof.hashCode);
    hash = _SystemHash.combine(hash, moaAoa.hashCode);
    hash = _SystemHash.combine(hash, boardResolution.hashCode);
    hash = _SystemHash.combine(hash, directorProof.hashCode);
    hash = _SystemHash.combine(hash, addressProof.hashCode);

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

  /// The parameter `partnerDirectorCount` of this provider.
  String? get partnerDirectorCount;

  /// The parameter `panCardImage` of this provider.
  dynamic get panCardImage;

  /// The parameter `profileImage` of this provider.
  dynamic get profileImage;

  /// The parameter `chequeImage` of this provider.
  dynamic get chequeImage;

  /// The parameter `aadharImage` of this provider.
  dynamic get aadharImage;

  /// The parameter `adharBackImage` of this provider.
  dynamic get adharBackImage;

  /// The parameter `proprietorProof` of this provider.
  dynamic get proprietorProof;

  /// The parameter `moaAoa` of this provider.
  dynamic get moaAoa;

  /// The parameter `boardResolution` of this provider.
  dynamic get boardResolution;

  /// The parameter `directorProof` of this provider.
  dynamic get directorProof;

  /// The parameter `addressProof` of this provider.
  dynamic get addressProof;
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
  String? get partnerDirectorCount =>
      (origin as RegisterUserProvider).partnerDirectorCount;
  @override
  dynamic get panCardImage => (origin as RegisterUserProvider).panCardImage;
  @override
  dynamic get profileImage => (origin as RegisterUserProvider).profileImage;
  @override
  dynamic get chequeImage => (origin as RegisterUserProvider).chequeImage;
  @override
  dynamic get aadharImage => (origin as RegisterUserProvider).aadharImage;
  @override
  dynamic get adharBackImage => (origin as RegisterUserProvider).adharBackImage;
  @override
  dynamic get proprietorProof =>
      (origin as RegisterUserProvider).proprietorProof;
  @override
  dynamic get moaAoa => (origin as RegisterUserProvider).moaAoa;
  @override
  dynamic get boardResolution =>
      (origin as RegisterUserProvider).boardResolution;
  @override
  dynamic get directorProof => (origin as RegisterUserProvider).directorProof;
  @override
  dynamic get addressProof => (origin as RegisterUserProvider).addressProof;
}

String _$verifyOtpHash() => r'83db890c9d4987dc718cb654b0c2ac9177d35a3a';

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

String _$sendAadharOtpHash() => r'30449f729c1ec65a914c9497cec4a422905fd287';

/// See also [sendAadharOtp].
@ProviderFor(sendAadharOtp)
const sendAadharOtpProvider = SendAadharOtpFamily();

/// See also [sendAadharOtp].
class SendAadharOtpFamily extends Family<AsyncValue<AadharResponseModel>> {
  /// See also [sendAadharOtp].
  const SendAadharOtpFamily();

  /// See also [sendAadharOtp].
  SendAadharOtpProvider call({
    String? aadharNo,
  }) {
    return SendAadharOtpProvider(
      aadharNo: aadharNo,
    );
  }

  @override
  SendAadharOtpProvider getProviderOverride(
    covariant SendAadharOtpProvider provider,
  ) {
    return call(
      aadharNo: provider.aadharNo,
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
  String? get name => r'sendAadharOtpProvider';
}

/// See also [sendAadharOtp].
class SendAadharOtpProvider
    extends AutoDisposeFutureProvider<AadharResponseModel> {
  /// See also [sendAadharOtp].
  SendAadharOtpProvider({
    String? aadharNo,
  }) : this._internal(
          (ref) => sendAadharOtp(
            ref as SendAadharOtpRef,
            aadharNo: aadharNo,
          ),
          from: sendAadharOtpProvider,
          name: r'sendAadharOtpProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$sendAadharOtpHash,
          dependencies: SendAadharOtpFamily._dependencies,
          allTransitiveDependencies:
              SendAadharOtpFamily._allTransitiveDependencies,
          aadharNo: aadharNo,
        );

  SendAadharOtpProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.aadharNo,
  }) : super.internal();

  final String? aadharNo;

  @override
  Override overrideWith(
    FutureOr<AadharResponseModel> Function(SendAadharOtpRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SendAadharOtpProvider._internal(
        (ref) => create(ref as SendAadharOtpRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        aadharNo: aadharNo,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<AadharResponseModel> createElement() {
    return _SendAadharOtpProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SendAadharOtpProvider && other.aadharNo == aadharNo;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, aadharNo.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SendAadharOtpRef on AutoDisposeFutureProviderRef<AadharResponseModel> {
  /// The parameter `aadharNo` of this provider.
  String? get aadharNo;
}

class _SendAadharOtpProviderElement
    extends AutoDisposeFutureProviderElement<AadharResponseModel>
    with SendAadharOtpRef {
  _SendAadharOtpProviderElement(super.provider);

  @override
  String? get aadharNo => (origin as SendAadharOtpProvider).aadharNo;
}

String _$verifyAadharOtpHash() => r'6040b1dbb81d895f4f8421ba16dc07036be638ae';

/// See also [verifyAadharOtp].
@ProviderFor(verifyAadharOtp)
const verifyAadharOtpProvider = VerifyAadharOtpFamily();

/// See also [verifyAadharOtp].
class VerifyAadharOtpFamily extends Family<AsyncValue<AdharVerifyOtpModel>> {
  /// See also [verifyAadharOtp].
  const VerifyAadharOtpFamily();

  /// See also [verifyAadharOtp].
  VerifyAadharOtpProvider call({
    String? clientId,
    String? otp,
    String? aadharNumber,
  }) {
    return VerifyAadharOtpProvider(
      clientId: clientId,
      otp: otp,
      aadharNumber: aadharNumber,
    );
  }

  @override
  VerifyAadharOtpProvider getProviderOverride(
    covariant VerifyAadharOtpProvider provider,
  ) {
    return call(
      clientId: provider.clientId,
      otp: provider.otp,
      aadharNumber: provider.aadharNumber,
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
  String? get name => r'verifyAadharOtpProvider';
}

/// See also [verifyAadharOtp].
class VerifyAadharOtpProvider
    extends AutoDisposeFutureProvider<AdharVerifyOtpModel> {
  /// See also [verifyAadharOtp].
  VerifyAadharOtpProvider({
    String? clientId,
    String? otp,
    String? aadharNumber,
  }) : this._internal(
          (ref) => verifyAadharOtp(
            ref as VerifyAadharOtpRef,
            clientId: clientId,
            otp: otp,
            aadharNumber: aadharNumber,
          ),
          from: verifyAadharOtpProvider,
          name: r'verifyAadharOtpProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$verifyAadharOtpHash,
          dependencies: VerifyAadharOtpFamily._dependencies,
          allTransitiveDependencies:
              VerifyAadharOtpFamily._allTransitiveDependencies,
          clientId: clientId,
          otp: otp,
          aadharNumber: aadharNumber,
        );

  VerifyAadharOtpProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.clientId,
    required this.otp,
    required this.aadharNumber,
  }) : super.internal();

  final String? clientId;
  final String? otp;
  final String? aadharNumber;

  @override
  Override overrideWith(
    FutureOr<AdharVerifyOtpModel> Function(VerifyAadharOtpRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: VerifyAadharOtpProvider._internal(
        (ref) => create(ref as VerifyAadharOtpRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        clientId: clientId,
        otp: otp,
        aadharNumber: aadharNumber,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<AdharVerifyOtpModel> createElement() {
    return _VerifyAadharOtpProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is VerifyAadharOtpProvider &&
        other.clientId == clientId &&
        other.otp == otp &&
        other.aadharNumber == aadharNumber;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, clientId.hashCode);
    hash = _SystemHash.combine(hash, otp.hashCode);
    hash = _SystemHash.combine(hash, aadharNumber.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin VerifyAadharOtpRef on AutoDisposeFutureProviderRef<AdharVerifyOtpModel> {
  /// The parameter `clientId` of this provider.
  String? get clientId;

  /// The parameter `otp` of this provider.
  String? get otp;

  /// The parameter `aadharNumber` of this provider.
  String? get aadharNumber;
}

class _VerifyAadharOtpProviderElement
    extends AutoDisposeFutureProviderElement<AdharVerifyOtpModel>
    with VerifyAadharOtpRef {
  _VerifyAadharOtpProviderElement(super.provider);

  @override
  String? get clientId => (origin as VerifyAadharOtpProvider).clientId;
  @override
  String? get otp => (origin as VerifyAadharOtpProvider).otp;
  @override
  String? get aadharNumber => (origin as VerifyAadharOtpProvider).aadharNumber;
}

String _$loginHash() => r'e719bff1331dfbcc903989bdbceb5a55331cf4a6';

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
String _$loginInfoHash() => r'df444bcbbf4d2fd02e8aa6650d300d2dc28e9a8a';

/// See also [loginInfo].
@ProviderFor(loginInfo)
final loginInfoProvider = AutoDisposeStreamProvider<OtpVerifyModel>.internal(
  loginInfo,
  name: r'loginInfoProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$loginInfoHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef LoginInfoRef = AutoDisposeStreamProviderRef<OtpVerifyModel>;
String _$registerBnplHash() => r'9ddbe3357f1c0e3e554e60ff977e0074455a0683';

/// See also [registerBnpl].
@ProviderFor(registerBnpl)
const registerBnplProvider = RegisterBnplFamily();

/// See also [registerBnpl].
class RegisterBnplFamily extends Family<AsyncValue<BaseApiResponse>> {
  /// See also [registerBnpl].
  const RegisterBnplFamily();

  /// See also [registerBnpl].
  RegisterBnplProvider call({
    String? constitution,
    String? type,
    String? pancardNo,
    String? bnplName,
    String? phoneNo,
  }) {
    return RegisterBnplProvider(
      constitution: constitution,
      type: type,
      pancardNo: pancardNo,
      bnplName: bnplName,
      phoneNo: phoneNo,
    );
  }

  @override
  RegisterBnplProvider getProviderOverride(
    covariant RegisterBnplProvider provider,
  ) {
    return call(
      constitution: provider.constitution,
      type: provider.type,
      pancardNo: provider.pancardNo,
      bnplName: provider.bnplName,
      phoneNo: provider.phoneNo,
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
  String? get name => r'registerBnplProvider';
}

/// See also [registerBnpl].
class RegisterBnplProvider extends AutoDisposeFutureProvider<BaseApiResponse> {
  /// See also [registerBnpl].
  RegisterBnplProvider({
    String? constitution,
    String? type,
    String? pancardNo,
    String? bnplName,
    String? phoneNo,
  }) : this._internal(
          (ref) => registerBnpl(
            ref as RegisterBnplRef,
            constitution: constitution,
            type: type,
            pancardNo: pancardNo,
            bnplName: bnplName,
            phoneNo: phoneNo,
          ),
          from: registerBnplProvider,
          name: r'registerBnplProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$registerBnplHash,
          dependencies: RegisterBnplFamily._dependencies,
          allTransitiveDependencies:
              RegisterBnplFamily._allTransitiveDependencies,
          constitution: constitution,
          type: type,
          pancardNo: pancardNo,
          bnplName: bnplName,
          phoneNo: phoneNo,
        );

  RegisterBnplProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.constitution,
    required this.type,
    required this.pancardNo,
    required this.bnplName,
    required this.phoneNo,
  }) : super.internal();

  final String? constitution;
  final String? type;
  final String? pancardNo;
  final String? bnplName;
  final String? phoneNo;

  @override
  Override overrideWith(
    FutureOr<BaseApiResponse> Function(RegisterBnplRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RegisterBnplProvider._internal(
        (ref) => create(ref as RegisterBnplRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        constitution: constitution,
        type: type,
        pancardNo: pancardNo,
        bnplName: bnplName,
        phoneNo: phoneNo,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<BaseApiResponse> createElement() {
    return _RegisterBnplProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RegisterBnplProvider &&
        other.constitution == constitution &&
        other.type == type &&
        other.pancardNo == pancardNo &&
        other.bnplName == bnplName &&
        other.phoneNo == phoneNo;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, constitution.hashCode);
    hash = _SystemHash.combine(hash, type.hashCode);
    hash = _SystemHash.combine(hash, pancardNo.hashCode);
    hash = _SystemHash.combine(hash, bnplName.hashCode);
    hash = _SystemHash.combine(hash, phoneNo.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin RegisterBnplRef on AutoDisposeFutureProviderRef<BaseApiResponse> {
  /// The parameter `constitution` of this provider.
  String? get constitution;

  /// The parameter `type` of this provider.
  String? get type;

  /// The parameter `pancardNo` of this provider.
  String? get pancardNo;

  /// The parameter `bnplName` of this provider.
  String? get bnplName;

  /// The parameter `phoneNo` of this provider.
  String? get phoneNo;
}

class _RegisterBnplProviderElement
    extends AutoDisposeFutureProviderElement<BaseApiResponse>
    with RegisterBnplRef {
  _RegisterBnplProviderElement(super.provider);

  @override
  String? get constitution => (origin as RegisterBnplProvider).constitution;
  @override
  String? get type => (origin as RegisterBnplProvider).type;
  @override
  String? get pancardNo => (origin as RegisterBnplProvider).pancardNo;
  @override
  String? get bnplName => (origin as RegisterBnplProvider).bnplName;
  @override
  String? get phoneNo => (origin as RegisterBnplProvider).phoneNo;
}

String _$updateAddressHash() => r'a2b0950360d672ac3e51933dab2bef89598e7726';

/// See also [updateAddress].
@ProviderFor(updateAddress)
const updateAddressProvider = UpdateAddressFamily();

/// See also [updateAddress].
class UpdateAddressFamily extends Family<AsyncValue<BaseApiResponse>> {
  /// See also [updateAddress].
  const UpdateAddressFamily();

  /// See also [updateAddress].
  UpdateAddressProvider call({
    String? address,
    String? stateAddress,
    String? district,
    String? pincode,
  }) {
    return UpdateAddressProvider(
      address: address,
      stateAddress: stateAddress,
      district: district,
      pincode: pincode,
    );
  }

  @override
  UpdateAddressProvider getProviderOverride(
    covariant UpdateAddressProvider provider,
  ) {
    return call(
      address: provider.address,
      stateAddress: provider.stateAddress,
      district: provider.district,
      pincode: provider.pincode,
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
  String? get name => r'updateAddressProvider';
}

/// See also [updateAddress].
class UpdateAddressProvider extends AutoDisposeFutureProvider<BaseApiResponse> {
  /// See also [updateAddress].
  UpdateAddressProvider({
    String? address,
    String? stateAddress,
    String? district,
    String? pincode,
  }) : this._internal(
          (ref) => updateAddress(
            ref as UpdateAddressRef,
            address: address,
            stateAddress: stateAddress,
            district: district,
            pincode: pincode,
          ),
          from: updateAddressProvider,
          name: r'updateAddressProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$updateAddressHash,
          dependencies: UpdateAddressFamily._dependencies,
          allTransitiveDependencies:
              UpdateAddressFamily._allTransitiveDependencies,
          address: address,
          stateAddress: stateAddress,
          district: district,
          pincode: pincode,
        );

  UpdateAddressProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.address,
    required this.stateAddress,
    required this.district,
    required this.pincode,
  }) : super.internal();

  final String? address;
  final String? stateAddress;
  final String? district;
  final String? pincode;

  @override
  Override overrideWith(
    FutureOr<BaseApiResponse> Function(UpdateAddressRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UpdateAddressProvider._internal(
        (ref) => create(ref as UpdateAddressRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        address: address,
        stateAddress: stateAddress,
        district: district,
        pincode: pincode,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<BaseApiResponse> createElement() {
    return _UpdateAddressProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UpdateAddressProvider &&
        other.address == address &&
        other.stateAddress == stateAddress &&
        other.district == district &&
        other.pincode == pincode;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, address.hashCode);
    hash = _SystemHash.combine(hash, stateAddress.hashCode);
    hash = _SystemHash.combine(hash, district.hashCode);
    hash = _SystemHash.combine(hash, pincode.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin UpdateAddressRef on AutoDisposeFutureProviderRef<BaseApiResponse> {
  /// The parameter `address` of this provider.
  String? get address;

  /// The parameter `stateAddress` of this provider.
  String? get stateAddress;

  /// The parameter `district` of this provider.
  String? get district;

  /// The parameter `pincode` of this provider.
  String? get pincode;
}

class _UpdateAddressProviderElement
    extends AutoDisposeFutureProviderElement<BaseApiResponse>
    with UpdateAddressRef {
  _UpdateAddressProviderElement(super.provider);

  @override
  String? get address => (origin as UpdateAddressProvider).address;
  @override
  String? get stateAddress => (origin as UpdateAddressProvider).stateAddress;
  @override
  String? get district => (origin as UpdateAddressProvider).district;
  @override
  String? get pincode => (origin as UpdateAddressProvider).pincode;
}

String _$bankListHash() => r'f534e452a4bfa28afada87c0264bb9dc64e81b97';

/// See also [bankList].
@ProviderFor(bankList)
final bankListProvider = AutoDisposeStreamProvider<BankListModel>.internal(
  bankList,
  name: r'bankListProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$bankListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef BankListRef = AutoDisposeStreamProviderRef<BankListModel>;
String _$sendDirectorOtpHash() => r'd701f19cb5c727840f44fab94e680dc64754244a';

/// See also [sendDirectorOtp].
@ProviderFor(sendDirectorOtp)
const sendDirectorOtpProvider = SendDirectorOtpFamily();

/// See also [sendDirectorOtp].
class SendDirectorOtpFamily extends Family<AsyncValue<Map<String, dynamic>>> {
  /// See also [sendDirectorOtp].
  const SendDirectorOtpFamily();

  /// See also [sendDirectorOtp].
  SendDirectorOtpProvider call({
    required String personName,
    required String phoneNumber,
    required String panNo,
    required String aadharNo,
    required String otp,
    required dynamic profilePhoto,
  }) {
    return SendDirectorOtpProvider(
      personName: personName,
      phoneNumber: phoneNumber,
      panNo: panNo,
      aadharNo: aadharNo,
      otp: otp,
      profilePhoto: profilePhoto,
    );
  }

  @override
  SendDirectorOtpProvider getProviderOverride(
    covariant SendDirectorOtpProvider provider,
  ) {
    return call(
      personName: provider.personName,
      phoneNumber: provider.phoneNumber,
      panNo: provider.panNo,
      aadharNo: provider.aadharNo,
      otp: provider.otp,
      profilePhoto: provider.profilePhoto,
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
  String? get name => r'sendDirectorOtpProvider';
}

/// See also [sendDirectorOtp].
class SendDirectorOtpProvider
    extends AutoDisposeFutureProvider<Map<String, dynamic>> {
  /// See also [sendDirectorOtp].
  SendDirectorOtpProvider({
    required String personName,
    required String phoneNumber,
    required String panNo,
    required String aadharNo,
    required String otp,
    required dynamic profilePhoto,
  }) : this._internal(
          (ref) => sendDirectorOtp(
            ref as SendDirectorOtpRef,
            personName: personName,
            phoneNumber: phoneNumber,
            panNo: panNo,
            aadharNo: aadharNo,
            otp: otp,
            profilePhoto: profilePhoto,
          ),
          from: sendDirectorOtpProvider,
          name: r'sendDirectorOtpProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$sendDirectorOtpHash,
          dependencies: SendDirectorOtpFamily._dependencies,
          allTransitiveDependencies:
              SendDirectorOtpFamily._allTransitiveDependencies,
          personName: personName,
          phoneNumber: phoneNumber,
          panNo: panNo,
          aadharNo: aadharNo,
          otp: otp,
          profilePhoto: profilePhoto,
        );

  SendDirectorOtpProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.personName,
    required this.phoneNumber,
    required this.panNo,
    required this.aadharNo,
    required this.otp,
    required this.profilePhoto,
  }) : super.internal();

  final String personName;
  final String phoneNumber;
  final String panNo;
  final String aadharNo;
  final String otp;
  final dynamic profilePhoto;

  @override
  Override overrideWith(
    FutureOr<Map<String, dynamic>> Function(SendDirectorOtpRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SendDirectorOtpProvider._internal(
        (ref) => create(ref as SendDirectorOtpRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        personName: personName,
        phoneNumber: phoneNumber,
        panNo: panNo,
        aadharNo: aadharNo,
        otp: otp,
        profilePhoto: profilePhoto,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Map<String, dynamic>> createElement() {
    return _SendDirectorOtpProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SendDirectorOtpProvider &&
        other.personName == personName &&
        other.phoneNumber == phoneNumber &&
        other.panNo == panNo &&
        other.aadharNo == aadharNo &&
        other.otp == otp &&
        other.profilePhoto == profilePhoto;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, personName.hashCode);
    hash = _SystemHash.combine(hash, phoneNumber.hashCode);
    hash = _SystemHash.combine(hash, panNo.hashCode);
    hash = _SystemHash.combine(hash, aadharNo.hashCode);
    hash = _SystemHash.combine(hash, otp.hashCode);
    hash = _SystemHash.combine(hash, profilePhoto.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SendDirectorOtpRef on AutoDisposeFutureProviderRef<Map<String, dynamic>> {
  /// The parameter `personName` of this provider.
  String get personName;

  /// The parameter `phoneNumber` of this provider.
  String get phoneNumber;

  /// The parameter `panNo` of this provider.
  String get panNo;

  /// The parameter `aadharNo` of this provider.
  String get aadharNo;

  /// The parameter `otp` of this provider.
  String get otp;

  /// The parameter `profilePhoto` of this provider.
  dynamic get profilePhoto;
}

class _SendDirectorOtpProviderElement
    extends AutoDisposeFutureProviderElement<Map<String, dynamic>>
    with SendDirectorOtpRef {
  _SendDirectorOtpProviderElement(super.provider);

  @override
  String get personName => (origin as SendDirectorOtpProvider).personName;
  @override
  String get phoneNumber => (origin as SendDirectorOtpProvider).phoneNumber;
  @override
  String get panNo => (origin as SendDirectorOtpProvider).panNo;
  @override
  String get aadharNo => (origin as SendDirectorOtpProvider).aadharNo;
  @override
  String get otp => (origin as SendDirectorOtpProvider).otp;
  @override
  dynamic get profilePhoto => (origin as SendDirectorOtpProvider).profilePhoto;
}

String _$fetchAddedDirectorsHash() =>
    r'e7b419c42ad61a2b91a784149bdc956b1b246710';

/// See also [fetchAddedDirectors].
@ProviderFor(fetchAddedDirectors)
const fetchAddedDirectorsProvider = FetchAddedDirectorsFamily();

/// See also [fetchAddedDirectors].
class FetchAddedDirectorsFamily
    extends Family<AsyncValue<Map<String, dynamic>>> {
  /// See also [fetchAddedDirectors].
  const FetchAddedDirectorsFamily();

  /// See also [fetchAddedDirectors].
  FetchAddedDirectorsProvider call({
    String? panCardNo,
    String? phone,
  }) {
    return FetchAddedDirectorsProvider(
      panCardNo: panCardNo,
      phone: phone,
    );
  }

  @override
  FetchAddedDirectorsProvider getProviderOverride(
    covariant FetchAddedDirectorsProvider provider,
  ) {
    return call(
      panCardNo: provider.panCardNo,
      phone: provider.phone,
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
  String? get name => r'fetchAddedDirectorsProvider';
}

/// See also [fetchAddedDirectors].
class FetchAddedDirectorsProvider
    extends AutoDisposeFutureProvider<Map<String, dynamic>> {
  /// See also [fetchAddedDirectors].
  FetchAddedDirectorsProvider({
    String? panCardNo,
    String? phone,
  }) : this._internal(
          (ref) => fetchAddedDirectors(
            ref as FetchAddedDirectorsRef,
            panCardNo: panCardNo,
            phone: phone,
          ),
          from: fetchAddedDirectorsProvider,
          name: r'fetchAddedDirectorsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchAddedDirectorsHash,
          dependencies: FetchAddedDirectorsFamily._dependencies,
          allTransitiveDependencies:
              FetchAddedDirectorsFamily._allTransitiveDependencies,
          panCardNo: panCardNo,
          phone: phone,
        );

  FetchAddedDirectorsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.panCardNo,
    required this.phone,
  }) : super.internal();

  final String? panCardNo;
  final String? phone;

  @override
  Override overrideWith(
    FutureOr<Map<String, dynamic>> Function(FetchAddedDirectorsRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchAddedDirectorsProvider._internal(
        (ref) => create(ref as FetchAddedDirectorsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        panCardNo: panCardNo,
        phone: phone,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Map<String, dynamic>> createElement() {
    return _FetchAddedDirectorsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchAddedDirectorsProvider &&
        other.panCardNo == panCardNo &&
        other.phone == phone;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, panCardNo.hashCode);
    hash = _SystemHash.combine(hash, phone.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FetchAddedDirectorsRef
    on AutoDisposeFutureProviderRef<Map<String, dynamic>> {
  /// The parameter `panCardNo` of this provider.
  String? get panCardNo;

  /// The parameter `phone` of this provider.
  String? get phone;
}

class _FetchAddedDirectorsProviderElement
    extends AutoDisposeFutureProviderElement<Map<String, dynamic>>
    with FetchAddedDirectorsRef {
  _FetchAddedDirectorsProviderElement(super.provider);

  @override
  String? get panCardNo => (origin as FetchAddedDirectorsProvider).panCardNo;
  @override
  String? get phone => (origin as FetchAddedDirectorsProvider).phone;
}

String _$submitDirectorDetailsHash() =>
    r'b85b4baefbcd8070c6ff75b1cd4fb8112df27314';

/// See also [submitDirectorDetails].
@ProviderFor(submitDirectorDetails)
const submitDirectorDetailsProvider = SubmitDirectorDetailsFamily();

/// See also [submitDirectorDetails].
class SubmitDirectorDetailsFamily
    extends Family<AsyncValue<Map<String, dynamic>>> {
  /// See also [submitDirectorDetails].
  const SubmitDirectorDetailsFamily();

  /// See also [submitDirectorDetails].
  SubmitDirectorDetailsProvider call({
    required String personName,
    required String phoneNumber,
    required String panNo,
    required String aadharNo,
    required String otp,
    required dynamic profilePhoto,
  }) {
    return SubmitDirectorDetailsProvider(
      personName: personName,
      phoneNumber: phoneNumber,
      panNo: panNo,
      aadharNo: aadharNo,
      otp: otp,
      profilePhoto: profilePhoto,
    );
  }

  @override
  SubmitDirectorDetailsProvider getProviderOverride(
    covariant SubmitDirectorDetailsProvider provider,
  ) {
    return call(
      personName: provider.personName,
      phoneNumber: provider.phoneNumber,
      panNo: provider.panNo,
      aadharNo: provider.aadharNo,
      otp: provider.otp,
      profilePhoto: provider.profilePhoto,
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
  String? get name => r'submitDirectorDetailsProvider';
}

/// See also [submitDirectorDetails].
class SubmitDirectorDetailsProvider
    extends AutoDisposeFutureProvider<Map<String, dynamic>> {
  /// See also [submitDirectorDetails].
  SubmitDirectorDetailsProvider({
    required String personName,
    required String phoneNumber,
    required String panNo,
    required String aadharNo,
    required String otp,
    required dynamic profilePhoto,
  }) : this._internal(
          (ref) => submitDirectorDetails(
            ref as SubmitDirectorDetailsRef,
            personName: personName,
            phoneNumber: phoneNumber,
            panNo: panNo,
            aadharNo: aadharNo,
            otp: otp,
            profilePhoto: profilePhoto,
          ),
          from: submitDirectorDetailsProvider,
          name: r'submitDirectorDetailsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$submitDirectorDetailsHash,
          dependencies: SubmitDirectorDetailsFamily._dependencies,
          allTransitiveDependencies:
              SubmitDirectorDetailsFamily._allTransitiveDependencies,
          personName: personName,
          phoneNumber: phoneNumber,
          panNo: panNo,
          aadharNo: aadharNo,
          otp: otp,
          profilePhoto: profilePhoto,
        );

  SubmitDirectorDetailsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.personName,
    required this.phoneNumber,
    required this.panNo,
    required this.aadharNo,
    required this.otp,
    required this.profilePhoto,
  }) : super.internal();

  final String personName;
  final String phoneNumber;
  final String panNo;
  final String aadharNo;
  final String otp;
  final dynamic profilePhoto;

  @override
  Override overrideWith(
    FutureOr<Map<String, dynamic>> Function(SubmitDirectorDetailsRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SubmitDirectorDetailsProvider._internal(
        (ref) => create(ref as SubmitDirectorDetailsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        personName: personName,
        phoneNumber: phoneNumber,
        panNo: panNo,
        aadharNo: aadharNo,
        otp: otp,
        profilePhoto: profilePhoto,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Map<String, dynamic>> createElement() {
    return _SubmitDirectorDetailsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SubmitDirectorDetailsProvider &&
        other.personName == personName &&
        other.phoneNumber == phoneNumber &&
        other.panNo == panNo &&
        other.aadharNo == aadharNo &&
        other.otp == otp &&
        other.profilePhoto == profilePhoto;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, personName.hashCode);
    hash = _SystemHash.combine(hash, phoneNumber.hashCode);
    hash = _SystemHash.combine(hash, panNo.hashCode);
    hash = _SystemHash.combine(hash, aadharNo.hashCode);
    hash = _SystemHash.combine(hash, otp.hashCode);
    hash = _SystemHash.combine(hash, profilePhoto.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SubmitDirectorDetailsRef
    on AutoDisposeFutureProviderRef<Map<String, dynamic>> {
  /// The parameter `personName` of this provider.
  String get personName;

  /// The parameter `phoneNumber` of this provider.
  String get phoneNumber;

  /// The parameter `panNo` of this provider.
  String get panNo;

  /// The parameter `aadharNo` of this provider.
  String get aadharNo;

  /// The parameter `otp` of this provider.
  String get otp;

  /// The parameter `profilePhoto` of this provider.
  dynamic get profilePhoto;
}

class _SubmitDirectorDetailsProviderElement
    extends AutoDisposeFutureProviderElement<Map<String, dynamic>>
    with SubmitDirectorDetailsRef {
  _SubmitDirectorDetailsProviderElement(super.provider);

  @override
  String get personName => (origin as SubmitDirectorDetailsProvider).personName;
  @override
  String get phoneNumber =>
      (origin as SubmitDirectorDetailsProvider).phoneNumber;
  @override
  String get panNo => (origin as SubmitDirectorDetailsProvider).panNo;
  @override
  String get aadharNo => (origin as SubmitDirectorDetailsProvider).aadharNo;
  @override
  String get otp => (origin as SubmitDirectorDetailsProvider).otp;
  @override
  dynamic get profilePhoto =>
      (origin as SubmitDirectorDetailsProvider).profilePhoto;
}

String _$fetchRegisteredUserDataHash() =>
    r'2f2bd545f816b661eaa8bb9504217ad0c7749608';

/// See also [fetchRegisteredUserData].
@ProviderFor(fetchRegisteredUserData)
const fetchRegisteredUserDataProvider = FetchRegisteredUserDataFamily();

/// See also [fetchRegisteredUserData].
class FetchRegisteredUserDataFamily
    extends Family<AsyncValue<Map<String, dynamic>>> {
  /// See also [fetchRegisteredUserData].
  const FetchRegisteredUserDataFamily();

  /// See also [fetchRegisteredUserData].
  FetchRegisteredUserDataProvider call({
    required String panCardNo,
    required String phone,
  }) {
    return FetchRegisteredUserDataProvider(
      panCardNo: panCardNo,
      phone: phone,
    );
  }

  @override
  FetchRegisteredUserDataProvider getProviderOverride(
    covariant FetchRegisteredUserDataProvider provider,
  ) {
    return call(
      panCardNo: provider.panCardNo,
      phone: provider.phone,
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
  String? get name => r'fetchRegisteredUserDataProvider';
}

/// See also [fetchRegisteredUserData].
class FetchRegisteredUserDataProvider
    extends AutoDisposeStreamProvider<Map<String, dynamic>> {
  /// See also [fetchRegisteredUserData].
  FetchRegisteredUserDataProvider({
    required String panCardNo,
    required String phone,
  }) : this._internal(
          (ref) => fetchRegisteredUserData(
            ref as FetchRegisteredUserDataRef,
            panCardNo: panCardNo,
            phone: phone,
          ),
          from: fetchRegisteredUserDataProvider,
          name: r'fetchRegisteredUserDataProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchRegisteredUserDataHash,
          dependencies: FetchRegisteredUserDataFamily._dependencies,
          allTransitiveDependencies:
              FetchRegisteredUserDataFamily._allTransitiveDependencies,
          panCardNo: panCardNo,
          phone: phone,
        );

  FetchRegisteredUserDataProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.panCardNo,
    required this.phone,
  }) : super.internal();

  final String panCardNo;
  final String phone;

  @override
  Override overrideWith(
    Stream<Map<String, dynamic>> Function(FetchRegisteredUserDataRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchRegisteredUserDataProvider._internal(
        (ref) => create(ref as FetchRegisteredUserDataRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        panCardNo: panCardNo,
        phone: phone,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<Map<String, dynamic>> createElement() {
    return _FetchRegisteredUserDataProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchRegisteredUserDataProvider &&
        other.panCardNo == panCardNo &&
        other.phone == phone;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, panCardNo.hashCode);
    hash = _SystemHash.combine(hash, phone.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FetchRegisteredUserDataRef
    on AutoDisposeStreamProviderRef<Map<String, dynamic>> {
  /// The parameter `panCardNo` of this provider.
  String get panCardNo;

  /// The parameter `phone` of this provider.
  String get phone;
}

class _FetchRegisteredUserDataProviderElement
    extends AutoDisposeStreamProviderElement<Map<String, dynamic>>
    with FetchRegisteredUserDataRef {
  _FetchRegisteredUserDataProviderElement(super.provider);

  @override
  String get panCardNo => (origin as FetchRegisteredUserDataProvider).panCardNo;
  @override
  String get phone => (origin as FetchRegisteredUserDataProvider).phone;
}

String _$verifyRegisteredUserOtpHash() =>
    r'fcaadd5cf4e90a546729fc8638a1d0fd49cef118';

/// See also [verifyRegisteredUserOtp].
@ProviderFor(verifyRegisteredUserOtp)
const verifyRegisteredUserOtpProvider = VerifyRegisteredUserOtpFamily();

/// See also [verifyRegisteredUserOtp].
class VerifyRegisteredUserOtpFamily
    extends Family<AsyncValue<Map<String, dynamic>>> {
  /// See also [verifyRegisteredUserOtp].
  const VerifyRegisteredUserOtpFamily();

  /// See also [verifyRegisteredUserOtp].
  VerifyRegisteredUserOtpProvider call({
    required Map<String, dynamic> data,
  }) {
    return VerifyRegisteredUserOtpProvider(
      data: data,
    );
  }

  @override
  VerifyRegisteredUserOtpProvider getProviderOverride(
    covariant VerifyRegisteredUserOtpProvider provider,
  ) {
    return call(
      data: provider.data,
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
  String? get name => r'verifyRegisteredUserOtpProvider';
}

/// See also [verifyRegisteredUserOtp].
class VerifyRegisteredUserOtpProvider
    extends AutoDisposeFutureProvider<Map<String, dynamic>> {
  /// See also [verifyRegisteredUserOtp].
  VerifyRegisteredUserOtpProvider({
    required Map<String, dynamic> data,
  }) : this._internal(
          (ref) => verifyRegisteredUserOtp(
            ref as VerifyRegisteredUserOtpRef,
            data: data,
          ),
          from: verifyRegisteredUserOtpProvider,
          name: r'verifyRegisteredUserOtpProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$verifyRegisteredUserOtpHash,
          dependencies: VerifyRegisteredUserOtpFamily._dependencies,
          allTransitiveDependencies:
              VerifyRegisteredUserOtpFamily._allTransitiveDependencies,
          data: data,
        );

  VerifyRegisteredUserOtpProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.data,
  }) : super.internal();

  final Map<String, dynamic> data;

  @override
  Override overrideWith(
    FutureOr<Map<String, dynamic>> Function(VerifyRegisteredUserOtpRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: VerifyRegisteredUserOtpProvider._internal(
        (ref) => create(ref as VerifyRegisteredUserOtpRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        data: data,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Map<String, dynamic>> createElement() {
    return _VerifyRegisteredUserOtpProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is VerifyRegisteredUserOtpProvider && other.data == data;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, data.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin VerifyRegisteredUserOtpRef
    on AutoDisposeFutureProviderRef<Map<String, dynamic>> {
  /// The parameter `data` of this provider.
  Map<String, dynamic> get data;
}

class _VerifyRegisteredUserOtpProviderElement
    extends AutoDisposeFutureProviderElement<Map<String, dynamic>>
    with VerifyRegisteredUserOtpRef {
  _VerifyRegisteredUserOtpProviderElement(super.provider);

  @override
  Map<String, dynamic> get data =>
      (origin as VerifyRegisteredUserOtpProvider).data;
}

String _$sendAadharVerificationOtpHash() =>
    r'33c046548a5efcfaa8626d41157194bff99df169';

/// See also [sendAadharVerificationOtp].
@ProviderFor(sendAadharVerificationOtp)
const sendAadharVerificationOtpProvider = SendAadharVerificationOtpFamily();

/// See also [sendAadharVerificationOtp].
class SendAadharVerificationOtpFamily
    extends Family<AsyncValue<Map<String, dynamic>>> {
  /// See also [sendAadharVerificationOtp].
  const SendAadharVerificationOtpFamily();

  /// See also [sendAadharVerificationOtp].
  SendAadharVerificationOtpProvider call({
    required String aadharNo,
  }) {
    return SendAadharVerificationOtpProvider(
      aadharNo: aadharNo,
    );
  }

  @override
  SendAadharVerificationOtpProvider getProviderOverride(
    covariant SendAadharVerificationOtpProvider provider,
  ) {
    return call(
      aadharNo: provider.aadharNo,
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
  String? get name => r'sendAadharVerificationOtpProvider';
}

/// See also [sendAadharVerificationOtp].
class SendAadharVerificationOtpProvider
    extends AutoDisposeFutureProvider<Map<String, dynamic>> {
  /// See also [sendAadharVerificationOtp].
  SendAadharVerificationOtpProvider({
    required String aadharNo,
  }) : this._internal(
          (ref) => sendAadharVerificationOtp(
            ref as SendAadharVerificationOtpRef,
            aadharNo: aadharNo,
          ),
          from: sendAadharVerificationOtpProvider,
          name: r'sendAadharVerificationOtpProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$sendAadharVerificationOtpHash,
          dependencies: SendAadharVerificationOtpFamily._dependencies,
          allTransitiveDependencies:
              SendAadharVerificationOtpFamily._allTransitiveDependencies,
          aadharNo: aadharNo,
        );

  SendAadharVerificationOtpProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.aadharNo,
  }) : super.internal();

  final String aadharNo;

  @override
  Override overrideWith(
    FutureOr<Map<String, dynamic>> Function(
            SendAadharVerificationOtpRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SendAadharVerificationOtpProvider._internal(
        (ref) => create(ref as SendAadharVerificationOtpRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        aadharNo: aadharNo,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Map<String, dynamic>> createElement() {
    return _SendAadharVerificationOtpProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SendAadharVerificationOtpProvider &&
        other.aadharNo == aadharNo;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, aadharNo.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SendAadharVerificationOtpRef
    on AutoDisposeFutureProviderRef<Map<String, dynamic>> {
  /// The parameter `aadharNo` of this provider.
  String get aadharNo;
}

class _SendAadharVerificationOtpProviderElement
    extends AutoDisposeFutureProviderElement<Map<String, dynamic>>
    with SendAadharVerificationOtpRef {
  _SendAadharVerificationOtpProviderElement(super.provider);

  @override
  String get aadharNo => (origin as SendAadharVerificationOtpProvider).aadharNo;
}

String _$verifyAadharVerificationOtpHash() =>
    r'5c81d08de1eb5d75c2d68053e30aeabe9be0906c';

/// See also [verifyAadharVerificationOtp].
@ProviderFor(verifyAadharVerificationOtp)
const verifyAadharVerificationOtpProvider = VerifyAadharVerificationOtpFamily();

/// See also [verifyAadharVerificationOtp].
class VerifyAadharVerificationOtpFamily
    extends Family<AsyncValue<Map<String, dynamic>>> {
  /// See also [verifyAadharVerificationOtp].
  const VerifyAadharVerificationOtpFamily();

  /// See also [verifyAadharVerificationOtp].
  VerifyAadharVerificationOtpProvider call({
    required String aadharNo,
    required String requestId,
    required String otp,
  }) {
    return VerifyAadharVerificationOtpProvider(
      aadharNo: aadharNo,
      requestId: requestId,
      otp: otp,
    );
  }

  @override
  VerifyAadharVerificationOtpProvider getProviderOverride(
    covariant VerifyAadharVerificationOtpProvider provider,
  ) {
    return call(
      aadharNo: provider.aadharNo,
      requestId: provider.requestId,
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
  String? get name => r'verifyAadharVerificationOtpProvider';
}

/// See also [verifyAadharVerificationOtp].
class VerifyAadharVerificationOtpProvider
    extends AutoDisposeFutureProvider<Map<String, dynamic>> {
  /// See also [verifyAadharVerificationOtp].
  VerifyAadharVerificationOtpProvider({
    required String aadharNo,
    required String requestId,
    required String otp,
  }) : this._internal(
          (ref) => verifyAadharVerificationOtp(
            ref as VerifyAadharVerificationOtpRef,
            aadharNo: aadharNo,
            requestId: requestId,
            otp: otp,
          ),
          from: verifyAadharVerificationOtpProvider,
          name: r'verifyAadharVerificationOtpProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$verifyAadharVerificationOtpHash,
          dependencies: VerifyAadharVerificationOtpFamily._dependencies,
          allTransitiveDependencies:
              VerifyAadharVerificationOtpFamily._allTransitiveDependencies,
          aadharNo: aadharNo,
          requestId: requestId,
          otp: otp,
        );

  VerifyAadharVerificationOtpProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.aadharNo,
    required this.requestId,
    required this.otp,
  }) : super.internal();

  final String aadharNo;
  final String requestId;
  final String otp;

  @override
  Override overrideWith(
    FutureOr<Map<String, dynamic>> Function(
            VerifyAadharVerificationOtpRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: VerifyAadharVerificationOtpProvider._internal(
        (ref) => create(ref as VerifyAadharVerificationOtpRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        aadharNo: aadharNo,
        requestId: requestId,
        otp: otp,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Map<String, dynamic>> createElement() {
    return _VerifyAadharVerificationOtpProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is VerifyAadharVerificationOtpProvider &&
        other.aadharNo == aadharNo &&
        other.requestId == requestId &&
        other.otp == otp;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, aadharNo.hashCode);
    hash = _SystemHash.combine(hash, requestId.hashCode);
    hash = _SystemHash.combine(hash, otp.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin VerifyAadharVerificationOtpRef
    on AutoDisposeFutureProviderRef<Map<String, dynamic>> {
  /// The parameter `aadharNo` of this provider.
  String get aadharNo;

  /// The parameter `requestId` of this provider.
  String get requestId;

  /// The parameter `otp` of this provider.
  String get otp;
}

class _VerifyAadharVerificationOtpProviderElement
    extends AutoDisposeFutureProviderElement<Map<String, dynamic>>
    with VerifyAadharVerificationOtpRef {
  _VerifyAadharVerificationOtpProviderElement(super.provider);

  @override
  String get aadharNo =>
      (origin as VerifyAadharVerificationOtpProvider).aadharNo;
  @override
  String get requestId =>
      (origin as VerifyAadharVerificationOtpProvider).requestId;
  @override
  String get otp => (origin as VerifyAadharVerificationOtpProvider).otp;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
