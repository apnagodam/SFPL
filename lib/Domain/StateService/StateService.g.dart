// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'StateService.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$stateListHash() => r'fc2d67144e8dfa2208975ca1fb1ecdb3a0df4d10';

/// See also [stateList].
@ProviderFor(stateList)
final stateListProvider =
    AutoDisposeStreamProvider<StatesResponseModel>.internal(
  stateList,
  name: r'stateListProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$stateListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef StateListRef = AutoDisposeStreamProviderRef<StatesResponseModel>;
String _$districtListHash() => r'd08935f13b374ec49c04a67a3b91a628d279ecaa';

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

/// See also [districtList].
@ProviderFor(districtList)
const districtListProvider = DistrictListFamily();

/// See also [districtList].
class DistrictListFamily extends Family<AsyncValue<DistrictsResponseModel>> {
  /// See also [districtList].
  const DistrictListFamily();

  /// See also [districtList].
  DistrictListProvider call({
    String? code,
  }) {
    return DistrictListProvider(
      code: code,
    );
  }

  @override
  DistrictListProvider getProviderOverride(
    covariant DistrictListProvider provider,
  ) {
    return call(
      code: provider.code,
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
  String? get name => r'districtListProvider';
}

/// See also [districtList].
class DistrictListProvider
    extends AutoDisposeStreamProvider<DistrictsResponseModel> {
  /// See also [districtList].
  DistrictListProvider({
    String? code,
  }) : this._internal(
          (ref) => districtList(
            ref as DistrictListRef,
            code: code,
          ),
          from: districtListProvider,
          name: r'districtListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$districtListHash,
          dependencies: DistrictListFamily._dependencies,
          allTransitiveDependencies:
              DistrictListFamily._allTransitiveDependencies,
          code: code,
        );

  DistrictListProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.code,
  }) : super.internal();

  final String? code;

  @override
  Override overrideWith(
    Stream<DistrictsResponseModel> Function(DistrictListRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DistrictListProvider._internal(
        (ref) => create(ref as DistrictListRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        code: code,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<DistrictsResponseModel> createElement() {
    return _DistrictListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DistrictListProvider && other.code == code;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, code.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DistrictListRef on AutoDisposeStreamProviderRef<DistrictsResponseModel> {
  /// The parameter `code` of this provider.
  String? get code;
}

class _DistrictListProviderElement
    extends AutoDisposeStreamProviderElement<DistrictsResponseModel>
    with DistrictListRef {
  _DistrictListProviderElement(super.provider);

  @override
  String? get code => (origin as DistrictListProvider).code;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
