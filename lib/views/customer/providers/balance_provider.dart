import 'package:ccredit/views/customer/models/customer_balance_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'balance_provider.g.dart';

typedef BalancesType = ({
  CustomerBalance dollar,
  CustomerBalance hbar,
  CustomerBalance ngn,
  CustomerBalance ccr
});

@riverpod
class Balances extends _$Balances {
  @override
  FutureOr<BalancesType> build() async {
    state = const AsyncLoading();
    return await Future.delayed(
        const Duration(seconds: 2),
        () => (
              dollar: CustomerBalance(
                  currency: 'USD', value: '10000', ticker: 'usd'),
              hbar: CustomerBalance(
                  currency: 'Hedera', value: '10000', ticker: 'hbar'),
              ngn: CustomerBalance(
                  currency: 'Naira', value: '10000', ticker: 'ngn'),
              ccr: CustomerBalance(
                  currency: 'CCredit', value: '10', ticker: 'ccr')
            ));
  }
}
