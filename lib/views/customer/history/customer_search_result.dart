import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/customer_history_provider.dart';
import 'customer_history.dart';

class SearchResult extends ConsumerWidget {
  const SearchResult({super.key, required this.id});
  final String id;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var provider = ref.watch(customerHistoryProvider);
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: provider.when(data: (data) {
            data = data
                .where((element) => element.transactionID.contains(id))
                .toList();
            if (data.isNotEmpty) {
              return Expanded(
                child: HistoryTableWidget(data: data),
              );
            }
            return const Center(child: Text("No such transaction ID exists"));
          }, error: (Object error, StackTrace stackTrace) {
            debugPrintStack(stackTrace: stackTrace);
            return const Center(child: Text("Failed to load data, try again"));
          }, loading: () {
            return const Center(child: CircularProgressIndicator.adaptive());
          })),
    );
  }
}
