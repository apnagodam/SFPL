// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PartnersDirectorsService.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$directorsPartnersListHash() =>
    r'd76825882ef6b2d69dc27bea0366d2b973edd93d';

/// See also [directorsPartnersList].
@ProviderFor(directorsPartnersList)
final directorsPartnersListProvider =
    AutoDisposeStreamProvider<ListOfDirectorsModel>.internal(
  directorsPartnersList,
  name: r'directorsPartnersListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$directorsPartnersListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef DirectorsPartnersListRef
    = AutoDisposeStreamProviderRef<ListOfDirectorsModel>;
String _$sendVerifyDirectorOtpHash() =>
    r'feea144e3cbde26257ced06d00c4f770fc236aba';

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

/// See also [sendVerifyDirectorOtp].
@ProviderFor(sendVerifyDirectorOtp)
const sendVerifyDirectorOtpProvider = SendVerifyDirectorOtpFamily();

/// See also [sendVerifyDirectorOtp].
class SendVerifyDirectorOtpFamily
    extends Family<AsyncValue<Map<String, dynamic>>> {
  /// See also [sendVerifyDirectorOtp].
  const SendVerifyDirectorOtpFamily();

  /// See also [sendVerifyDirectorOtp].
  SendVerifyDirectorOtpProvider call({
    String? phoneNumber,
    String? id,
  }) {
    return SendVerifyDirectorOtpProvider(
      phoneNumber: phoneNumber,
      id: id,
    );
  }

  @override
  SendVerifyDirectorOtpProvider getProviderOverride(
    covariant SendVerifyDirectorOtpProvider provider,
  ) {
    return call(
      phoneNumber: provider.phoneNumber,
      id: provider.id,
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
  String? get name => r'sendVerifyDirectorOtpProvider';
}

/// See also [sendVerifyDirectorOtp].
class SendVerifyDirectorOtpProvider
    extends AutoDisposeFutureProvider<Map<String, dynamic>> {
  /// See also [sendVerifyDirectorOtp].
  SendVerifyDirectorOtpProvider({
    String? phoneNumber,
    String? id,
  }) : this._internal(
          (ref) => sendVerifyDirectorOtp(
            ref as SendVerifyDirectorOtpRef,
            phoneNumber: phoneNumber,
            id: id,
          ),
          from: sendVerifyDirectorOtpProvider,
          name: r'sendVerifyDirectorOtpProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$sendVerifyDirectorOtpHash,
          dependencies: SendVerifyDirectorOtpFamily._dependencies,
          allTransitiveDependencies:
              SendVerifyDirectorOtpFamily._allTransitiveDependencies,
          phoneNumber: phoneNumber,
          id: id,
        );

  SendVerifyDirectorOtpProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.phoneNumber,
    required this.id,
  }) : super.internal();

  final String? phoneNumber;
  final String? id;

  @override
  Override overrideWith(
    FutureOr<Map<String, dynamic>> Function(SendVerifyDirectorOtpRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SendVerifyDirectorOtpProvider._internal(
        (ref) => create(ref as SendVerifyDirectorOtpRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        phoneNumber: phoneNumber,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Map<String, dynamic>> createElement() {
    return _SendVerifyDirectorOtpProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SendVerifyDirectorOtpProvider &&
        other.phoneNumber == phoneNumber &&
        other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, phoneNumber.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SendVerifyDirectorOtpRef
    on AutoDisposeFutureProviderRef<Map<String, dynamic>> {
  /// The parameter `phoneNumber` of this provider.
  String? get phoneNumber;

  /// The parameter `id` of this provider.
  String? get id;
}

class _SendVerifyDirectorOtpProviderElement
    extends AutoDisposeFutureProviderElement<Map<String, dynamic>>
    with SendVerifyDirectorOtpRef {
  _SendVerifyDirectorOtpProviderElement(super.provider);

  @override
  String? get phoneNumber =>
      (origin as SendVerifyDirectorOtpProvider).phoneNumber;
  @override
  String? get id => (origin as SendVerifyDirectorOtpProvider).id;
}

String _$editDirectorPartnerHash() =>
    r'b424fed3a4c407a2b4e13311cae62a8757d85466';

/// See also [editDirectorPartner].
@ProviderFor(editDirectorPartner)
const editDirectorPartnerProvider = EditDirectorPartnerFamily();

/// See also [editDirectorPartner].
class EditDirectorPartnerFamily
    extends Family<AsyncValue<Map<String, dynamic>>> {
  /// See also [editDirectorPartner].
  const EditDirectorPartnerFamily();

  /// See also [editDirectorPartner].
  EditDirectorPartnerProvider call({
    required String personName,
    required String id,
    required String phoneNumber,
    required String panNo,
    required String aadharNo,
    required String otp,
    File? profilePhoto,
  }) {
    return EditDirectorPartnerProvider(
      personName: personName,
      id: id,
      phoneNumber: phoneNumber,
      panNo: panNo,
      aadharNo: aadharNo,
      otp: otp,
      profilePhoto: profilePhoto,
    );
  }

  @override
  EditDirectorPartnerProvider getProviderOverride(
    covariant EditDirectorPartnerProvider provider,
  ) {
    return call(
      personName: provider.personName,
      id: provider.id,
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
  String? get name => r'editDirectorPartnerProvider';
}

/// See also [editDirectorPartner].
class EditDirectorPartnerProvider
    extends AutoDisposeFutureProvider<Map<String, dynamic>> {
  /// See also [editDirectorPartner].
  EditDirectorPartnerProvider({
    required String personName,
    required String id,
    required String phoneNumber,
    required String panNo,
    required String aadharNo,
    required String otp,
    File? profilePhoto,
  }) : this._internal(
          (ref) => editDirectorPartner(
            ref as EditDirectorPartnerRef,
            personName: personName,
            id: id,
            phoneNumber: phoneNumber,
            panNo: panNo,
            aadharNo: aadharNo,
            otp: otp,
            profilePhoto: profilePhoto,
          ),
          from: editDirectorPartnerProvider,
          name: r'editDirectorPartnerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$editDirectorPartnerHash,
          dependencies: EditDirectorPartnerFamily._dependencies,
          allTransitiveDependencies:
              EditDirectorPartnerFamily._allTransitiveDependencies,
          personName: personName,
          id: id,
          phoneNumber: phoneNumber,
          panNo: panNo,
          aadharNo: aadharNo,
          otp: otp,
          profilePhoto: profilePhoto,
        );

  EditDirectorPartnerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.personName,
    required this.id,
    required this.phoneNumber,
    required this.panNo,
    required this.aadharNo,
    required this.otp,
    required this.profilePhoto,
  }) : super.internal();

  final String personName;
  final String id;
  final String phoneNumber;
  final String panNo;
  final String aadharNo;
  final String otp;
  final File? profilePhoto;

  @override
  Override overrideWith(
    FutureOr<Map<String, dynamic>> Function(EditDirectorPartnerRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: EditDirectorPartnerProvider._internal(
        (ref) => create(ref as EditDirectorPartnerRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        personName: personName,
        id: id,
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
    return _EditDirectorPartnerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is EditDirectorPartnerProvider &&
        other.personName == personName &&
        other.id == id &&
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
    hash = _SystemHash.combine(hash, id.hashCode);
    hash = _SystemHash.combine(hash, phoneNumber.hashCode);
    hash = _SystemHash.combine(hash, panNo.hashCode);
    hash = _SystemHash.combine(hash, aadharNo.hashCode);
    hash = _SystemHash.combine(hash, otp.hashCode);
    hash = _SystemHash.combine(hash, profilePhoto.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin EditDirectorPartnerRef
    on AutoDisposeFutureProviderRef<Map<String, dynamic>> {
  /// The parameter `personName` of this provider.
  String get personName;

  /// The parameter `id` of this provider.
  String get id;

  /// The parameter `phoneNumber` of this provider.
  String get phoneNumber;

  /// The parameter `panNo` of this provider.
  String get panNo;

  /// The parameter `aadharNo` of this provider.
  String get aadharNo;

  /// The parameter `otp` of this provider.
  String get otp;

  /// The parameter `profilePhoto` of this provider.
  File? get profilePhoto;
}

class _EditDirectorPartnerProviderElement
    extends AutoDisposeFutureProviderElement<Map<String, dynamic>>
    with EditDirectorPartnerRef {
  _EditDirectorPartnerProviderElement(super.provider);

  @override
  String get personName => (origin as EditDirectorPartnerProvider).personName;
  @override
  String get id => (origin as EditDirectorPartnerProvider).id;
  @override
  String get phoneNumber => (origin as EditDirectorPartnerProvider).phoneNumber;
  @override
  String get panNo => (origin as EditDirectorPartnerProvider).panNo;
  @override
  String get aadharNo => (origin as EditDirectorPartnerProvider).aadharNo;
  @override
  String get otp => (origin as EditDirectorPartnerProvider).otp;
  @override
  File? get profilePhoto =>
      (origin as EditDirectorPartnerProvider).profilePhoto;
}

String _$authorisationLetterHash() =>
    r'0f80f2840cc3b76ada18b2416aa8c587a3d7f0b3';

/// See also [authorisationLetter].
@ProviderFor(authorisationLetter)
const authorisationLetterProvider = AuthorisationLetterFamily();

/// See also [authorisationLetter].
class AuthorisationLetterFamily
    extends Family<AsyncValue<Map<String, dynamic>>> {
  /// See also [authorisationLetter].
  const AuthorisationLetterFamily();

  /// See also [authorisationLetter].
  AuthorisationLetterProvider call({
    required String id,
  }) {
    return AuthorisationLetterProvider(
      id: id,
    );
  }

  @override
  AuthorisationLetterProvider getProviderOverride(
    covariant AuthorisationLetterProvider provider,
  ) {
    return call(
      id: provider.id,
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
  String? get name => r'authorisationLetterProvider';
}

/// See also [authorisationLetter].
class AuthorisationLetterProvider
    extends AutoDisposeFutureProvider<Map<String, dynamic>> {
  /// See also [authorisationLetter].
  AuthorisationLetterProvider({
    required String id,
  }) : this._internal(
          (ref) => authorisationLetter(
            ref as AuthorisationLetterRef,
            id: id,
          ),
          from: authorisationLetterProvider,
          name: r'authorisationLetterProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$authorisationLetterHash,
          dependencies: AuthorisationLetterFamily._dependencies,
          allTransitiveDependencies:
              AuthorisationLetterFamily._allTransitiveDependencies,
          id: id,
        );

  AuthorisationLetterProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  Override overrideWith(
    FutureOr<Map<String, dynamic>> Function(AuthorisationLetterRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AuthorisationLetterProvider._internal(
        (ref) => create(ref as AuthorisationLetterRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Map<String, dynamic>> createElement() {
    return _AuthorisationLetterProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AuthorisationLetterProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AuthorisationLetterRef
    on AutoDisposeFutureProviderRef<Map<String, dynamic>> {
  /// The parameter `id` of this provider.
  String get id;
}

class _AuthorisationLetterProviderElement
    extends AutoDisposeFutureProviderElement<Map<String, dynamic>>
    with AuthorisationLetterRef {
  _AuthorisationLetterProviderElement(super.provider);

  @override
  String get id => (origin as AuthorisationLetterProvider).id;
}

String _$uploadAuthorisationLetterHash() =>
    r'6924e4809e9c346b189a2d7284de738a43b88ee2';

/// See also [uploadAuthorisationLetter].
@ProviderFor(uploadAuthorisationLetter)
const uploadAuthorisationLetterProvider = UploadAuthorisationLetterFamily();

/// See also [uploadAuthorisationLetter].
class UploadAuthorisationLetterFamily
    extends Family<AsyncValue<Map<String, dynamic>>> {
  /// See also [uploadAuthorisationLetter].
  const UploadAuthorisationLetterFamily();

  /// See also [uploadAuthorisationLetter].
  UploadAuthorisationLetterProvider call({
    String? id,
    File? aggreementFile,
  }) {
    return UploadAuthorisationLetterProvider(
      id: id,
      aggreementFile: aggreementFile,
    );
  }

  @override
  UploadAuthorisationLetterProvider getProviderOverride(
    covariant UploadAuthorisationLetterProvider provider,
  ) {
    return call(
      id: provider.id,
      aggreementFile: provider.aggreementFile,
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
  String? get name => r'uploadAuthorisationLetterProvider';
}

/// See also [uploadAuthorisationLetter].
class UploadAuthorisationLetterProvider
    extends AutoDisposeFutureProvider<Map<String, dynamic>> {
  /// See also [uploadAuthorisationLetter].
  UploadAuthorisationLetterProvider({
    String? id,
    File? aggreementFile,
  }) : this._internal(
          (ref) => uploadAuthorisationLetter(
            ref as UploadAuthorisationLetterRef,
            id: id,
            aggreementFile: aggreementFile,
          ),
          from: uploadAuthorisationLetterProvider,
          name: r'uploadAuthorisationLetterProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$uploadAuthorisationLetterHash,
          dependencies: UploadAuthorisationLetterFamily._dependencies,
          allTransitiveDependencies:
              UploadAuthorisationLetterFamily._allTransitiveDependencies,
          id: id,
          aggreementFile: aggreementFile,
        );

  UploadAuthorisationLetterProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
    required this.aggreementFile,
  }) : super.internal();

  final String? id;
  final File? aggreementFile;

  @override
  Override overrideWith(
    FutureOr<Map<String, dynamic>> Function(
            UploadAuthorisationLetterRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UploadAuthorisationLetterProvider._internal(
        (ref) => create(ref as UploadAuthorisationLetterRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
        aggreementFile: aggreementFile,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Map<String, dynamic>> createElement() {
    return _UploadAuthorisationLetterProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UploadAuthorisationLetterProvider &&
        other.id == id &&
        other.aggreementFile == aggreementFile;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);
    hash = _SystemHash.combine(hash, aggreementFile.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin UploadAuthorisationLetterRef
    on AutoDisposeFutureProviderRef<Map<String, dynamic>> {
  /// The parameter `id` of this provider.
  String? get id;

  /// The parameter `aggreementFile` of this provider.
  File? get aggreementFile;
}

class _UploadAuthorisationLetterProviderElement
    extends AutoDisposeFutureProviderElement<Map<String, dynamic>>
    with UploadAuthorisationLetterRef {
  _UploadAuthorisationLetterProviderElement(super.provider);

  @override
  String? get id => (origin as UploadAuthorisationLetterProvider).id;
  @override
  File? get aggreementFile =>
      (origin as UploadAuthorisationLetterProvider).aggreementFile;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
