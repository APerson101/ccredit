// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'balance_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$balancesHash() => r'93f3f0946e7e64efca281ff17e65a5807db7b310';

/// See also [Balances].
@ProviderFor(Balances)
final balancesProvider = AutoDisposeAsyncNotifierProvider<
    Balances,
    ({
      CustomerBalance ccr,
      CustomerBalance dollar,
      CustomerBalance hbar,
      CustomerBalance ngn
    })>.internal(
  Balances.new,
  name: r'balancesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$balancesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Balances = AutoDisposeAsyncNotifier<
    ({
      CustomerBalance ccr,
      CustomerBalance dollar,
      CustomerBalance hbar,
      CustomerBalance ngn
    })>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
