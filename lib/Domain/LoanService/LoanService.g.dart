// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'LoanService.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$schemesHash() => r'39d34d88d06efdc9f1064ca8b608d61b7d880f05';

/// See also [schemes].
@ProviderFor(schemes)
final schemesProvider = AutoDisposeFutureProvider<SchemeResponseModel>.internal(
  schemes,
  name: r'schemesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$schemesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SchemesRef = AutoDisposeFutureProviderRef<SchemeResponseModel>;
String _$appliedListHash() => r'42f268c0a35f7e9216dadb452f1756bf89c8f0f4';

/// See also [appliedList].
@ProviderFor(appliedList)
final appliedListProvider =
    AutoDisposeFutureProvider<SanctionLimitListModel>.internal(
  appliedList,
  name: r'appliedListProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$appliedListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AppliedListRef = AutoDisposeFutureProviderRef<SanctionLimitListModel>;
String _$termsHash() => r'331295fe3bed07ef3c6a79c8c41d405f54f37112';

/// See also [terms].
@ProviderFor(terms)
final termsProvider = AutoDisposeFutureProvider<TermsModel>.internal(
  terms,
  name: r'termsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$termsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef TermsRef = AutoDisposeFutureProviderRef<TermsModel>;
String _$applyForLoanHash() => r'c911985e88577635e8bb53b69f679afe131179c8';

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

/// See also [applyForLoan].
@ProviderFor(applyForLoan)
const applyForLoanProvider = ApplyForLoanFamily();

/// See also [applyForLoan].
class ApplyForLoanFamily extends Family<AsyncValue<Map<String, dynamic>>> {
  /// See also [applyForLoan].
  const ApplyForLoanFamily();

  /// See also [applyForLoan].
  ApplyForLoanProvider call({
    String? amount,
    String? loanType,
    String? schemeId,
    File? itr1,
    File? itr2,
    File? itr3,
    File? bs1,
    File? bs2,
    File? bs3,
  }) {
    return ApplyForLoanProvider(
      amount: amount,
      loanType: loanType,
      schemeId: schemeId,
      itr1: itr1,
      itr2: itr2,
      itr3: itr3,
      bs1: bs1,
      bs2: bs2,
      bs3: bs3,
    );
  }

  @override
  ApplyForLoanProvider getProviderOverride(
    covariant ApplyForLoanProvider provider,
  ) {
    return call(
      amount: provider.amount,
      loanType: provider.loanType,
      schemeId: provider.schemeId,
      itr1: provider.itr1,
      itr2: provider.itr2,
      itr3: provider.itr3,
      bs1: provider.bs1,
      bs2: provider.bs2,
      bs3: provider.bs3,
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
  String? get name => r'applyForLoanProvider';
}

/// See also [applyForLoan].
class ApplyForLoanProvider
    extends AutoDisposeFutureProvider<Map<String, dynamic>> {
  /// See also [applyForLoan].
  ApplyForLoanProvider({
    String? amount,
    String? loanType,
    String? schemeId,
    File? itr1,
    File? itr2,
    File? itr3,
    File? bs1,
    File? bs2,
    File? bs3,
  }) : this._internal(
          (ref) => applyForLoan(
            ref as ApplyForLoanRef,
            amount: amount,
            loanType: loanType,
            schemeId: schemeId,
            itr1: itr1,
            itr2: itr2,
            itr3: itr3,
            bs1: bs1,
            bs2: bs2,
            bs3: bs3,
          ),
          from: applyForLoanProvider,
          name: r'applyForLoanProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$applyForLoanHash,
          dependencies: ApplyForLoanFamily._dependencies,
          allTransitiveDependencies:
              ApplyForLoanFamily._allTransitiveDependencies,
          amount: amount,
          loanType: loanType,
          schemeId: schemeId,
          itr1: itr1,
          itr2: itr2,
          itr3: itr3,
          bs1: bs1,
          bs2: bs2,
          bs3: bs3,
        );

  ApplyForLoanProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.amount,
    required this.loanType,
    required this.schemeId,
    required this.itr1,
    required this.itr2,
    required this.itr3,
    required this.bs1,
    required this.bs2,
    required this.bs3,
  }) : super.internal();

  final String? amount;
  final String? loanType;
  final String? schemeId;
  final File? itr1;
  final File? itr2;
  final File? itr3;
  final File? bs1;
  final File? bs2;
  final File? bs3;

  @override
  Override overrideWith(
    FutureOr<Map<String, dynamic>> Function(ApplyForLoanRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ApplyForLoanProvider._internal(
        (ref) => create(ref as ApplyForLoanRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        amount: amount,
        loanType: loanType,
        schemeId: schemeId,
        itr1: itr1,
        itr2: itr2,
        itr3: itr3,
        bs1: bs1,
        bs2: bs2,
        bs3: bs3,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Map<String, dynamic>> createElement() {
    return _ApplyForLoanProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ApplyForLoanProvider &&
        other.amount == amount &&
        other.loanType == loanType &&
        other.schemeId == schemeId &&
        other.itr1 == itr1 &&
        other.itr2 == itr2 &&
        other.itr3 == itr3 &&
        other.bs1 == bs1 &&
        other.bs2 == bs2 &&
        other.bs3 == bs3;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, amount.hashCode);
    hash = _SystemHash.combine(hash, loanType.hashCode);
    hash = _SystemHash.combine(hash, schemeId.hashCode);
    hash = _SystemHash.combine(hash, itr1.hashCode);
    hash = _SystemHash.combine(hash, itr2.hashCode);
    hash = _SystemHash.combine(hash, itr3.hashCode);
    hash = _SystemHash.combine(hash, bs1.hashCode);
    hash = _SystemHash.combine(hash, bs2.hashCode);
    hash = _SystemHash.combine(hash, bs3.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ApplyForLoanRef on AutoDisposeFutureProviderRef<Map<String, dynamic>> {
  /// The parameter `amount` of this provider.
  String? get amount;

  /// The parameter `loanType` of this provider.
  String? get loanType;

  /// The parameter `schemeId` of this provider.
  String? get schemeId;

  /// The parameter `itr1` of this provider.
  File? get itr1;

  /// The parameter `itr2` of this provider.
  File? get itr2;

  /// The parameter `itr3` of this provider.
  File? get itr3;

  /// The parameter `bs1` of this provider.
  File? get bs1;

  /// The parameter `bs2` of this provider.
  File? get bs2;

  /// The parameter `bs3` of this provider.
  File? get bs3;
}

class _ApplyForLoanProviderElement
    extends AutoDisposeFutureProviderElement<Map<String, dynamic>>
    with ApplyForLoanRef {
  _ApplyForLoanProviderElement(super.provider);

  @override
  String? get amount => (origin as ApplyForLoanProvider).amount;
  @override
  String? get loanType => (origin as ApplyForLoanProvider).loanType;
  @override
  String? get schemeId => (origin as ApplyForLoanProvider).schemeId;
  @override
  File? get itr1 => (origin as ApplyForLoanProvider).itr1;
  @override
  File? get itr2 => (origin as ApplyForLoanProvider).itr2;
  @override
  File? get itr3 => (origin as ApplyForLoanProvider).itr3;
  @override
  File? get bs1 => (origin as ApplyForLoanProvider).bs1;
  @override
  File? get bs2 => (origin as ApplyForLoanProvider).bs2;
  @override
  File? get bs3 => (origin as ApplyForLoanProvider).bs3;
}

String _$wspAgreementListHash() => r'db09e024522d17b350c1f811c8d2f7e81bd5863b';

/// See also [wspAgreementList].
@ProviderFor(wspAgreementList)
final wspAgreementListProvider =
    AutoDisposeFutureProvider<WspListModel>.internal(
  wspAgreementList,
  name: r'wspAgreementListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$wspAgreementListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef WspAgreementListRef = AutoDisposeFutureProviderRef<WspListModel>;
String _$wspAgreementHash() => r'798c6f66b87f9116b5b8e7f2bfc9f097dbbe0a09';

/// See also [wspAgreement].
@ProviderFor(wspAgreement)
const wspAgreementProvider = WspAgreementFamily();

/// See also [wspAgreement].
class WspAgreementFamily extends Family<AsyncValue<TripartyAgreementModel>> {
  /// See also [wspAgreement].
  const WspAgreementFamily();

  /// See also [wspAgreement].
  WspAgreementProvider call({
    String? wspId,
  }) {
    return WspAgreementProvider(
      wspId: wspId,
    );
  }

  @override
  WspAgreementProvider getProviderOverride(
    covariant WspAgreementProvider provider,
  ) {
    return call(
      wspId: provider.wspId,
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
  String? get name => r'wspAgreementProvider';
}

/// See also [wspAgreement].
class WspAgreementProvider
    extends AutoDisposeFutureProvider<TripartyAgreementModel> {
  /// See also [wspAgreement].
  WspAgreementProvider({
    String? wspId,
  }) : this._internal(
          (ref) => wspAgreement(
            ref as WspAgreementRef,
            wspId: wspId,
          ),
          from: wspAgreementProvider,
          name: r'wspAgreementProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$wspAgreementHash,
          dependencies: WspAgreementFamily._dependencies,
          allTransitiveDependencies:
              WspAgreementFamily._allTransitiveDependencies,
          wspId: wspId,
        );

  WspAgreementProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.wspId,
  }) : super.internal();

  final String? wspId;

  @override
  Override overrideWith(
    FutureOr<TripartyAgreementModel> Function(WspAgreementRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WspAgreementProvider._internal(
        (ref) => create(ref as WspAgreementRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        wspId: wspId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<TripartyAgreementModel> createElement() {
    return _WspAgreementProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WspAgreementProvider && other.wspId == wspId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, wspId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin WspAgreementRef on AutoDisposeFutureProviderRef<TripartyAgreementModel> {
  /// The parameter `wspId` of this provider.
  String? get wspId;
}

class _WspAgreementProviderElement
    extends AutoDisposeFutureProviderElement<TripartyAgreementModel>
    with WspAgreementRef {
  _WspAgreementProviderElement(super.provider);

  @override
  String? get wspId => (origin as WspAgreementProvider).wspId;
}

String _$uploadPdfHash() => r'a799e050f6d24f3797dd7bdb86c371ffd095075c';

/// See also [uploadPdf].
@ProviderFor(uploadPdf)
const uploadPdfProvider = UploadPdfFamily();

/// See also [uploadPdf].
class UploadPdfFamily extends Family<AsyncValue<Map<String, dynamic>>> {
  /// See also [uploadPdf].
  const UploadPdfFamily();

  /// See also [uploadPdf].
  UploadPdfProvider call({
    File? agreementFile,
    String? wspId,
  }) {
    return UploadPdfProvider(
      agreementFile: agreementFile,
      wspId: wspId,
    );
  }

  @override
  UploadPdfProvider getProviderOverride(
    covariant UploadPdfProvider provider,
  ) {
    return call(
      agreementFile: provider.agreementFile,
      wspId: provider.wspId,
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
  String? get name => r'uploadPdfProvider';
}

/// See also [uploadPdf].
class UploadPdfProvider
    extends AutoDisposeFutureProvider<Map<String, dynamic>> {
  /// See also [uploadPdf].
  UploadPdfProvider({
    File? agreementFile,
    String? wspId,
  }) : this._internal(
          (ref) => uploadPdf(
            ref as UploadPdfRef,
            agreementFile: agreementFile,
            wspId: wspId,
          ),
          from: uploadPdfProvider,
          name: r'uploadPdfProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$uploadPdfHash,
          dependencies: UploadPdfFamily._dependencies,
          allTransitiveDependencies: UploadPdfFamily._allTransitiveDependencies,
          agreementFile: agreementFile,
          wspId: wspId,
        );

  UploadPdfProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.agreementFile,
    required this.wspId,
  }) : super.internal();

  final File? agreementFile;
  final String? wspId;

  @override
  Override overrideWith(
    FutureOr<Map<String, dynamic>> Function(UploadPdfRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UploadPdfProvider._internal(
        (ref) => create(ref as UploadPdfRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        agreementFile: agreementFile,
        wspId: wspId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Map<String, dynamic>> createElement() {
    return _UploadPdfProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UploadPdfProvider &&
        other.agreementFile == agreementFile &&
        other.wspId == wspId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, agreementFile.hashCode);
    hash = _SystemHash.combine(hash, wspId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin UploadPdfRef on AutoDisposeFutureProviderRef<Map<String, dynamic>> {
  /// The parameter `agreementFile` of this provider.
  File? get agreementFile;

  /// The parameter `wspId` of this provider.
  String? get wspId;
}

class _UploadPdfProviderElement
    extends AutoDisposeFutureProviderElement<Map<String, dynamic>>
    with UploadPdfRef {
  _UploadPdfProviderElement(super.provider);

  @override
  File? get agreementFile => (origin as UploadPdfProvider).agreementFile;
  @override
  String? get wspId => (origin as UploadPdfProvider).wspId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
