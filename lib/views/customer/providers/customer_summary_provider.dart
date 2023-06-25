import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'customer_summary_provider.g.dart';

// equivalent CO2 extracted
// equivalent amount
// range duration
// number of stuff purchased
typedef ReportSummary = ({
  String amount,
  DateTime startDate,
  DateTime endDate,
  int purchase,
  String extracted
});

@riverpod
class CustomerSummary extends _$CustomerSummary {
  @override
  FutureOr<ReportSummary> build() async {
    state = const AsyncLoading();
    return await Future.delayed(const Duration(seconds: 2), () {
      return (
        amount: "20000",
        startDate: DateTime.now(),
        endDate: DateTime.now(),
        purchase: 4,
        extracted: "100 kg/C"
      );
    });
  }
}
