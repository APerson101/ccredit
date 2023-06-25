// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_summary_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$customerSummaryHash() => r'194186f838e406e59214ea965408af31d1131774';

/// See also [CustomerSummary].
@ProviderFor(CustomerSummary)
final customerSummaryProvider = AutoDisposeAsyncNotifierProvider<
    CustomerSummary,
    ({
      String amount,
      DateTime endDate,
      String extracted,
      int purchase,
      DateTime startDate
    })>.internal(
  CustomerSummary.new,
  name: r'customerSummaryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$customerSummaryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CustomerSummary = AutoDisposeAsyncNotifier<
    ({
      String amount,
      DateTime endDate,
      String extracted,
      int purchase,
      DateTime startDate
    })>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
