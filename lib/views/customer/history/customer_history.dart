import 'package:ccredit/views/customer/history/search_field_autocomplete.dart';
import 'package:ccredit/views/customer/providers/customer_history_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/customer_history_model.dart';
import 'customer_history_details.dart';

// shows purchase history
// include search
// include autocomplete, etc
/// Table should include:
/// Transaction Type: onClick, lead to more information, possibleTypes:transfer, purchase, account_creation,
/// DateTime, serial number, amount,
class CustomerHistoryView extends ConsumerWidget {
  CustomerHistoryView({super.key});
  final TextEditingController searchFieldContoller = TextEditingController();
  final DataGridController dataGridController = DataGridController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var provider = ref.watch(customerHistoryProvider);
    return provider.when(data: (data) {
      return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            Row(children: [
              MediaQuery.of(context).size.width > 500
                  ? Expanded(flex: 3, child: Container())
                  : Container(),
              Expanded(flex: 1, child: AutoCompleteSearch(txns: data)),
            ]),
            Expanded(
              child: HistoryTableWidget(data: data),
            )
          ]));
    }, error: (Object error, StackTrace stackTrace) {
      debugPrintStack(stackTrace: stackTrace);
      return const Center(child: Text("Failed to load data, try again"));
    }, loading: () {
      return const Center(child: CircularProgressIndicator.adaptive());
    });
  }
}

class HistoryTableWidget extends StatelessWidget {
  HistoryTableWidget({super.key, required this.data});

  final DataGridController dataGridController = DataGridController();
  final List<CustomerHistoryModel> data;

  @override
  Widget build(BuildContext context) {
    return SfDataGrid(
        controller: dataGridController,
        allowPullToRefresh: true,
        onSelectionChanged: (prev, after) async {
          if (prev != after) {
            var indexOfTapped = (after.first.getCells().first.value as int) - 1;
            // move to details page
            if (!kIsWeb) {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => CustomerHistroyDetails(
                      item: data[indexOfTapped].transactionID)));
            } else {
              await launchUrl(Uri.parse(
                  'https://testnet.dragonglass.me/transactions/${data[indexOfTapped].transactionID}'));
            }
          }
        },
        source: _TransactionsDataSource(data: data),
        selectionMode: SelectionMode.single,
        allowSorting: true,
        columns: _GridColumns.values
            .map((e) => GridColumn(
                columnName: e.label,
                label: Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      e.label.toUpperCase(),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                )))
            .toList());
  }
}

class _TransactionsDataSource extends DataGridSource {
  _TransactionsDataSource({required List<CustomerHistoryModel> data}) {
    gridRows = data
        .map((e) => DataGridRow(cells: [
              DataGridCell(
                  columnName: _GridColumns.serialNumber.label,
                  value: data.indexOf(e) + 1),
              DataGridCell(
                  columnName: _GridColumns.transactionId.label,
                  value: e.transactionID),
              DataGridCell(
                  columnName: _GridColumns.transactionType.label,
                  value: describeEnum(e.transactionType)),
              DataGridCell(
                  columnName: _GridColumns.amount.label, value: e.amount),
              DataGridCell(columnName: _GridColumns.date.label, value: e.date),
            ]))
        .toList();
  }
  List<DataGridRow> gridRows = [];
  @override
  List<DataGridRow> get rows => gridRows;
  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map((e) => Text(e.value.toString())).toList());
  }
}

enum _GridColumns {
  serialNumber(label: "s/n"),
  transactionId(label: "id"),
  transactionType(label: 'type'),
  amount(label: 'amount'),
  date(label: 'date');

  const _GridColumns({required this.label});
  final String label;
}
