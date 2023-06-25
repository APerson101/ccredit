import 'package:ccredit/views/super%20models/asset_model.dart';
import 'package:ccredit/views/super%20models/location_model.dart';
import 'package:mock_data/mock_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'customer_dashboard_provider.g.dart';

@riverpod
Future<List<String>> fetchLocationNames(FetchLocationNamesRef ref) async {
  return await Future.delayed(const Duration(seconds: 0), () {
    return List.generate(10, (index) => mockString(10));
  });
}

@riverpod
Future<LocationModel> fetchDetailsOfLocation(
    FetchDetailsOfLocationRef ref, String locationName) async {
  return await Future.delayed(const Duration(seconds: 0), () {
    return LocationModel(
        name: mockName(),
        id: '546734578',
        location: LatLong(latitude: "latitude", longitude: "longitude"),
        ownerName: mockName());
  });
}

@riverpod
class FetchLocationDetails extends _$FetchLocationDetails {
  @override
  Future<LocationModel?> build() async {
    return null;
  }

  fetchDets(String name) async {
    state = const AsyncLoading();
    // ref.watch(fetchDetailsOfLocationProvider(name)).when(
    // data: (data) {
    state = AsyncData(LocationModel(
        name: mockName(),
        id: '546734578',
        location: LatLong(latitude: "latitude", longitude: "longitude"),
        ownerName: mockName()));

    // },
    // error: ((error, stackTrace) => state = AsyncError(error, stackTrace)),
    // loading: () => state = const AsyncLoading());
  }
}

@riverpod
Future<(AssetModel, List<AssetModel>)> fetchAssets(FetchAssetsRef ref) async {
  return (
    AssetModel(name: 'Hbar', value: 400, ticker: 'Hbar'),
    List.generate(
        3,
        (index) => AssetModel(
            name: mockName(),
            value: mockInteger(1, 5).toDouble(),
            ticker: 'ccr'))
  );
}
