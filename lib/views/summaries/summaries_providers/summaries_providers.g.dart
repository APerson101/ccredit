// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'summaries_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fetchLocationCo2DataHash() =>
    r'e499dea8cf485f41adeb7c7fad54c6c8092f4fd4';

/// See also [fetchLocationCo2Data].
@ProviderFor(fetchLocationCo2Data)
final fetchLocationCo2DataProvider = AutoDisposeFutureProvider<
    List<({double consumption, DateTime date})>>.internal(
  fetchLocationCo2Data,
  name: r'fetchLocationCo2DataProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fetchLocationCo2DataHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FetchLocationCo2DataRef
    = AutoDisposeFutureProviderRef<List<({double consumption, DateTime date})>>;
String _$fetchAtmosphereDataHash() =>
    r'986344e5431ecc83ca6e3f01429984477b18c024';

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

typedef FetchAtmosphereDataRef = AutoDisposeFutureProviderRef<
    ({double humidity, double ozone, double pm, double pressure, double temp})>;

/// See also [fetchAtmosphereData].
@ProviderFor(fetchAtmosphereData)
const fetchAtmosphereDataProvider = FetchAtmosphereDataFamily();

/// See also [fetchAtmosphereData].
class FetchAtmosphereDataFamily extends Family<
    AsyncValue<
        ({
          double humidity,
          double ozone,
          double pm,
          double pressure,
          double temp
        })>> {
  /// See also [fetchAtmosphereData].
  const FetchAtmosphereDataFamily();

  /// See also [fetchAtmosphereData].
  FetchAtmosphereDataProvider call(
    LocationModel location,
  ) {
    return FetchAtmosphereDataProvider(
      location,
    );
  }

  @override
  FetchAtmosphereDataProvider getProviderOverride(
    covariant FetchAtmosphereDataProvider provider,
  ) {
    return call(
      provider.location,
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
  String? get name => r'fetchAtmosphereDataProvider';
}

/// See also [fetchAtmosphereData].
class FetchAtmosphereDataProvider extends AutoDisposeFutureProvider<
    ({
      double humidity,
      double ozone,
      double pm,
      double pressure,
      double temp
    })> {
  /// See also [fetchAtmosphereData].
  FetchAtmosphereDataProvider(
    this.location,
  ) : super.internal(
          (ref) => fetchAtmosphereData(
            ref,
            location,
          ),
          from: fetchAtmosphereDataProvider,
          name: r'fetchAtmosphereDataProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchAtmosphereDataHash,
          dependencies: FetchAtmosphereDataFamily._dependencies,
          allTransitiveDependencies:
              FetchAtmosphereDataFamily._allTransitiveDependencies,
        );

  final LocationModel location;

  @override
  bool operator ==(Object other) {
    return other is FetchAtmosphereDataProvider && other.location == location;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, location.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$fetchManualDataHash() => r'1515981ef14a38e81294a92e301c6714ffd9e2de';
typedef FetchManualDataRef = AutoDisposeFutureProviderRef<
    List<({DateTime date, double value, VerifierModel verifier})>>;

/// See also [fetchManualData].
@ProviderFor(fetchManualData)
const fetchManualDataProvider = FetchManualDataFamily();

/// See also [fetchManualData].
class FetchManualDataFamily extends Family<
    AsyncValue<List<({DateTime date, double value, VerifierModel verifier})>>> {
  /// See also [fetchManualData].
  const FetchManualDataFamily();

  /// See also [fetchManualData].
  FetchManualDataProvider call(
    LocationModel location,
  ) {
    return FetchManualDataProvider(
      location,
    );
  }

  @override
  FetchManualDataProvider getProviderOverride(
    covariant FetchManualDataProvider provider,
  ) {
    return call(
      provider.location,
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
  String? get name => r'fetchManualDataProvider';
}

/// See also [fetchManualData].
class FetchManualDataProvider extends AutoDisposeFutureProvider<
    List<({DateTime date, double value, VerifierModel verifier})>> {
  /// See also [fetchManualData].
  FetchManualDataProvider(
    this.location,
  ) : super.internal(
          (ref) => fetchManualData(
            ref,
            location,
          ),
          from: fetchManualDataProvider,
          name: r'fetchManualDataProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchManualDataHash,
          dependencies: FetchManualDataFamily._dependencies,
          allTransitiveDependencies:
              FetchManualDataFamily._allTransitiveDependencies,
        );

  final LocationModel location;

  @override
  bool operator ==(Object other) {
    return other is FetchManualDataProvider && other.location == location;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, location.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$fetchsatelliteReadingsHash() =>
    r'da17cf7f1e305a218f79beaec9f12b0f5813f1e3';
typedef FetchsatelliteReadingsRef = AutoDisposeFutureProviderRef<
    List<
        ({
          DateTime date,
          SatelliteInfoModel satellite,
          String url,
          double value
        })>>;

/// See also [fetchsatelliteReadings].
@ProviderFor(fetchsatelliteReadings)
const fetchsatelliteReadingsProvider = FetchsatelliteReadingsFamily();

/// See also [fetchsatelliteReadings].
class FetchsatelliteReadingsFamily extends Family<
    AsyncValue<
        List<
            ({
              DateTime date,
              SatelliteInfoModel satellite,
              String url,
              double value
            })>>> {
  /// See also [fetchsatelliteReadings].
  const FetchsatelliteReadingsFamily();

  /// See also [fetchsatelliteReadings].
  FetchsatelliteReadingsProvider call(
    LocationModel location,
  ) {
    return FetchsatelliteReadingsProvider(
      location,
    );
  }

  @override
  FetchsatelliteReadingsProvider getProviderOverride(
    covariant FetchsatelliteReadingsProvider provider,
  ) {
    return call(
      provider.location,
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
  String? get name => r'fetchsatelliteReadingsProvider';
}

/// See also [fetchsatelliteReadings].
class FetchsatelliteReadingsProvider extends AutoDisposeFutureProvider<
    List<
        ({
          DateTime date,
          SatelliteInfoModel satellite,
          String url,
          double value
        })>> {
  /// See also [fetchsatelliteReadings].
  FetchsatelliteReadingsProvider(
    this.location,
  ) : super.internal(
          (ref) => fetchsatelliteReadings(
            ref,
            location,
          ),
          from: fetchsatelliteReadingsProvider,
          name: r'fetchsatelliteReadingsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchsatelliteReadingsHash,
          dependencies: FetchsatelliteReadingsFamily._dependencies,
          allTransitiveDependencies:
              FetchsatelliteReadingsFamily._allTransitiveDependencies,
        );

  final LocationModel location;

  @override
  bool operator ==(Object other) {
    return other is FetchsatelliteReadingsProvider &&
        other.location == location;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, location.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
