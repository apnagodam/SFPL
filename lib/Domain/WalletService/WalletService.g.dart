// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'WalletService.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$addMoneyHash() => r'650a5aa718dacb1ec73a727061216ad8dcec6118';

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

String _$walletStatementHash() => r'b705a39bfe0303723ceab90020037b1025632d3f';

/// See also [walletStatement].
@ProviderFor(walletStatement)
const walletStatementProvider = WalletStatementFamily();

/// See also [walletStatement].
class WalletStatementFamily extends Family<AsyncValue<BnplStatementModel>> {
  /// See also [walletStatement].
  const WalletStatementFamily();

  /// See also [walletStatement].
  WalletStatementProvider call({
    String? pastDate,
    String? currentDate,
  }) {
    return WalletStatementProvider(
      pastDate: pastDate,
      currentDate: currentDate,
    );
  }

  @override
  WalletStatementProvider getProviderOverride(
    covariant WalletStatementProvider provider,
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
  String? get name => r'walletStatementProvider';
}

/// See also [walletStatement].
class WalletStatementProvider
    extends AutoDisposeStreamProvider<BnplStatementModel> {
  /// See also [walletStatement].
  WalletStatementProvider({
    String? pastDate,
    String? currentDate,
  }) : this._internal(
          (ref) => walletStatement(
            ref as WalletStatementRef,
            pastDate: pastDate,
            currentDate: currentDate,
          ),
          from: walletStatementProvider,
          name: r'walletStatementProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$walletStatementHash,
          dependencies: WalletStatementFamily._dependencies,
          allTransitiveDependencies:
              WalletStatementFamily._allTransitiveDependencies,
          pastDate: pastDate,
          currentDate: currentDate,
        );

  WalletStatementProvider._internal(
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
    Stream<BnplStatementModel> Function(WalletStatementRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WalletStatementProvider._internal(
        (ref) => create(ref as WalletStatementRef),
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
    return _WalletStatementProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WalletStatementProvider &&
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

mixin WalletStatementRef on AutoDisposeStreamProviderRef<BnplStatementModel> {
  /// The parameter `pastDate` of this provider.
  String? get pastDate;

  /// The parameter `currentDate` of this provider.
  String? get currentDate;
}

class _WalletStatementProviderElement
    extends AutoDisposeStreamProviderElement<BnplStatementModel>
    with WalletStatementRef {
  _WalletStatementProviderElement(super.provider);

  @override
  String? get pastDate => (origin as WalletStatementProvider).pastDate;
  @override
  String? get currentDate => (origin as WalletStatementProvider).currentDate;
}

String _$withdrawMoneyHash() => r'2265863b6a1f887118f01c06ce7d31294ac94c3f';

/// See also [withdrawMoney].
@ProviderFor(withdrawMoney)
const withdrawMoneyProvider = WithdrawMoneyFamily();

/// See also [withdrawMoney].
class WithdrawMoneyFamily extends Family<AsyncValue<Map<String, dynamic>>> {
  /// See also [withdrawMoney].
  const WithdrawMoneyFamily();

  /// See also [withdrawMoney].
  WithdrawMoneyProvider call({
    String? amount,
    String? remark,
  }) {
    return WithdrawMoneyProvider(
      amount: amount,
      remark: remark,
    );
  }

  @override
  WithdrawMoneyProvider getProviderOverride(
    covariant WithdrawMoneyProvider provider,
  ) {
    return call(
      amount: provider.amount,
      remark: provider.remark,
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
  String? get name => r'withdrawMoneyProvider';
}

/// See also [withdrawMoney].
class WithdrawMoneyProvider
    extends AutoDisposeFutureProvider<Map<String, dynamic>> {
  /// See also [withdrawMoney].
  WithdrawMoneyProvider({
    String? amount,
    String? remark,
  }) : this._internal(
          (ref) => withdrawMoney(
            ref as WithdrawMoneyRef,
            amount: amount,
            remark: remark,
          ),
          from: withdrawMoneyProvider,
          name: r'withdrawMoneyProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$withdrawMoneyHash,
          dependencies: WithdrawMoneyFamily._dependencies,
          allTransitiveDependencies:
              WithdrawMoneyFamily._allTransitiveDependencies,
          amount: amount,
          remark: remark,
        );

  WithdrawMoneyProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.amount,
    required this.remark,
  }) : super.internal();

  final String? amount;
  final String? remark;

  @override
  Override overrideWith(
    FutureOr<Map<String, dynamic>> Function(WithdrawMoneyRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WithdrawMoneyProvider._internal(
        (ref) => create(ref as WithdrawMoneyRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        amount: amount,
        remark: remark,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Map<String, dynamic>> createElement() {
    return _WithdrawMoneyProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WithdrawMoneyProvider &&
        other.amount == amount &&
        other.remark == remark;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, amount.hashCode);
    hash = _SystemHash.combine(hash, remark.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin WithdrawMoneyRef on AutoDisposeFutureProviderRef<Map<String, dynamic>> {
  /// The parameter `amount` of this provider.
  String? get amount;

  /// The parameter `remark` of this provider.
  String? get remark;
}

class _WithdrawMoneyProviderElement
    extends AutoDisposeFutureProviderElement<Map<String, dynamic>>
    with WithdrawMoneyRef {
  _WithdrawMoneyProviderElement(super.provider);

  @override
  String? get amount => (origin as WithdrawMoneyProvider).amount;
  @override
  String? get remark => (origin as WithdrawMoneyProvider).remark;
}

String _$moneyRequestListHash() => r'08ee858494c7f72843817b241a42be74949061e8';

/// See also [moneyRequestList].
@ProviderFor(moneyRequestList)
final moneyRequestListProvider =
    AutoDisposeStreamProvider<MoneyRequestModel>.internal(
  moneyRequestList,
  name: r'moneyRequestListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$moneyRequestListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef MoneyRequestListRef = AutoDisposeStreamProviderRef<MoneyRequestModel>;
String _$withdrawlRequestsHash() => r'5363f4a3b6dfafa6f30c8fa7b8fed0b88838559f';

/// See also [withdrawlRequests].
@ProviderFor(withdrawlRequests)
final withdrawlRequestsProvider =
    AutoDisposeStreamProvider<WithdrawlResponseModel>.internal(
  withdrawlRequests,
  name: r'withdrawlRequestsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$withdrawlRequestsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef WithdrawlRequestsRef
    = AutoDisposeStreamProviderRef<WithdrawlResponseModel>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
