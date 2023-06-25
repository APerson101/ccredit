import 'package:ccredit/views/customer/models/customer_history_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'customer_history_provider.g.dart';

@riverpod
class CustomerHistory extends _$CustomerHistory {
  @override
  FutureOr<List<CustomerHistoryModel>> build() async {
    state = const AsyncLoading();
    return await Future.delayed(const Duration(seconds: 2), () {
      return List.generate(
        5,
        (index) => CustomerHistoryModel(
            transactionID: '00235991685483625798140552',
            amount: 'amount',
            date: DateTime.now(),
            transactionType: TransactionTypesEnum.buyCcredit),
      );
    });
  }
}
