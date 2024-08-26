// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'WalletService.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$addMoneyHash() => r'5d2193c227111e6a026dabb973379211a67676de';

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

/// See also [addMoney].
@ProviderFor(addMoney)
const addMoneyProvider = AddMoneyFamily();

/// See also [addMoney].
class AddMoneyFamily extends Family<AsyncValue<Map<String, dynamic>>> {
  /// See also [addMoney].
  const AddMoneyFamily();

  /// See also [addMoney].
  AddMoneyProvider call({
    String? amount,
    String? paymentType,
    File? image,
  }) {
    return AddMoneyProvider(
      amount: amount,
      paymentType: paymentType,
      image: image,
    );
  }

  @override
  AddMoneyProvider getProviderOverride(
    covariant AddMoneyProvider provider,
  ) {
    return call(
      amount: provider.amount,
      paymentType: provider.paymentType,
      image: provider.image,
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
  String? get name => r'addMoneyProvider';
}

/// See also [addMoney].
class AddMoneyProvider extends AutoDisposeFutureProvider<Map<String, dynamic>> {
  /// See also [addMoney].
  AddMoneyProvider({
    String? amount,
    String? paymentType,
    File? image,
  }) : this._internal(
          (ref) => addMoney(
            ref as AddMoneyRef,
            amount: amount,
            paymentType: paymentType,
            image: image,
          ),
          from: addMoneyProvider,
          name: r'addMoneyProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$addMoneyHash,
          dependencies: AddMoneyFamily._dependencies,
          allTransitiveDependencies: AddMoneyFamily._allTransitiveDependencies,
          amount: amount,
          paymentType: paymentType,
          image: image,
        );

  AddMoneyProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.amount,
    required this.paymentType,
    required this.image,
  }) : super.internal();

  final String? amount;
  final String? paymentType;
  final File? image;

  @override
  Override overrideWith(
    FutureOr<Map<String, dynamic>> Function(AddMoneyRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AddMoneyProvider._internal(
        (ref) => create(ref as AddMoneyRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        amount: amount,
        paymentType: paymentType,
        image: image,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Map<String, dynamic>> createElement() {
    return _AddMoneyProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AddMoneyProvider &&
        other.amount == amount &&
        other.paymentType == paymentType &&
        other.image == image;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, amount.hashCode);
    hash = _SystemHash.combine(hash, paymentType.hashCode);
    hash = _SystemHash.combine(hash, image.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AddMoneyRef on AutoDisposeFutureProviderRef<Map<String, dynamic>> {
  /// The parameter `amount` of this provider.
  String? get amount;

  /// The parameter `paymentType` of this provider.
  String? get paymentType;

  /// The parameter `image` of this provider.
  File? get image;
}

class _AddMoneyProviderElement
    extends AutoDisposeFutureProviderElement<Map<String, dynamic>>
    with AddMoneyRef {
  _AddMoneyProviderElement(super.provider);

  @override
  String? get amount => (origin as AddMoneyProvider).amount;
  @override
  String? get paymentType => (origin as AddMoneyProvider).paymentType;
  @override
  File? get image => (origin as AddMoneyProvider).image;
}

String _$moneyRequestListHash() => r'd87cd00b9af4794f5115603dc7e852390745e9a6';

/// See also [moneyRequestList].
@ProviderFor(moneyRequestList)
final moneyRequestListProvider =
    AutoDisposeFutureProvider<MoneyRequestModel>.internal(
  moneyRequestList,
  name: r'moneyRequestListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$moneyRequestListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef MoneyRequestListRef = AutoDisposeFutureProviderRef<MoneyRequestModel>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
