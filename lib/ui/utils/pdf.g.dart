// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pdf.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$convertAndDownloadHtmlPdfHash() =>
    r'554e12cde5f062f8ec18ef3ccfd5b19ba81377cc';

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

/// See also [convertAndDownloadHtmlPdf].
@ProviderFor(convertAndDownloadHtmlPdf)
const convertAndDownloadHtmlPdfProvider = ConvertAndDownloadHtmlPdfFamily();

/// See also [convertAndDownloadHtmlPdf].
class ConvertAndDownloadHtmlPdfFamily extends Family<AsyncValue<File?>> {
  /// See also [convertAndDownloadHtmlPdf].
  const ConvertAndDownloadHtmlPdfFamily();

  /// See also [convertAndDownloadHtmlPdf].
  ConvertAndDownloadHtmlPdfProvider call({
    String? data,
  }) {
    return ConvertAndDownloadHtmlPdfProvider(
      data: data,
    );
  }

  @override
  ConvertAndDownloadHtmlPdfProvider getProviderOverride(
    covariant ConvertAndDownloadHtmlPdfProvider provider,
  ) {
    return call(
      data: provider.data,
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
  String? get name => r'convertAndDownloadHtmlPdfProvider';
}

/// See also [convertAndDownloadHtmlPdf].
class ConvertAndDownloadHtmlPdfProvider
    extends AutoDisposeFutureProvider<File?> {
  /// See also [convertAndDownloadHtmlPdf].
  ConvertAndDownloadHtmlPdfProvider({
    String? data,
  }) : this._internal(
          (ref) => convertAndDownloadHtmlPdf(
            ref as ConvertAndDownloadHtmlPdfRef,
            data: data,
          ),
          from: convertAndDownloadHtmlPdfProvider,
          name: r'convertAndDownloadHtmlPdfProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$convertAndDownloadHtmlPdfHash,
          dependencies: ConvertAndDownloadHtmlPdfFamily._dependencies,
          allTransitiveDependencies:
              ConvertAndDownloadHtmlPdfFamily._allTransitiveDependencies,
          data: data,
        );

  ConvertAndDownloadHtmlPdfProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.data,
  }) : super.internal();

  final String? data;

  @override
  Override overrideWith(
    FutureOr<File?> Function(ConvertAndDownloadHtmlPdfRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ConvertAndDownloadHtmlPdfProvider._internal(
        (ref) => create(ref as ConvertAndDownloadHtmlPdfRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        data: data,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<File?> createElement() {
    return _ConvertAndDownloadHtmlPdfProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ConvertAndDownloadHtmlPdfProvider && other.data == data;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, data.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ConvertAndDownloadHtmlPdfRef on AutoDisposeFutureProviderRef<File?> {
  /// The parameter `data` of this provider.
  String? get data;
}

class _ConvertAndDownloadHtmlPdfProviderElement
    extends AutoDisposeFutureProviderElement<File?>
    with ConvertAndDownloadHtmlPdfRef {
  _ConvertAndDownloadHtmlPdfProviderElement(super.provider);

  @override
  String? get data => (origin as ConvertAndDownloadHtmlPdfProvider).data;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
