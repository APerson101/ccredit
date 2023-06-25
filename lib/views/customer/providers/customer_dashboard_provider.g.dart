// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_dashboard_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fetchLocationNamesHash() =>
    r'5a48eb16c4fa1954a138fcf8fd76291e96f4e7e2';

/// See also [fetchLocationNames].
@ProviderFor(fetchLocationNames)
final fetchLocationNamesProvider =
    AutoDisposeFutureProvider<List<String>>.internal(
  fetchLocationNames,
  name: r'fetchLocationNamesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fetchLocationNamesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FetchLocationNamesRef = AutoDisposeFutureProviderRef<List<String>>;
String _$fetchDetailsOfLocationHash() =>
    r'91726ce77b2b4b2aaa99cbac0e23a85ba6a900fe';

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

typedef FetchDetailsOfLocationRef = AutoDisposeFutureProviderRef<LocationModel>;

/// See also [fetchDetailsOfLocation].
@ProviderFor(fetchDetailsOfLocation)
const fetchDetailsOfLocationProvider = FetchDetailsOfLocationFamily();

/// See also [fetchDetailsOfLocation].
class FetchDetailsOfLocationFamily extends Family<AsyncValue<LocationModel>> {
  /// See also [fetchDetailsOfLocation].
  const FetchDetailsOfLocationFamily();

  /// See also [fetchDetailsOfLocation].
  FetchDetailsOfLocationProvider call(
    String locationName,
  ) {
    return FetchDetailsOfLocationProvider(
      locationName,
    );
  }

  @override
  FetchDetailsOfLocationProvider getProviderOverride(
    covariant FetchDetailsOfLocationProvider provider,
  ) {
    return call(
      provider.locationName,
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
  String? get name => r'fetchDetailsOfLocationProvider';
}

/// See also [fetchDetailsOfLocation].
class FetchDetailsOfLocationProvider
    extends AutoDisposeFutureProvider<LocationModel> {
  /// See also [fetchDetailsOfLocation].
  FetchDetailsOfLocationProvider(
    this.locationName,
  ) : super.internal(
          (ref) => fetchDetailsOfLocation(
            ref,
            locationName,
          ),
          from: fetchDetailsOfLocationProvider,
          name: r'fetchDetailsOfLocationProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchDetailsOfLocationHash,
          dependencies: FetchDetailsOfLocationFamily._dependencies,
          allTransitiveDependencies:
              FetchDetailsOfLocationFamily._allTransitiveDependencies,
        );

  final String locationName;

  @override
  bool operator ==(Object other) {
    return other is FetchDetailsOfLocationProvider &&
        other.locationName == locationName;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, locationName.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$fetchAssetsHash() => r'93cd5925be70aa9ec4b683afce9efb0131549b61';

/// See also [fetchAssets].
@ProviderFor(fetchAssets)
final fetchAssetsProvider =
    AutoDisposeFutureProvider<(AssetModel, List<AssetModel>)>.internal(
  fetchAssets,
  name: r'fetchAssetsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$fetchAssetsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FetchAssetsRef
    = AutoDisposeFutureProviderRef<(AssetModel, List<AssetModel>)>;
String _$fetchLocationDetailsHash() =>
    r'be87979c2b4880c87b325ba82381a6a4ba466968';

/// See also [FetchLocationDetails].
@ProviderFor(FetchLocationDetails)
final fetchLocationDetailsProvider = AutoDisposeAsyncNotifierProvider<
    FetchLocationDetails, LocationModel?>.internal(
  FetchLocationDetails.new,
  name: r'fetchLocationDetailsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fetchLocationDetailsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$FetchLocationDetails = AutoDisposeAsyncNotifier<LocationModel?>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
