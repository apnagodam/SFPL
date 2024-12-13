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
String _$termsHash() => r'742c3c5365d03574b2719679b609d7e881bf4883';

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
    required TermsRequestModel model,
  }) {
    return TermsProvider(
      model: model,
    );
  }

  @override
  TermsProvider getProviderOverride(
    covariant TermsProvider provider,
  ) {
    return call(
      model: provider.model,
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
class TermsProvider extends AutoDisposeStreamProvider<TermsModel> {
  /// See also [terms].
  TermsProvider({
    required TermsRequestModel model,
  }) : this._internal(
          (ref) => terms(
            ref as TermsRef,
            model: model,
          ),
          from: termsProvider,
          name: r'termsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$termsHash,
          dependencies: TermsFamily._dependencies,
          allTransitiveDependencies: TermsFamily._allTransitiveDependencies,
          model: model,
        );

  TermsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.model,
  }) : super.internal();

  final TermsRequestModel model;

  @override
  Override overrideWith(
    Stream<TermsModel> Function(TermsRef provider) create,
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
        model: model,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<TermsModel> createElement() {
    return _TermsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TermsProvider && other.model == model;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, model.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin TermsRef on AutoDisposeStreamProviderRef<TermsModel> {
  /// The parameter `model` of this provider.
  TermsRequestModel get model;
}

class _TermsProviderElement extends AutoDisposeStreamProviderElement<TermsModel>
    with TermsRef {
  _TermsProviderElement(super.provider);

  @override
  TermsRequestModel get model => (origin as TermsProvider).model;
}

String _$applyForLoanHash() => r'87bd93b434a3eba1fff3f8729293c0046f1ff75f';

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
    List<int>? schemeId,
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
    List<int>? schemeId,
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
  final List<int>? schemeId;
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
  List<int>? get schemeId;

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
  List<int>? get schemeId => (origin as ApplyForLoanProvider).schemeId;
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

String _$sanctionSchemesHash() => r'4404bbd60dbe3223ed470489133056059ba5ee19';

/// See also [sanctionSchemes].
@ProviderFor(sanctionSchemes)
const sanctionSchemesProvider = SanctionSchemesFamily();

/// See also [sanctionSchemes].
class SanctionSchemesFamily
    extends Family<AsyncValue<SanctionSchemeListModel>> {
  /// See also [sanctionSchemes].
  const SanctionSchemesFamily();

  /// See also [sanctionSchemes].
  SanctionSchemesProvider call({
    String? id,
  }) {
    return SanctionSchemesProvider(
      id: id,
    );
  }

  @override
  SanctionSchemesProvider getProviderOverride(
    covariant SanctionSchemesProvider provider,
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
  String? get name => r'sanctionSchemesProvider';
}

/// See also [sanctionSchemes].
class SanctionSchemesProvider
    extends AutoDisposeStreamProvider<SanctionSchemeListModel> {
  /// See also [sanctionSchemes].
  SanctionSchemesProvider({
    String? id,
  }) : this._internal(
          (ref) => sanctionSchemes(
            ref as SanctionSchemesRef,
            id: id,
          ),
          from: sanctionSchemesProvider,
          name: r'sanctionSchemesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$sanctionSchemesHash,
          dependencies: SanctionSchemesFamily._dependencies,
          allTransitiveDependencies:
              SanctionSchemesFamily._allTransitiveDependencies,
          id: id,
        );

  SanctionSchemesProvider._internal(
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
    Stream<SanctionSchemeListModel> Function(SanctionSchemesRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SanctionSchemesProvider._internal(
        (ref) => create(ref as SanctionSchemesRef),
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
  AutoDisposeStreamProviderElement<SanctionSchemeListModel> createElement() {
    return _SanctionSchemesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SanctionSchemesProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SanctionSchemesRef
    on AutoDisposeStreamProviderRef<SanctionSchemeListModel> {
  /// The parameter `id` of this provider.
  String? get id;
}

class _SanctionSchemesProviderElement
    extends AutoDisposeStreamProviderElement<SanctionSchemeListModel>
    with SanctionSchemesRef {
  _SanctionSchemesProviderElement(super.provider);

  @override
  String? get id => (origin as SanctionSchemesProvider).id;
}

String _$submitSanctionDocumentsHash() =>
    r'268867b5444ba8dc19932743d8ad9daf57b05339';

/// See also [submitSanctionDocuments].
@ProviderFor(submitSanctionDocuments)
const submitSanctionDocumentsProvider = SubmitSanctionDocumentsFamily();

/// See also [submitSanctionDocuments].
class SubmitSanctionDocumentsFamily
    extends Family<AsyncValue<Map<String, dynamic>>> {
  /// See also [submitSanctionDocuments].
  const SubmitSanctionDocumentsFamily();

  /// See also [submitSanctionDocuments].
  SubmitSanctionDocumentsProvider call({
    String? id,
    File? triAgreement,
    File? pdc,
    File? agreement,
  }) {
    return SubmitSanctionDocumentsProvider(
      id: id,
      triAgreement: triAgreement,
      pdc: pdc,
      agreement: agreement,
    );
  }

  @override
  SubmitSanctionDocumentsProvider getProviderOverride(
    covariant SubmitSanctionDocumentsProvider provider,
  ) {
    return call(
      id: provider.id,
      triAgreement: provider.triAgreement,
      pdc: provider.pdc,
      agreement: provider.agreement,
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
  String? get name => r'submitSanctionDocumentsProvider';
}

/// See also [submitSanctionDocuments].
class SubmitSanctionDocumentsProvider
    extends AutoDisposeFutureProvider<Map<String, dynamic>> {
  /// See also [submitSanctionDocuments].
  SubmitSanctionDocumentsProvider({
    String? id,
    File? triAgreement,
    File? pdc,
    File? agreement,
  }) : this._internal(
          (ref) => submitSanctionDocuments(
            ref as SubmitSanctionDocumentsRef,
            id: id,
            triAgreement: triAgreement,
            pdc: pdc,
            agreement: agreement,
          ),
          from: submitSanctionDocumentsProvider,
          name: r'submitSanctionDocumentsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$submitSanctionDocumentsHash,
          dependencies: SubmitSanctionDocumentsFamily._dependencies,
          allTransitiveDependencies:
              SubmitSanctionDocumentsFamily._allTransitiveDependencies,
          id: id,
          triAgreement: triAgreement,
          pdc: pdc,
          agreement: agreement,
        );

  SubmitSanctionDocumentsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
    required this.triAgreement,
    required this.pdc,
    required this.agreement,
  }) : super.internal();

  final String? id;
  final File? triAgreement;
  final File? pdc;
  final File? agreement;

  @override
  Override overrideWith(
    FutureOr<Map<String, dynamic>> Function(SubmitSanctionDocumentsRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SubmitSanctionDocumentsProvider._internal(
        (ref) => create(ref as SubmitSanctionDocumentsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
        triAgreement: triAgreement,
        pdc: pdc,
        agreement: agreement,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Map<String, dynamic>> createElement() {
    return _SubmitSanctionDocumentsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SubmitSanctionDocumentsProvider &&
        other.id == id &&
        other.triAgreement == triAgreement &&
        other.pdc == pdc &&
        other.agreement == agreement;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);
    hash = _SystemHash.combine(hash, triAgreement.hashCode);
    hash = _SystemHash.combine(hash, pdc.hashCode);
    hash = _SystemHash.combine(hash, agreement.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SubmitSanctionDocumentsRef
    on AutoDisposeFutureProviderRef<Map<String, dynamic>> {
  /// The parameter `id` of this provider.
  String? get id;

  /// The parameter `triAgreement` of this provider.
  File? get triAgreement;

  /// The parameter `pdc` of this provider.
  File? get pdc;

  /// The parameter `agreement` of this provider.
  File? get agreement;
}

class _SubmitSanctionDocumentsProviderElement
    extends AutoDisposeFutureProviderElement<Map<String, dynamic>>
    with SubmitSanctionDocumentsRef {
  _SubmitSanctionDocumentsProviderElement(super.provider);

  @override
  String? get id => (origin as SubmitSanctionDocumentsProvider).id;
  @override
  File? get triAgreement =>
      (origin as SubmitSanctionDocumentsProvider).triAgreement;
  @override
  File? get pdc => (origin as SubmitSanctionDocumentsProvider).pdc;
  @override
  File? get agreement => (origin as SubmitSanctionDocumentsProvider).agreement;
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

String _$uploadPdfHash() => r'c0eb19f7baabbd1e89e3c686d7c57c8721831ec7';

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
String _$loanDetailsHash() => r'd5be262874c5d76a4d52ba13a547e730abe2acc3';

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
    String? bags,
  }) {
    return LoanDetailsProvider(
      inventoryId: inventoryId,
      commodityName: commodityName,
      quantity: quantity,
      gatePass: gatePass,
      schemeId: schemeId,
      bags: bags,
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
      bags: provider.bags,
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
class LoanDetailsProvider extends AutoDisposeStreamProvider<LoanDetailsModel> {
  /// See also [loanDetails].
  LoanDetailsProvider({
    String? inventoryId,
    String? commodityName,
    String? quantity,
    String? gatePass,
    String? schemeId,
    String? bags,
  }) : this._internal(
          (ref) => loanDetails(
            ref as LoanDetailsRef,
            inventoryId: inventoryId,
            commodityName: commodityName,
            quantity: quantity,
            gatePass: gatePass,
            schemeId: schemeId,
            bags: bags,
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
          bags: bags,
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
    required this.bags,
  }) : super.internal();

  final String? inventoryId;
  final String? commodityName;
  final String? quantity;
  final String? gatePass;
  final String? schemeId;
  final String? bags;

  @override
  Override overrideWith(
    Stream<LoanDetailsModel> Function(LoanDetailsRef provider) create,
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
        bags: bags,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<LoanDetailsModel> createElement() {
    return _LoanDetailsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LoanDetailsProvider &&
        other.inventoryId == inventoryId &&
        other.commodityName == commodityName &&
        other.quantity == quantity &&
        other.gatePass == gatePass &&
        other.schemeId == schemeId &&
        other.bags == bags;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, inventoryId.hashCode);
    hash = _SystemHash.combine(hash, commodityName.hashCode);
    hash = _SystemHash.combine(hash, quantity.hashCode);
    hash = _SystemHash.combine(hash, gatePass.hashCode);
    hash = _SystemHash.combine(hash, schemeId.hashCode);
    hash = _SystemHash.combine(hash, bags.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin LoanDetailsRef on AutoDisposeStreamProviderRef<LoanDetailsModel> {
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

  /// The parameter `bags` of this provider.
  String? get bags;
}

class _LoanDetailsProviderElement
    extends AutoDisposeStreamProviderElement<LoanDetailsModel>
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
  @override
  String? get bags => (origin as LoanDetailsProvider).bags;
}

String _$submitLoanRequestHash() => r'446a22b0ce71fcd437a0022657ee4a82d31940ab';

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
    String? bags,
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
      bags: bags,
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
      bags: provider.bags,
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
    String? bags,
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
            bags: bags,
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
          bags: bags,
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
    required this.bags,
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
  final String? bags;
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
        bags: bags,
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
        other.bags == bags &&
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
    hash = _SystemHash.combine(hash, bags.hashCode);
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

  /// The parameter `bags` of this provider.
  String? get bags;

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
  String? get bags => (origin as SubmitLoanRequestProvider).bags;
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

String _$approvedRequestsHash() => r'5c5acfa44e3b5e1d3812c7b82af1dc2e94b7082a';

/// See also [approvedRequests].
@ProviderFor(approvedRequests)
final approvedRequestsProvider =
    AutoDisposeStreamProvider<LoanRequestsStatusModel>.internal(
  approvedRequests,
  name: r'approvedRequestsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$approvedRequestsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ApprovedRequestsRef
    = AutoDisposeStreamProviderRef<LoanRequestsStatusModel>;
String _$pendingRequestsHash() => r'e78260af288a51be7314dd566b6696de9624b2a7';

/// See also [pendingRequests].
@ProviderFor(pendingRequests)
final pendingRequestsProvider =
    AutoDisposeStreamProvider<LoanRequestsStatusModel>.internal(
  pendingRequests,
  name: r'pendingRequestsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$pendingRequestsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PendingRequestsRef
    = AutoDisposeStreamProviderRef<LoanRequestsStatusModel>;
String _$rejectedRequestsHash() => r'cb7f493a47f08e5f23630886850d3c0055416226';

/// See also [rejectedRequests].
@ProviderFor(rejectedRequests)
final rejectedRequestsProvider =
    AutoDisposeStreamProvider<LoanRequestsStatusModel>.internal(
  rejectedRequests,
  name: r'rejectedRequestsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$rejectedRequestsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef RejectedRequestsRef
    = AutoDisposeStreamProviderRef<LoanRequestsStatusModel>;
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
