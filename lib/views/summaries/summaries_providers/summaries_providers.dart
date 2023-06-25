import 'package:ccredit/views/super%20models/location_model.dart';
import 'package:mock_data/mock_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../super models/satellite_model.dart';
import '../../super models/verifier_model.dart';

part 'summaries_providers.g.dart';

typedef LocationGraph = List<({DateTime date, double consumption})>;
typedef ManualDataType
    = List<({DateTime date, double value, VerifierModel verifier})>;
typedef AutomaticDataType = List<
    ({
      DateTime date,
      double value,
      SatelliteInfoModel satellite,
      String url,
    })>;
typedef AtmospherInfo = ({
  double temp,
  double pressure,
  double pm,
  double ozone,
  double humidity,
});
@riverpod
Future<LocationGraph> fetchLocationCo2Data(FetchLocationCo2DataRef ref) async {
  return await Future.delayed(const Duration(seconds: 0), () {
    return List.generate(
        15,
        (index) => (
              date: DateTime(
                  DateTime.now().year, DateTime.now().month, index + 1),
              consumption: mockInteger(1, 10).toDouble()
            ));
  });
}

@riverpod
Future<AtmospherInfo> fetchAtmosphereData(
    FetchAtmosphereDataRef ref, LocationModel location) async {
  return await Future.delayed(const Duration(seconds: 1), () {
    return (
      temp: mockInteger(1, 10).toDouble(),
      pressure: mockInteger(1, 10).toDouble(),
      pm: mockInteger(1, 10).toDouble(),
      ozone: mockInteger(1, 10).toDouble(),
      humidity: mockInteger(1, 10).toDouble()
    );
  });
}

@riverpod
Future<ManualDataType> fetchManualData(
    FetchManualDataRef ref, LocationModel location) async {
  return await Future.delayed(const Duration(seconds: 0), () {
    return List.generate(
        10,
        (index) => (
              date:
                  DateTime(DateTime.now().year, index + 1, DateTime.now().day),
              value: mockInteger(1, 10).toDouble(),
              verifier: VerifierModel(
                email: "test@gmail.com",
                number: "12324432",
                location: 'Test verified location',
                name: 'test verifier',
                numberOfVerifications: 4,
              )
            ));
  });
}

@riverpod
Future<AutomaticDataType> fetchsatelliteReadings(
    FetchsatelliteReadingsRef ref, LocationModel location) async {
  return await Future.delayed(const Duration(seconds: 0), () {
    return List.generate(
        10,
        (index) => (
              date:
                  DateTime(DateTime.now().year, index + 1, DateTime.now().day),
              value: mockInteger(1, 10).toDouble(),
              url: "test",
              satellite: SatelliteInfoModel(name: 'CSAT 1')
            ));
  });
}
