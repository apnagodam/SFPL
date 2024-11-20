// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RepaymentService.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$repaymentTerminalDataHash() =>
    r'3a60e0935f65889ed9cf4c186cbf9c31bcfa75f7';

/// See also [repaymentTerminalData].
@ProviderFor(repaymentTerminalData)
final repaymentTerminalDataProvider =
    AutoDisposeStreamProvider<RepaymentTerminalData>.internal(
  repaymentTerminalData,
  name: r'repaymentTerminalDataProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$repaymentTerminalDataHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef RepaymentTerminalDataRef
    = AutoDisposeStreamProviderRef<RepaymentTerminalData>;
String _$repaymentDataHash() => r'39d3cca5778ee695b7ed6eedb23eb215a3eadd8d';

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

/// See also [repaymentData].
@ProviderFor(repaymentData)
const repaymentDataProvider = RepaymentDataFamily();

/// See also [repaymentData].
class RepaymentDataFamily extends Family<AsyncValue<RepaymentDataModel>> {
  /// See also [repaymentData].
  const RepaymentDataFamily();

  /// See also [repaymentData].
  RepaymentDataProvider call({
    String? terminal,
    String? type,
    String? commodityName,
  }) {
    return RepaymentDataProvider(
      terminal: terminal,
      type: type,
      commodityName: commodityName,
    );
  }

  @override
  RepaymentDataProvider getProviderOverride(
    covariant RepaymentDataProvider provider,
  ) {
    return call(
      terminal: provider.terminal,
      type: provider.type,
      commodityName: provider.commodityName,
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
  String? get name => r'repaymentDataProvider';
}

/// See also [repaymentData].
class RepaymentDataProvider
    extends AutoDisposeStreamProvider<RepaymentDataModel> {
  /// See also [repaymentData].
  RepaymentDataProvider({
    String? terminal,
    String? type,
    String? commodityName,
  }) : this._internal(
          (ref) => repaymentData(
            ref as RepaymentDataRef,
            terminal: terminal,
            type: type,
            commodityName: commodityName,
          ),
          from: repaymentDataProvider,
          name: r'repaymentDataProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$repaymentDataHash,
          dependencies: RepaymentDataFamily._dependencies,
          allTransitiveDependencies:
              RepaymentDataFamily._allTransitiveDependencies,
          terminal: terminal,
          type: type,
          commodityName: commodityName,
        );

  RepaymentDataProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.terminal,
    required this.type,
    required this.commodityName,
  }) : super.internal();

  final String? terminal;
  final String? type;
  final String? commodityName;

  @override
  Override overrideWith(
    Stream<RepaymentDataModel> Function(RepaymentDataRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RepaymentDataProvider._internal(
        (ref) => create(ref as RepaymentDataRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        terminal: terminal,
        type: type,
        commodityName: commodityName,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<RepaymentDataModel> createElement() {
    return _RepaymentDataProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RepaymentDataProvider &&
        other.terminal == terminal &&
        other.type == type &&
        other.commodityName == commodityName;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, terminal.hashCode);
    hash = _SystemHash.combine(hash, type.hashCode);
    hash = _SystemHash.combine(hash, commodityName.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin RepaymentDataRef on AutoDisposeStreamProviderRef<RepaymentDataModel> {
  /// The parameter `terminal` of this provider.
  String? get terminal;

  /// The parameter `type` of this provider.
  String? get type;

  /// The parameter `commodityName` of this provider.
  String? get commodityName;
}

class _RepaymentDataProviderElement
    extends AutoDisposeStreamProviderElement<RepaymentDataModel>
    with RepaymentDataRef {
  _RepaymentDataProviderElement(super.provider);

  @override
  String? get terminal => (origin as RepaymentDataProvider).terminal;
  @override
  String? get type => (origin as RepaymentDataProvider).type;
  @override
  String? get commodityName => (origin as RepaymentDataProvider).commodityName;
}

String _$repaymentSettlementListHash() =>
    r'dba7b69b7848547f137f5ec47ffe44482c0fc28d';

/// See also [repaymentSettlementList].
@ProviderFor(repaymentSettlementList)
const repaymentSettlementListProvider = RepaymentSettlementListFamily();

/// See also [repaymentSettlementList].
class RepaymentSettlementListFamily
    extends Family<AsyncValue<RepaymentSettlementList>> {
  /// See also [repaymentSettlementList].
  const RepaymentSettlementListFamily();

  /// See also [repaymentSettlementList].
  RepaymentSettlementListProvider call({
    String? terminal,
    String? commodityName,
    String? stackNumber,
  }) {
    return RepaymentSettlementListProvider(
      terminal: terminal,
      commodityName: commodityName,
      stackNumber: stackNumber,
    );
  }

  @override
  RepaymentSettlementListProvider getProviderOverride(
    covariant RepaymentSettlementListProvider provider,
  ) {
    return call(
      terminal: provider.terminal,
      commodityName: provider.commodityName,
      stackNumber: provider.stackNumber,
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
  String? get name => r'repaymentSettlementListProvider';
}

/// See also [repaymentSettlementList].
class RepaymentSettlementListProvider
    extends AutoDisposeStreamProvider<RepaymentSettlementList> {
  /// See also [repaymentSettlementList].
  RepaymentSettlementListProvider({
    String? terminal,
    String? commodityName,
    String? stackNumber,
  }) : this._internal(
          (ref) => repaymentSettlementList(
            ref as RepaymentSettlementListRef,
            terminal: terminal,
            commodityName: commodityName,
            stackNumber: stackNumber,
          ),
          from: repaymentSettlementListProvider,
          name: r'repaymentSettlementListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$repaymentSettlementListHash,
          dependencies: RepaymentSettlementListFamily._dependencies,
          allTransitiveDependencies:
              RepaymentSettlementListFamily._allTransitiveDependencies,
          terminal: terminal,
          commodityName: commodityName,
          stackNumber: stackNumber,
        );

  RepaymentSettlementListProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.terminal,
    required this.commodityName,
    required this.stackNumber,
  }) : super.internal();

  final String? terminal;
  final String? commodityName;
  final String? stackNumber;

  @override
  Override overrideWith(
    Stream<RepaymentSettlementList> Function(
            RepaymentSettlementListRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RepaymentSettlementListProvider._internal(
        (ref) => create(ref as RepaymentSettlementListRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        terminal: terminal,
        commodityName: commodityName,
        stackNumber: stackNumber,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<RepaymentSettlementList> createElement() {
    return _RepaymentSettlementListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RepaymentSettlementListProvider &&
        other.terminal == terminal &&
        other.commodityName == commodityName &&
        other.stackNumber == stackNumber;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, terminal.hashCode);
    hash = _SystemHash.combine(hash, commodityName.hashCode);
    hash = _SystemHash.combine(hash, stackNumber.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin RepaymentSettlementListRef
    on AutoDisposeStreamProviderRef<RepaymentSettlementList> {
  /// The parameter `terminal` of this provider.
  String? get terminal;

  /// The parameter `commodityName` of this provider.
  String? get commodityName;

  /// The parameter `stackNumber` of this provider.
  String? get stackNumber;
}

class _RepaymentSettlementListProviderElement
    extends AutoDisposeStreamProviderElement<RepaymentSettlementList>
    with RepaymentSettlementListRef {
  _RepaymentSettlementListProviderElement(super.provider);

  @override
  String? get terminal => (origin as RepaymentSettlementListProvider).terminal;
  @override
  String? get commodityName =>
      (origin as RepaymentSettlementListProvider).commodityName;
  @override
  String? get stackNumber =>
      (origin as RepaymentSettlementListProvider).stackNumber;
}

String _$repayGatepassHash() => r'e9840f4f32545915db421cac2e6729e1ab44cf8a';

/// See also [repayGatepass].
@ProviderFor(repayGatepass)
const repayGatepassProvider = RepayGatepassFamily();

/// See also [repayGatepass].
class RepayGatepassFamily extends Family<AsyncValue<Map<String, dynamic>>> {
  /// See also [repayGatepass].
  const RepayGatepassFamily();

  /// See also [repayGatepass].
  RepayGatepassProvider call({
    List<String>? financeId,
    String? finalAmount,
  }) {
    return RepayGatepassProvider(
      financeId: financeId,
      finalAmount: finalAmount,
    );
  }

  @override
  RepayGatepassProvider getProviderOverride(
    covariant RepayGatepassProvider provider,
  ) {
    return call(
      financeId: provider.financeId,
      finalAmount: provider.finalAmount,
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
  String? get name => r'repayGatepassProvider';
}

/// See also [repayGatepass].
class RepayGatepassProvider
    extends AutoDisposeFutureProvider<Map<String, dynamic>> {
  /// See also [repayGatepass].
  RepayGatepassProvider({
    List<String>? financeId,
    String? finalAmount,
  }) : this._internal(
          (ref) => repayGatepass(
            ref as RepayGatepassRef,
            financeId: financeId,
            finalAmount: finalAmount,
          ),
          from: repayGatepassProvider,
          name: r'repayGatepassProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$repayGatepassHash,
          dependencies: RepayGatepassFamily._dependencies,
          allTransitiveDependencies:
              RepayGatepassFamily._allTransitiveDependencies,
          financeId: financeId,
          finalAmount: finalAmount,
        );

  RepayGatepassProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.financeId,
    required this.finalAmount,
  }) : super.internal();

  final List<String>? financeId;
  final String? finalAmount;

  @override
  Override overrideWith(
    FutureOr<Map<String, dynamic>> Function(RepayGatepassRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RepayGatepassProvider._internal(
        (ref) => create(ref as RepayGatepassRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        financeId: financeId,
        finalAmount: finalAmount,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Map<String, dynamic>> createElement() {
    return _RepayGatepassProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RepayGatepassProvider &&
        other.financeId == financeId &&
        other.finalAmount == finalAmount;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, financeId.hashCode);
    hash = _SystemHash.combine(hash, finalAmount.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin RepayGatepassRef on AutoDisposeFutureProviderRef<Map<String, dynamic>> {
  /// The parameter `financeId` of this provider.
  List<String>? get financeId;

  /// The parameter `finalAmount` of this provider.
  String? get finalAmount;
}

class _RepayGatepassProviderElement
    extends AutoDisposeFutureProviderElement<Map<String, dynamic>>
    with RepayGatepassRef {
  _RepayGatepassProviderElement(super.provider);

  @override
  List<String>? get financeId => (origin as RepayGatepassProvider).financeId;
  @override
  String? get finalAmount => (origin as RepayGatepassProvider).finalAmount;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
