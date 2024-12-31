// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pdf.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$convertAndDownloadHtmlPdfHash() =>
    r'c9e60415c88d908b05e70f8365f05cd527bced33';

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

String _$downloadFileBGHash() => r'deb813d2810c34096b13d1e31c1681793d8fcd5b';

/// See also [downloadFileBG].
@ProviderFor(downloadFileBG)
const downloadFileBGProvider = DownloadFileBGFamily();

/// See also [downloadFileBG].
class DownloadFileBGFamily extends Family<AsyncValue<File?>> {
  /// See also [downloadFileBG].
  const DownloadFileBGFamily();

  /// See also [downloadFileBG].
  DownloadFileBGProvider call({
    required String? fileName,
    required String? url,
  }) {
    return DownloadFileBGProvider(
      fileName: fileName,
      url: url,
    );
  }

  @override
  DownloadFileBGProvider getProviderOverride(
    covariant DownloadFileBGProvider provider,
  ) {
    return call(
      fileName: provider.fileName,
      url: provider.url,
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
  String? get name => r'downloadFileBGProvider';
}

/// See also [downloadFileBG].
class DownloadFileBGProvider extends AutoDisposeFutureProvider<File?> {
  /// See also [downloadFileBG].
  DownloadFileBGProvider({
    required String? fileName,
    required String? url,
  }) : this._internal(
          (ref) => downloadFileBG(
            ref as DownloadFileBGRef,
            fileName: fileName,
            url: url,
          ),
          from: downloadFileBGProvider,
          name: r'downloadFileBGProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$downloadFileBGHash,
          dependencies: DownloadFileBGFamily._dependencies,
          allTransitiveDependencies:
              DownloadFileBGFamily._allTransitiveDependencies,
          fileName: fileName,
          url: url,
        );

  DownloadFileBGProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.fileName,
    required this.url,
  }) : super.internal();

  final String? fileName;
  final String? url;

  @override
  Override overrideWith(
    FutureOr<File?> Function(DownloadFileBGRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DownloadFileBGProvider._internal(
        (ref) => create(ref as DownloadFileBGRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        fileName: fileName,
        url: url,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<File?> createElement() {
    return _DownloadFileBGProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DownloadFileBGProvider &&
        other.fileName == fileName &&
        other.url == url;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, fileName.hashCode);
    hash = _SystemHash.combine(hash, url.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DownloadFileBGRef on AutoDisposeFutureProviderRef<File?> {
  /// The parameter `fileName` of this provider.
  String? get fileName;

  /// The parameter `url` of this provider.
  String? get url;
}

class _DownloadFileBGProviderElement
    extends AutoDisposeFutureProviderElement<File?> with DownloadFileBGRef {
  _DownloadFileBGProviderElement(super.provider);

  @override
  String? get fileName => (origin as DownloadFileBGProvider).fileName;
  @override
  String? get url => (origin as DownloadFileBGProvider).url;
}

String _$downloadFileBGAgreementHash() =>
    r'fadbbce54e93f8f91f5972aca8d3132f25736286';

/// See also [downloadFileBGAgreement].
@ProviderFor(downloadFileBGAgreement)
const downloadFileBGAgreementProvider = DownloadFileBGAgreementFamily();

/// See also [downloadFileBGAgreement].
class DownloadFileBGAgreementFamily extends Family<AsyncValue<File?>> {
  /// See also [downloadFileBGAgreement].
  const DownloadFileBGAgreementFamily();

  /// See also [downloadFileBGAgreement].
  DownloadFileBGAgreementProvider call({
    required String? fileName,
    required String? url,
  }) {
    return DownloadFileBGAgreementProvider(
      fileName: fileName,
      url: url,
    );
  }

  @override
  DownloadFileBGAgreementProvider getProviderOverride(
    covariant DownloadFileBGAgreementProvider provider,
  ) {
    return call(
      fileName: provider.fileName,
      url: provider.url,
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
  String? get name => r'downloadFileBGAgreementProvider';
}

/// See also [downloadFileBGAgreement].
class DownloadFileBGAgreementProvider extends AutoDisposeFutureProvider<File?> {
  /// See also [downloadFileBGAgreement].
  DownloadFileBGAgreementProvider({
    required String? fileName,
    required String? url,
  }) : this._internal(
          (ref) => downloadFileBGAgreement(
            ref as DownloadFileBGAgreementRef,
            fileName: fileName,
            url: url,
          ),
          from: downloadFileBGAgreementProvider,
          name: r'downloadFileBGAgreementProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$downloadFileBGAgreementHash,
          dependencies: DownloadFileBGAgreementFamily._dependencies,
          allTransitiveDependencies:
              DownloadFileBGAgreementFamily._allTransitiveDependencies,
          fileName: fileName,
          url: url,
        );

  DownloadFileBGAgreementProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.fileName,
    required this.url,
  }) : super.internal();

  final String? fileName;
  final String? url;

  @override
  Override overrideWith(
    FutureOr<File?> Function(DownloadFileBGAgreementRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DownloadFileBGAgreementProvider._internal(
        (ref) => create(ref as DownloadFileBGAgreementRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        fileName: fileName,
        url: url,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<File?> createElement() {
    return _DownloadFileBGAgreementProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DownloadFileBGAgreementProvider &&
        other.fileName == fileName &&
        other.url == url;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, fileName.hashCode);
    hash = _SystemHash.combine(hash, url.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DownloadFileBGAgreementRef on AutoDisposeFutureProviderRef<File?> {
  /// The parameter `fileName` of this provider.
  String? get fileName;

  /// The parameter `url` of this provider.
  String? get url;
}

class _DownloadFileBGAgreementProviderElement
    extends AutoDisposeFutureProviderElement<File?>
    with DownloadFileBGAgreementRef {
  _DownloadFileBGAgreementProviderElement(super.provider);

  @override
  String? get fileName => (origin as DownloadFileBGAgreementProvider).fileName;
  @override
  String? get url => (origin as DownloadFileBGAgreementProvider).url;
}

String _$downloadFileHash() => r'6c2f7f45facdb719202965a62d90fc479d5ebb89';

/// See also [downloadFile].
@ProviderFor(downloadFile)
const downloadFileProvider = DownloadFileFamily();

/// See also [downloadFile].
class DownloadFileFamily extends Family<AsyncValue<File?>> {
  /// See also [downloadFile].
  const DownloadFileFamily();

  /// See also [downloadFile].
  DownloadFileProvider call({
    required String? fileName,
    required String? url,
  }) {
    return DownloadFileProvider(
      fileName: fileName,
      url: url,
    );
  }

  @override
  DownloadFileProvider getProviderOverride(
    covariant DownloadFileProvider provider,
  ) {
    return call(
      fileName: provider.fileName,
      url: provider.url,
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
  String? get name => r'downloadFileProvider';
}

/// See also [downloadFile].
class DownloadFileProvider extends AutoDisposeFutureProvider<File?> {
  /// See also [downloadFile].
  DownloadFileProvider({
    required String? fileName,
    required String? url,
  }) : this._internal(
          (ref) => downloadFile(
            ref as DownloadFileRef,
            fileName: fileName,
            url: url,
          ),
          from: downloadFileProvider,
          name: r'downloadFileProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$downloadFileHash,
          dependencies: DownloadFileFamily._dependencies,
          allTransitiveDependencies:
              DownloadFileFamily._allTransitiveDependencies,
          fileName: fileName,
          url: url,
        );

  DownloadFileProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.fileName,
    required this.url,
  }) : super.internal();

  final String? fileName;
  final String? url;

  @override
  Override overrideWith(
    FutureOr<File?> Function(DownloadFileRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DownloadFileProvider._internal(
        (ref) => create(ref as DownloadFileRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        fileName: fileName,
        url: url,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<File?> createElement() {
    return _DownloadFileProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DownloadFileProvider &&
        other.fileName == fileName &&
        other.url == url;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, fileName.hashCode);
    hash = _SystemHash.combine(hash, url.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DownloadFileRef on AutoDisposeFutureProviderRef<File?> {
  /// The parameter `fileName` of this provider.
  String? get fileName;

  /// The parameter `url` of this provider.
  String? get url;
}

class _DownloadFileProviderElement
    extends AutoDisposeFutureProviderElement<File?> with DownloadFileRef {
  _DownloadFileProviderElement(super.provider);

  @override
  String? get fileName => (origin as DownloadFileProvider).fileName;
  @override
  String? get url => (origin as DownloadFileProvider).url;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
