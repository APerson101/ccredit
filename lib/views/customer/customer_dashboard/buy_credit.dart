import 'package:ccredit/views/customer/customer_dashboard/autocomplete_search_locations.dart';
import 'package:ccredit/views/customer/providers/customer_dashboard_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../summaries/location_summary.dart';

class BuyCreditView extends ConsumerWidget {
  BuyCreditView({super.key});
  final TextEditingController amountController = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(),
        resizeToAvoidBottomInset: false,
        persistentFooterButtons: [
          ListTile(
              onTap: () {
                // show notification, append to array and reduce balance
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text(
                        "Purchase of credit successful, NFT receipt added to wallet")));
                Navigator.of(context).pop();
              },
              leading: const Icon(Icons.confirmation_number),
              title: const Text("Confirm Purchase"))
        ],
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //show current balance
            const ListTile(
              title: Text("Hbar"),
              subtitle: Text("10_000_000"),
            ),
            // autosuggest of location
            ref.watch(fetchLocationNamesProvider).when(
                data: (data) {
                  return AutoCompleteLocationNamesWidget(locationNames: data);
                },
                error: (error, stackTrace) {
                  debugPrintStack(stackTrace: stackTrace);
                  return const Center(
                    child: Text("Error loading names"),
                  );
                },
                loading: () =>
                    const Center(child: CircularProgressIndicator.adaptive())),
            // info card of receiver
            ref.watch(fetchLocationDetailsProvider).when(
                data: (data) {
                  if (data != null) {
                    return LocationBasicInfoWidget(location: data);
                  }
                  return const Center(child: Text("No such location exists"));
                },
                error: (error, stackTrace) {
                  debugPrintStack(stackTrace: stackTrace);
                  return const Center(
                    child: Text("Failed to load"),
                  );
                },
                loading: () => const Center(
                      child: CircularProgressIndicator.adaptive(),
                    )),
            // text field of amount
            TextFormField(
              controller: amountController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              onChanged: (text) => ref.watch(_isTyping.notifier).state =
                  text.isNotEmpty ? true : false,
              validator: (enteredValue) {
                if (enteredValue != null) {
                  var number = double.tryParse(enteredValue);
                  return number != null && number > 0
                      ? null
                      : 'enter valid number';
                }
                return null;
              },
              decoration: InputDecoration(
                  hintText: 'Enter amount',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            // display cost in dollar
            ref.watch(_isTyping)
                ? double.tryParse(amountController.text) != null
                    ? ListTile(
                        leading: const Icon(Icons.monetization_on),
                        title:
                            Text("${double.parse(amountController.text) * 40}"),
                        subtitle: const Text("Rate: \$40/1000"),
                        trailing: const Text("Dollar equivalent: \$4000"),
                      )
                    : Container()
                : Container(),
            // confirmation button
          ],
        ));
  }
}

final _isTyping = StateProvider((ref) => false);
