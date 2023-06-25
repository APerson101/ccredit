// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$allSearchHash() => r'c19d4f95c1f02472ea16bf7cbd0acd97d93cbdb4';

/// See also [AllSearch].
@ProviderFor(AllSearch)
final allSearchProvider = AutoDisposeAsyncNotifierProvider<
    AllSearch,
    ({
      List<BusinessModel> businesses,
      List<LocationModel> locations,
      List<VerifierModel> verifiers
    })>.internal(
  AllSearch.new,
  name: r'allSearchProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$allSearchHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AllSearch = AutoDisposeAsyncNotifier<
    ({
      List<BusinessModel> businesses,
      List<LocationModel> locations,
      List<VerifierModel> verifiers
    })>;
String _$searchWidgetHash() => r'f699500491b30ce4d4bae83a437383d5117419da';

/// See also [SearchWidget].
@ProviderFor(SearchWidget)
final searchWidgetProvider =
    AutoDisposeAsyncNotifierProvider<SearchWidget, List<String>>.internal(
  SearchWidget.new,
  name: r'searchWidgetProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$searchWidgetHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SearchWidget = AutoDisposeAsyncNotifier<List<String>>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
