import 'package:ccredit/views/super%20models/verifier_model.dart';
import 'package:mock_data/mock_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../super models/business_model.dart';
import '../super models/location_model.dart';

part 'search_provider.g.dart';

typedef SearchInfoType = ({
  List<LocationModel> locations,
  List<VerifierModel> verifiers,
  List<BusinessModel> businesses,
});

@riverpod
class AllSearch extends _$AllSearch {
  @override
  FutureOr<SearchInfoType> build() async {
    state = const AsyncLoading();
    return await Future.delayed(
        const Duration(seconds: 0),
        () => (
              locations: <LocationModel>[],
              verifiers: <VerifierModel>[],
              businesses: <BusinessModel>[]
            ));
  }

  fetchSearchData(String text) async {
    state = const AsyncLoading();
    var locationdata = await Future.delayed(
        const Duration(seconds: 0),
        () => List.generate(
            10,
            (index) => LocationModel(
                name: mockString(6),
                ownerName: mockName(),
                id: mockUUID(),
                location: LatLong(
                    latitude: mockString(6), longitude: mockString(6)))));
    var verifierdata = await Future.delayed(
        const Duration(seconds: 0),
        () => List.generate(
            10,
            (index) => VerifierModel(
                  name: mockString(6),
                  location: mockString(6),
                  email: '${mockName()}@gmail.com',
                  number: mockInteger(50, 10000).toString(),
                  numberOfVerifications: mockInteger(0, 11),
                )));
    var businessesdata = await Future.delayed(
        const Duration(seconds: 0),
        () => List.generate(
            10,
            (index) => BusinessModel(
                name: mockString(6),
                location: mockString(6),
                number: mockInteger(10, 11).toString(),
                dateCreated: mockDate(),
                email: '${mockName()}@gmail.com')));
    state = AsyncData((
      locations:
          locationdata.where((element) => element.name.contains(text)).toList(),
      verifiers:
          verifierdata.where((element) => element.name.contains(text)).toList(),
      businesses: businessesdata
          .where((element) => element.name.contains(text))
          .toList(),
    ));
  }
}

@riverpod
class SearchWidget extends _$SearchWidget {
  @override
  FutureOr<List<String>> build() async {
    state = const AsyncLoading();
    // load all locations
    //load all devices
    // load all companies
    // load all verifiers
    // get name and send back

    return await Future.delayed(const Duration(seconds: 0), () {
      return List.generate(20, (index) => mockString(10));
    });
  }

  search({required String text}) async {
    ref.watch(allSearchProvider.notifier).fetchSearchData(text);
  }
}
