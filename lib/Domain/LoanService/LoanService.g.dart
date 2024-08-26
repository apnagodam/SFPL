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
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
