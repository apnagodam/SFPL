// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BnplService.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$bnplTermsHash() => r'466c4db17c6163364da92158a61830ca465d258a';

/// See also [bnplTerms].
@ProviderFor(bnplTerms)
final bnplTermsProvider = AutoDisposeFutureProvider<TermsModel>.internal(
  bnplTerms,
  name: r'bnplTermsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$bnplTermsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef BnplTermsRef = AutoDisposeFutureProviderRef<TermsModel>;
String _$bnplRequestHash() => r'bf994b69f4d1c8551da0ed27042899b98df2e721';

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

/// See also [bnplRequest].
@ProviderFor(bnplRequest)
const bnplRequestProvider = BnplRequestFamily();

/// See also [bnplRequest].
class BnplRequestFamily extends Family<AsyncValue<BaseApiResponse>> {
  /// See also [bnplRequest].
  const BnplRequestFamily();

  /// See also [bnplRequest].
  BnplRequestProvider call({
    String? requestedAmount,
    String? type,
  }) {
    return BnplRequestProvider(
      requestedAmount: requestedAmount,
      type: type,
    );
  }

  @override
  BnplRequestProvider getProviderOverride(
    covariant BnplRequestProvider provider,
  ) {
    return call(
      requestedAmount: provider.requestedAmount,
      type: provider.type,
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
  String? get name => r'bnplRequestProvider';
}

/// See also [bnplRequest].
class BnplRequestProvider extends AutoDisposeFutureProvider<BaseApiResponse> {
  /// See also [bnplRequest].
  BnplRequestProvider({
    String? requestedAmount,
    String? type,
  }) : this._internal(
          (ref) => bnplRequest(
            ref as BnplRequestRef,
            requestedAmount: requestedAmount,
            type: type,
          ),
          from: bnplRequestProvider,
          name: r'bnplRequestProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$bnplRequestHash,
          dependencies: BnplRequestFamily._dependencies,
          allTransitiveDependencies:
              BnplRequestFamily._allTransitiveDependencies,
          requestedAmount: requestedAmount,
          type: type,
        );

  BnplRequestProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.requestedAmount,
    required this.type,
  }) : super.internal();

  final String? requestedAmount;
  final String? type;

  @override
  Override overrideWith(
    FutureOr<BaseApiResponse> Function(BnplRequestRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: BnplRequestProvider._internal(
        (ref) => create(ref as BnplRequestRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        requestedAmount: requestedAmount,
        type: type,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<BaseApiResponse> createElement() {
    return _BnplRequestProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is BnplRequestProvider &&
        other.requestedAmount == requestedAmount &&
        other.type == type;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, requestedAmount.hashCode);
    hash = _SystemHash.combine(hash, type.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin BnplRequestRef on AutoDisposeFutureProviderRef<BaseApiResponse> {
  /// The parameter `requestedAmount` of this provider.
  String? get requestedAmount;

  /// The parameter `type` of this provider.
  String? get type;
}

class _BnplRequestProviderElement
    extends AutoDisposeFutureProviderElement<BaseApiResponse>
    with BnplRequestRef {
  _BnplRequestProviderElement(super.provider);

  @override
  String? get requestedAmount =>
      (origin as BnplRequestProvider).requestedAmount;
  @override
  String? get type => (origin as BnplRequestProvider).type;
}

String _$bnplListHash() => r'd6c8ac2b35658032cf7f6d5fd0f99cbfed4b10e9';

/// See also [bnplList].
@ProviderFor(bnplList)
final bnplListProvider = AutoDisposeStreamProvider<BnplListingModel>.internal(
  bnplList,
  name: r'bnplListProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$bnplListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef BnplListRef = AutoDisposeStreamProviderRef<BnplListingModel>;
String _$bnplPowerHash() => r'3aa8029a497c8a3b020cdafd6d2dcad3c916b93d';

/// See also [bnplPower].
@ProviderFor(bnplPower)
final bnplPowerProvider = AutoDisposeStreamProvider<BnplPowerModel>.internal(
  bnplPower,
  name: r'bnplPowerProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$bnplPowerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef BnplPowerRef = AutoDisposeStreamProviderRef<BnplPowerModel>;
String _$bnplStatementHash() => r'0c2ae37cea26cc52b56344f34b65712cf1694629';

/// See also [bnplStatement].
@ProviderFor(bnplStatement)
const bnplStatementProvider = BnplStatementFamily();

/// See also [bnplStatement].
class BnplStatementFamily extends Family<AsyncValue<BnplStatementModel>> {
  /// See also [bnplStatement].
  const BnplStatementFamily();

  /// See also [bnplStatement].
  BnplStatementProvider call({
    String? pastDate,
    String? currentDate,
  }) {
    return BnplStatementProvider(
      pastDate: pastDate,
      currentDate: currentDate,
    );
  }

  @override
  BnplStatementProvider getProviderOverride(
    covariant BnplStatementProvider provider,
  ) {
    return call(
      pastDate: provider.pastDate,
      currentDate: provider.currentDate,
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
  String? get name => r'bnplStatementProvider';
}

/// See also [bnplStatement].
class BnplStatementProvider
    extends AutoDisposeStreamProvider<BnplStatementModel> {
  /// See also [bnplStatement].
  BnplStatementProvider({
    String? pastDate,
    String? currentDate,
  }) : this._internal(
          (ref) => bnplStatement(
            ref as BnplStatementRef,
            pastDate: pastDate,
            currentDate: currentDate,
          ),
          from: bnplStatementProvider,
          name: r'bnplStatementProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$bnplStatementHash,
          dependencies: BnplStatementFamily._dependencies,
          allTransitiveDependencies:
              BnplStatementFamily._allTransitiveDependencies,
          pastDate: pastDate,
          currentDate: currentDate,
        );

  BnplStatementProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.pastDate,
    required this.currentDate,
  }) : super.internal();

  final String? pastDate;
  final String? currentDate;

  @override
  Override overrideWith(
    Stream<BnplStatementModel> Function(BnplStatementRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: BnplStatementProvider._internal(
        (ref) => create(ref as BnplStatementRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        pastDate: pastDate,
        currentDate: currentDate,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<BnplStatementModel> createElement() {
    return _BnplStatementProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is BnplStatementProvider &&
        other.pastDate == pastDate &&
        other.currentDate == currentDate;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, pastDate.hashCode);
    hash = _SystemHash.combine(hash, currentDate.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin BnplStatementRef on AutoDisposeStreamProviderRef<BnplStatementModel> {
  /// The parameter `pastDate` of this provider.
  String? get pastDate;

  /// The parameter `currentDate` of this provider.
  String? get currentDate;
}

class _BnplStatementProviderElement
    extends AutoDisposeStreamProviderElement<BnplStatementModel>
    with BnplStatementRef {
  _BnplStatementProviderElement(super.provider);

  @override
  String? get pastDate => (origin as BnplStatementProvider).pastDate;
  @override
  String? get currentDate => (origin as BnplStatementProvider).currentDate;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
