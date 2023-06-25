// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$loadAnimationHash() => r'a68e3a930de6bb9b79f208e0c38835bcf13f9e45';

/// See also [loadAnimation].
@ProviderFor(loadAnimation)
final loadAnimationProvider =
    AutoDisposeFutureProvider<LottieComposition>.internal(
  loadAnimation,
  name: r'loadAnimationProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$loadAnimationHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef LoadAnimationRef = AutoDisposeFutureProviderRef<LottieComposition>;
String _$getAccountTypeHash() => r'aa96bd7b4945a0216cd29f8737bcde9f9154a17d';

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

typedef GetAccountTypeRef = AutoDisposeFutureProviderRef<String>;

/// See also [getAccountType].
@ProviderFor(getAccountType)
const getAccountTypeProvider = GetAccountTypeFamily();

/// See also [getAccountType].
class GetAccountTypeFamily extends Family<AsyncValue<String>> {
  /// See also [getAccountType].
  const GetAccountTypeFamily();

  /// See also [getAccountType].
  GetAccountTypeProvider call(
    String email,
    String password,
  ) {
    return GetAccountTypeProvider(
      email,
      password,
    );
  }

  @override
  GetAccountTypeProvider getProviderOverride(
    covariant GetAccountTypeProvider provider,
  ) {
    return call(
      provider.email,
      provider.password,
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
  String? get name => r'getAccountTypeProvider';
}

/// See also [getAccountType].
class GetAccountTypeProvider extends AutoDisposeFutureProvider<String> {
  /// See also [getAccountType].
  GetAccountTypeProvider(
    this.email,
    this.password,
  ) : super.internal(
          (ref) => getAccountType(
            ref,
            email,
            password,
          ),
          from: getAccountTypeProvider,
          name: r'getAccountTypeProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getAccountTypeHash,
          dependencies: GetAccountTypeFamily._dependencies,
          allTransitiveDependencies:
              GetAccountTypeFamily._allTransitiveDependencies,
        );

  final String email;
  final String password;

  @override
  bool operator ==(Object other) {
    return other is GetAccountTypeProvider &&
        other.email == email &&
        other.password == password;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, email.hashCode);
    hash = _SystemHash.combine(hash, password.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$authenticationHelperHash() =>
    r'6a931b8b99f4b0bc9323565ba56b387035dded56';

/// See also [AuthenticationHelper].
@ProviderFor(AuthenticationHelper)
final authenticationHelperProvider = AutoDisposeAsyncNotifierProvider<
    AuthenticationHelper, AuthenticationStates>.internal(
  AuthenticationHelper.new,
  name: r'authenticationHelperProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$authenticationHelperHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AuthenticationHelper = AutoDisposeAsyncNotifier<AuthenticationStates>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
