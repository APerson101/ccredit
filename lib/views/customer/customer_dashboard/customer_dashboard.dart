import 'dart:ui';

import 'package:ccredit/views/customer/customer_dashboard/buy_credit.dart';
import 'package:ccredit/views/customer/customer_dashboard/send_hbar.dart';
import 'package:ccredit/views/customer/providers/balance_provider.dart';
import 'package:ccredit/views/customer/providers/customer_summary_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';

import 'qrcode_address.dart';

class CustomerDashboardView extends ConsumerWidget {
  const CustomerDashboardView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isSmallScreen = MediaQuery.of(context).size.width <= 500;
    return Scaffold(
        body: !isSmallScreen
            ? Stack(
                children: [
                  Positioned(
                    top: 0,
                    height: MediaQuery.of(context).size.height * .4,
                    left: 0,
                    right: 0,
                    child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(child: _ButtonsWidget()),
                          SizedBox(width: 10),
                          Expanded(child: _BalanceWidget()),
                        ]),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    height: MediaQuery.of(context).size.height * .4,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(child: _ReportSummaryWidget()),
                        SizedBox(width: 10),
                        Expanded(child: _RecentTransactionWidget()),
                      ],
                    ),
                  )
                ],
              )
            : const _SmallScreenView());
  }
}

class _SmallScreenView extends StatelessWidget {
  const _SmallScreenView();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _ButtonsWidget(),
            _ReportSummaryWidget(),
            _RecentTransactionWidget(),
          ],
        ),
      ),
    );
  }
}

class _ButtonsWidget extends ConsumerWidget {
  const _ButtonsWidget();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DecoratedBox(
        decoration: BoxDecoration(
            image: const DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                  'assets/images/back.png',
                )),
            borderRadius: BorderRadius.circular(20)),
        child: ClipRect(
            child: BackdropFilter(
                filter: ImageFilter.blur(),
                child: DecoratedBox(
                    decoration:
                        BoxDecoration(color: Colors.white.withOpacity(0)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 8),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * .4,
                        child: Column(
                          children: [
                            const ListTile(
                                title: Text("Hello, Soft AI!",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold)),
                                subtitle: Text("profile:company",
                                    style: TextStyle(color: Colors.black)),
                                trailing: CircleAvatar(
                                  radius: 48,
                                  backgroundImage:
                                      AssetImage('assets/images/business.png'),
                                )),
                            const _BalanceWidget(),
                            const SizedBox(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: _IconButtons.values
                                  .map((e) => _IconButton(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) {
                                          switch (e) {
                                            case _IconButtons.buy:
                                              return BuyCreditView();
                                            case _IconButtons.send:
                                              return SendHbarView();
                                            case _IconButtons.view:
                                              return const QRWallet();
                                            default:
                                              return const Center(
                                                  child: Text(
                                                      "do nothing, this is default"));
                                          }
                                        }));
                                      },
                                      button: e))
                                  .toList(),
                            ),
                          ],
                        ),
                      ),
                    )))));
  }
}

class _BalanceWidget extends ConsumerWidget {
  const _BalanceWidget();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isSmallScreen = MediaQuery.of(context).size.width <= 500;

    var balance = ref.watch(balancesProvider).when(data: (data) {
      var curr = ref.watch(_selectedbalanceProvider);
      String value = '';
      switch (curr) {
        case 0:
          value = data.ccr.value;
          break;
        case 1:
          value = data.hbar.value;
          break;
        case 2:
          value = data.dollar.value;
          break;
        case 3:
          value = data.ngn.value;
          break;
        default:
      }
      return !isSmallScreen
          ? Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              const Row(
                children: [
                  Expanded(child: Divider()),
                  Expanded(child: Text("Wallet balances")),
                  Expanded(child: Divider()),
                ],
              ),
              ListTile(
                  title: Text('${data.hbar.currency}: ${data.hbar.value}')),
              ListTile(
                  title: Text('${data.dollar.currency}: ${data.dollar.value}')),
              ListTile(title: Text('${data.ngn.currency}: ${data.ngn.value}')),
              ListTile(title: Text('${data.ccr.currency}: ${data.ccr.value}')),
            ])
          : Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                SizedBox(
                  width: 100,
                  child: DropdownButtonFormField(
                      value: ref.watch(_selectedbalanceProvider),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(20))),
                      items: _Currencies.values
                          .map((e) => DropdownMenuItem(
                              value: e.index,
                              child: FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Text(
                                  e.label,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                              )))
                          .toList(),
                      onChanged: (currencySelected) {
                        if (currencySelected != null) {
                          ref.watch(_selectedbalanceProvider.notifier).state =
                              currencySelected;
                        }
                      }),
                ),
                Expanded(
                  child: ListTile(
                    title: Text(
                      value,
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 48),
                    ),
                    subtitle: const Expanded(
                        child: Text("Exchange rate: 00.4/1000",
                            style: TextStyle(
                              color: Color.fromARGB(255, 139, 139, 139),
                            ))),
                  ),
                ),
              ]),
            ]);
    }, error: (er, st) {
      return const Text("Error when loading");
    }, loading: () {
      return const CircularProgressIndicator.adaptive();
    });
    return DecoratedBox(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: balance,
        ));
  }
}

class _ReportSummaryWidget extends ConsumerWidget {
  const _ReportSummaryWidget();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var summaryWidget = ref.watch(customerSummaryProvider).when(data: (data) {
      return Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text("Sustainability summary"), Icon(Icons.menu)],
            ),
          ),
          Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Expanded(
                    child: Column(
                      children: [
                        ListTile(
                            tileColor: Colors.black.withOpacity(.1),
                            title: const Text('CO2 extracted'),
                            subtitle: Text(data.extracted)),
                        const SizedBox(height: 10),
                        ListTile(
                          tileColor: Colors.black.withOpacity(.1),
                          title: const Text("Dollar value spent"),
                          subtitle: Text(data.amount),
                        )
                      ],
                    ),
                  ))),
        ],
      );
    }, error: (er, st) {
      return const Text("Error");
    }, loading: () {
      return const CircularProgressIndicator.adaptive();
    });
    return summaryWidget;
  }
}

class _RecentTransactionWidget extends ConsumerWidget {
  const _RecentTransactionWidget();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text("Latest transactions"), Icon(Icons.menu_rounded)],
            ),
          ),
          const SizedBox(height: 10),
          Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: FlutterLogo(),
                    title: Text("Transaction Type: Transfer"),
                    subtitle: Text("USD 40 to 0.0.34234"),
                  )))
        ]));
  }
}

class _IconButton extends ConsumerWidget {
  const _IconButton({required this.onTap, required this.button});
  final void Function()? onTap;
  final _IconButtons button;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GlassContainer(
      borderRadius: BorderRadius.circular(20),
      color: ThemeData.dark().cardColor.withOpacity(.4),
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
              onTap: onTap,
              child: Expanded(
                  child: Column(children: [
                DecoratedBox(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: button.icon,
                  ),
                ),
                const SizedBox(
                  height: 7,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(button.text,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                )
              ])))),
    );
  }
}

enum _IconButtons {
  buy(text: "Buy Credit", icon: Icon(Icons.add)),
  send(text: "Send Hbar", icon: Icon(Icons.send)),
  view(text: "View Address", icon: Icon(Icons.qr_code));

  const _IconButtons({
    required this.text,
    required this.icon,
  });
  final String text;
  final Widget icon;
}

enum _Currencies {
  ccr(label: "Ccredit"),
  hdr(label: 'Hbar'),
  usd(label: 'Dollars'),
  ngn(label: "Naira");

  const _Currencies({required this.label});
  final String label;
}

final _selectedbalanceProvider = StateProvider.autoDispose((ref) => 0);
