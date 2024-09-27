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
String _$termsHash() => r'faaf1fd42283553c5e204e00961682c3bee4acce';

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

/// See also [terms].
@ProviderFor(terms)
const termsProvider = TermsFamily();

/// See also [terms].
class TermsFamily extends Family<AsyncValue<TermsModel>> {
  /// See also [terms].
  const TermsFamily();

  /// See also [terms].
  TermsProvider call({
    required String? schemeId,
  }) {
    return TermsProvider(
      schemeId: schemeId,
    );
  }

  @override
  TermsProvider getProviderOverride(
    covariant TermsProvider provider,
  ) {
    return call(
      schemeId: provider.schemeId,
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
  String? get name => r'termsProvider';
}

/// See also [terms].
class TermsProvider extends AutoDisposeFutureProvider<TermsModel> {
  /// See also [terms].
  TermsProvider({
    required String? schemeId,
  }) : this._internal(
          (ref) => terms(
            ref as TermsRef,
            schemeId: schemeId,
          ),
          from: termsProvider,
          name: r'termsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$termsHash,
          dependencies: TermsFamily._dependencies,
          allTransitiveDependencies: TermsFamily._allTransitiveDependencies,
          schemeId: schemeId,
        );

  TermsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.schemeId,
  }) : super.internal();

  final String? schemeId;

  @override
  Override overrideWith(
    FutureOr<TermsModel> Function(TermsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: TermsProvider._internal(
        (ref) => create(ref as TermsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        schemeId: schemeId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<TermsModel> createElement() {
    return _TermsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TermsProvider && other.schemeId == schemeId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, schemeId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin TermsRef on AutoDisposeFutureProviderRef<TermsModel> {
  /// The parameter `schemeId` of this provider.
  String? get schemeId;
}

class _TermsProviderElement extends AutoDisposeFutureProviderElement<TermsModel>
    with TermsRef {
  _TermsProviderElement(super.provider);

  @override
  String? get schemeId => (origin as TermsProvider).schemeId;
}

String _$applyForLoanHash() => r'c911985e88577635e8bb53b69f679afe131179c8';

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

String _$loanApplyListHash() => r'fbb030dd1147bc476e55e3a251a8a773eb46537c';

/// See also [loanApplyList].
@ProviderFor(loanApplyList)
final loanApplyListProvider =
    AutoDisposeFutureProvider<LoanApplyListModel>.internal(
  loanApplyList,
  name: r'loanApplyListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$loanApplyListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef LoanApplyListRef = AutoDisposeFutureProviderRef<LoanApplyListModel>;
String _$loanRequestFormHash() => r'44a7055d9592bf4ffcb7d1c2ad4fc52a388baca3';

/// See also [loanRequestForm].
@ProviderFor(loanRequestForm)
final loanRequestFormProvider =
    AutoDisposeFutureProvider<LoanRequestFormModel>.internal(
  loanRequestForm,
  name: r'loanRequestFormProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$loanRequestFormHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef LoanRequestFormRef = AutoDisposeFutureProviderRef<LoanRequestFormModel>;
String _$loanDetailsHash() => r'd9264f12df1dbc7e100c5d00586f9f90fec27abe';

/// See also [loanDetails].
@ProviderFor(loanDetails)
const loanDetailsProvider = LoanDetailsFamily();

/// See also [loanDetails].
class LoanDetailsFamily extends Family<AsyncValue<LoanDetailsModel>> {
  /// See also [loanDetails].
  const LoanDetailsFamily();

  /// See also [loanDetails].
  LoanDetailsProvider call({
    String? inventoryId,
    String? commodityName,
    String? quantity,
    String? gatePass,
    String? schemeId,
  }) {
    return LoanDetailsProvider(
      inventoryId: inventoryId,
      commodityName: commodityName,
      quantity: quantity,
      gatePass: gatePass,
      schemeId: schemeId,
    );
  }

  @override
  LoanDetailsProvider getProviderOverride(
    covariant LoanDetailsProvider provider,
  ) {
    return call(
      inventoryId: provider.inventoryId,
      commodityName: provider.commodityName,
      quantity: provider.quantity,
      gatePass: provider.gatePass,
      schemeId: provider.schemeId,
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
  String? get name => r'loanDetailsProvider';
}

/// See also [loanDetails].
class LoanDetailsProvider extends AutoDisposeFutureProvider<LoanDetailsModel> {
  /// See also [loanDetails].
  LoanDetailsProvider({
    String? inventoryId,
    String? commodityName,
    String? quantity,
    String? gatePass,
    String? schemeId,
  }) : this._internal(
          (ref) => loanDetails(
            ref as LoanDetailsRef,
            inventoryId: inventoryId,
            commodityName: commodityName,
            quantity: quantity,
            gatePass: gatePass,
            schemeId: schemeId,
          ),
          from: loanDetailsProvider,
          name: r'loanDetailsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$loanDetailsHash,
          dependencies: LoanDetailsFamily._dependencies,
          allTransitiveDependencies:
              LoanDetailsFamily._allTransitiveDependencies,
          inventoryId: inventoryId,
          commodityName: commodityName,
          quantity: quantity,
          gatePass: gatePass,
          schemeId: schemeId,
        );

  LoanDetailsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.inventoryId,
    required this.commodityName,
    required this.quantity,
    required this.gatePass,
    required this.schemeId,
  }) : super.internal();

  final String? inventoryId;
  final String? commodityName;
  final String? quantity;
  final String? gatePass;
  final String? schemeId;

  @override
  Override overrideWith(
    FutureOr<LoanDetailsModel> Function(LoanDetailsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: LoanDetailsProvider._internal(
        (ref) => create(ref as LoanDetailsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        inventoryId: inventoryId,
        commodityName: commodityName,
        quantity: quantity,
        gatePass: gatePass,
        schemeId: schemeId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<LoanDetailsModel> createElement() {
    return _LoanDetailsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LoanDetailsProvider &&
        other.inventoryId == inventoryId &&
        other.commodityName == commodityName &&
        other.quantity == quantity &&
        other.gatePass == gatePass &&
        other.schemeId == schemeId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, inventoryId.hashCode);
    hash = _SystemHash.combine(hash, commodityName.hashCode);
    hash = _SystemHash.combine(hash, quantity.hashCode);
    hash = _SystemHash.combine(hash, gatePass.hashCode);
    hash = _SystemHash.combine(hash, schemeId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin LoanDetailsRef on AutoDisposeFutureProviderRef<LoanDetailsModel> {
  /// The parameter `inventoryId` of this provider.
  String? get inventoryId;

  /// The parameter `commodityName` of this provider.
  String? get commodityName;

  /// The parameter `quantity` of this provider.
  String? get quantity;

  /// The parameter `gatePass` of this provider.
  String? get gatePass;

  /// The parameter `schemeId` of this provider.
  String? get schemeId;
}

class _LoanDetailsProviderElement
    extends AutoDisposeFutureProviderElement<LoanDetailsModel>
    with LoanDetailsRef {
  _LoanDetailsProviderElement(super.provider);

  @override
  String? get inventoryId => (origin as LoanDetailsProvider).inventoryId;
  @override
  String? get commodityName => (origin as LoanDetailsProvider).commodityName;
  @override
  String? get quantity => (origin as LoanDetailsProvider).quantity;
  @override
  String? get gatePass => (origin as LoanDetailsProvider).gatePass;
  @override
  String? get schemeId => (origin as LoanDetailsProvider).schemeId;
}

String _$submitLoanRequestHash() => r'f5fa631c18486e5d3adb9553ecca15dfe35e57d7';

/// See also [submitLoanRequest].
@ProviderFor(submitLoanRequest)
const submitLoanRequestProvider = SubmitLoanRequestFamily();

/// See also [submitLoanRequest].
class SubmitLoanRequestFamily extends Family<AsyncValue<Map<String, dynamic>>> {
  /// See also [submitLoanRequest].
  const SubmitLoanRequestFamily();

  /// See also [submitLoanRequest].
  SubmitLoanRequestProvider call({
    String? inventoryId,
    String? commodityName,
    String? quantity,
    String? gatePass,
    String? schemeId,
    String? bankName,
    String? ifscCode,
    String? accountNo,
    String? stackNo,
    String? terminalName,
  }) {
    return SubmitLoanRequestProvider(
      inventoryId: inventoryId,
      commodityName: commodityName,
      quantity: quantity,
      gatePass: gatePass,
      schemeId: schemeId,
      bankName: bankName,
      ifscCode: ifscCode,
      accountNo: accountNo,
      stackNo: stackNo,
      terminalName: terminalName,
    );
  }

  @override
  SubmitLoanRequestProvider getProviderOverride(
    covariant SubmitLoanRequestProvider provider,
  ) {
    return call(
      inventoryId: provider.inventoryId,
      commodityName: provider.commodityName,
      quantity: provider.quantity,
      gatePass: provider.gatePass,
      schemeId: provider.schemeId,
      bankName: provider.bankName,
      ifscCode: provider.ifscCode,
      accountNo: provider.accountNo,
      stackNo: provider.stackNo,
      terminalName: provider.terminalName,
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
  String? get name => r'submitLoanRequestProvider';
}

/// See also [submitLoanRequest].
class SubmitLoanRequestProvider
    extends AutoDisposeFutureProvider<Map<String, dynamic>> {
  /// See also [submitLoanRequest].
  SubmitLoanRequestProvider({
    String? inventoryId,
    String? commodityName,
    String? quantity,
    String? gatePass,
    String? schemeId,
    String? bankName,
    String? ifscCode,
    String? accountNo,
    String? stackNo,
    String? terminalName,
  }) : this._internal(
          (ref) => submitLoanRequest(
            ref as SubmitLoanRequestRef,
            inventoryId: inventoryId,
            commodityName: commodityName,
            quantity: quantity,
            gatePass: gatePass,
            schemeId: schemeId,
            bankName: bankName,
            ifscCode: ifscCode,
            accountNo: accountNo,
            stackNo: stackNo,
            terminalName: terminalName,
          ),
          from: submitLoanRequestProvider,
          name: r'submitLoanRequestProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$submitLoanRequestHash,
          dependencies: SubmitLoanRequestFamily._dependencies,
          allTransitiveDependencies:
              SubmitLoanRequestFamily._allTransitiveDependencies,
          inventoryId: inventoryId,
          commodityName: commodityName,
          quantity: quantity,
          gatePass: gatePass,
          schemeId: schemeId,
          bankName: bankName,
          ifscCode: ifscCode,
          accountNo: accountNo,
          stackNo: stackNo,
          terminalName: terminalName,
        );

  SubmitLoanRequestProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.inventoryId,
    required this.commodityName,
    required this.quantity,
    required this.gatePass,
    required this.schemeId,
    required this.bankName,
    required this.ifscCode,
    required this.accountNo,
    required this.stackNo,
    required this.terminalName,
  }) : super.internal();

  final String? inventoryId;
  final String? commodityName;
  final String? quantity;
  final String? gatePass;
  final String? schemeId;
  final String? bankName;
  final String? ifscCode;
  final String? accountNo;
  final String? stackNo;
  final String? terminalName;

  @override
  Override overrideWith(
    FutureOr<Map<String, dynamic>> Function(SubmitLoanRequestRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SubmitLoanRequestProvider._internal(
        (ref) => create(ref as SubmitLoanRequestRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        inventoryId: inventoryId,
        commodityName: commodityName,
        quantity: quantity,
        gatePass: gatePass,
        schemeId: schemeId,
        bankName: bankName,
        ifscCode: ifscCode,
        accountNo: accountNo,
        stackNo: stackNo,
        terminalName: terminalName,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Map<String, dynamic>> createElement() {
    return _SubmitLoanRequestProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SubmitLoanRequestProvider &&
        other.inventoryId == inventoryId &&
        other.commodityName == commodityName &&
        other.quantity == quantity &&
        other.gatePass == gatePass &&
        other.schemeId == schemeId &&
        other.bankName == bankName &&
        other.ifscCode == ifscCode &&
        other.accountNo == accountNo &&
        other.stackNo == stackNo &&
        other.terminalName == terminalName;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, inventoryId.hashCode);
    hash = _SystemHash.combine(hash, commodityName.hashCode);
    hash = _SystemHash.combine(hash, quantity.hashCode);
    hash = _SystemHash.combine(hash, gatePass.hashCode);
    hash = _SystemHash.combine(hash, schemeId.hashCode);
    hash = _SystemHash.combine(hash, bankName.hashCode);
    hash = _SystemHash.combine(hash, ifscCode.hashCode);
    hash = _SystemHash.combine(hash, accountNo.hashCode);
    hash = _SystemHash.combine(hash, stackNo.hashCode);
    hash = _SystemHash.combine(hash, terminalName.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SubmitLoanRequestRef
    on AutoDisposeFutureProviderRef<Map<String, dynamic>> {
  /// The parameter `inventoryId` of this provider.
  String? get inventoryId;

  /// The parameter `commodityName` of this provider.
  String? get commodityName;

  /// The parameter `quantity` of this provider.
  String? get quantity;

  /// The parameter `gatePass` of this provider.
  String? get gatePass;

  /// The parameter `schemeId` of this provider.
  String? get schemeId;

  /// The parameter `bankName` of this provider.
  String? get bankName;

  /// The parameter `ifscCode` of this provider.
  String? get ifscCode;

  /// The parameter `accountNo` of this provider.
  String? get accountNo;

  /// The parameter `stackNo` of this provider.
  String? get stackNo;

  /// The parameter `terminalName` of this provider.
  String? get terminalName;
}

class _SubmitLoanRequestProviderElement
    extends AutoDisposeFutureProviderElement<Map<String, dynamic>>
    with SubmitLoanRequestRef {
  _SubmitLoanRequestProviderElement(super.provider);

  @override
  String? get inventoryId => (origin as SubmitLoanRequestProvider).inventoryId;
  @override
  String? get commodityName =>
      (origin as SubmitLoanRequestProvider).commodityName;
  @override
  String? get quantity => (origin as SubmitLoanRequestProvider).quantity;
  @override
  String? get gatePass => (origin as SubmitLoanRequestProvider).gatePass;
  @override
  String? get schemeId => (origin as SubmitLoanRequestProvider).schemeId;
  @override
  String? get bankName => (origin as SubmitLoanRequestProvider).bankName;
  @override
  String? get ifscCode => (origin as SubmitLoanRequestProvider).ifscCode;
  @override
  String? get accountNo => (origin as SubmitLoanRequestProvider).accountNo;
  @override
  String? get stackNo => (origin as SubmitLoanRequestProvider).stackNo;
  @override
  String? get terminalName =>
      (origin as SubmitLoanRequestProvider).terminalName;
}

String _$cancelLoanRequestHash() => r'4b62e8c96135cc7cc585c49cd183ec75fd3e1e45';

/// See also [cancelLoanRequest].
@ProviderFor(cancelLoanRequest)
const cancelLoanRequestProvider = CancelLoanRequestFamily();

/// See also [cancelLoanRequest].
class CancelLoanRequestFamily extends Family<AsyncValue<Map<String, dynamic>>> {
  /// See also [cancelLoanRequest].
  const CancelLoanRequestFamily();

  /// See also [cancelLoanRequest].
  CancelLoanRequestProvider call({
    String? id,
  }) {
    return CancelLoanRequestProvider(
      id: id,
    );
  }

  @override
  CancelLoanRequestProvider getProviderOverride(
    covariant CancelLoanRequestProvider provider,
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
  String? get name => r'cancelLoanRequestProvider';
}

/// See also [cancelLoanRequest].
class CancelLoanRequestProvider
    extends AutoDisposeFutureProvider<Map<String, dynamic>> {
  /// See also [cancelLoanRequest].
  CancelLoanRequestProvider({
    String? id,
  }) : this._internal(
          (ref) => cancelLoanRequest(
            ref as CancelLoanRequestRef,
            id: id,
          ),
          from: cancelLoanRequestProvider,
          name: r'cancelLoanRequestProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$cancelLoanRequestHash,
          dependencies: CancelLoanRequestFamily._dependencies,
          allTransitiveDependencies:
              CancelLoanRequestFamily._allTransitiveDependencies,
          id: id,
        );

  CancelLoanRequestProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String? id;

  @override
  Override overrideWith(
    FutureOr<Map<String, dynamic>> Function(CancelLoanRequestRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CancelLoanRequestProvider._internal(
        (ref) => create(ref as CancelLoanRequestRef),
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
    return _CancelLoanRequestProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CancelLoanRequestProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CancelLoanRequestRef
    on AutoDisposeFutureProviderRef<Map<String, dynamic>> {
  /// The parameter `id` of this provider.
  String? get id;
}

class _CancelLoanRequestProviderElement
    extends AutoDisposeFutureProviderElement<Map<String, dynamic>>
    with CancelLoanRequestRef {
  _CancelLoanRequestProviderElement(super.provider);

  @override
  String? get id => (origin as CancelLoanRequestProvider).id;
}

String _$approvedRequestsHash() => r'b0232b1bb30f2e3a8f8e8d4eddc22706100a5428';

/// See also [approvedRequests].
@ProviderFor(approvedRequests)
final approvedRequestsProvider =
    AutoDisposeFutureProvider<LoanRequestsStatusModel>.internal(
  approvedRequests,
  name: r'approvedRequestsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$approvedRequestsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ApprovedRequestsRef
    = AutoDisposeFutureProviderRef<LoanRequestsStatusModel>;
String _$pendingRequestsHash() => r'87ab1b7f5312bc41f1a307e7e3361347a42081f7';

/// See also [pendingRequests].
@ProviderFor(pendingRequests)
final pendingRequestsProvider =
    AutoDisposeFutureProvider<LoanRequestsStatusModel>.internal(
  pendingRequests,
  name: r'pendingRequestsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$pendingRequestsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PendingRequestsRef
    = AutoDisposeFutureProviderRef<LoanRequestsStatusModel>;
String _$rejectedRequestsHash() => r'b011588f21fcd462186eb520349296e753362039';

/// See also [rejectedRequests].
@ProviderFor(rejectedRequests)
final rejectedRequestsProvider =
    AutoDisposeFutureProvider<LoanRequestsStatusModel>.internal(
  rejectedRequests,
  name: r'rejectedRequestsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$rejectedRequestsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef RejectedRequestsRef
    = AutoDisposeFutureProviderRef<LoanRequestsStatusModel>;
String _$closedRequestsHash() => r'17b62f8632183ed0efd21c31eea71ca49e0acd10';

/// See also [closedRequests].
@ProviderFor(closedRequests)
final closedRequestsProvider =
    AutoDisposeFutureProvider<LoanRequestsStatusModel>.internal(
  closedRequests,
  name: r'closedRequestsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$closedRequestsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ClosedRequestsRef
    = AutoDisposeFutureProviderRef<LoanRequestsStatusModel>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
