import 'package:ccredit/views/customer/history/customer_history_details.dart';
import 'package:ccredit/views/customer/models/customer_history_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'customer_search_result.dart';

class AutoCompleteSearch extends ConsumerWidget {
  const AutoCompleteSearch({super.key, required this.txns});
  final List<CustomerHistoryModel> txns;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Autocomplete<String>(
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text.isEmpty) {
          return const Iterable.empty();
        } else {
          var matches = txns.where((element) => element.transactionID
              .toLowerCase()
              .contains(textEditingValue.text.toLowerCase()));
          List<String> path = [];
          for (var element in matches) {
            path.add(element.transactionID);
          }
          return path;
        }
      },
      onSelected: (selection) {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return CustomerHistroyDetails(item: selection);
        }));
      },
      fieldViewBuilder: (context, controller, node, fieldSubmitted) {
        return TextFormField(
          controller: controller,
          onFieldSubmitted: (value) {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return SearchResult(id: value);
            }));
          },
          focusNode: node,
          onChanged: (val) => ref.watch(_isTyping.notifier).state =
              val.isNotEmpty ? true : false,
          textInputAction: TextInputAction.search,
          decoration: InputDecoration(
              suffixIcon: !ref.watch(_isTyping)
                  ? null
                  : IconButton(
                      icon: const Icon(Icons.cancel),
                      onPressed: () {
                        controller.text = '';
                        ref.watch(_isTyping.notifier).state = false;
                      },
                    ),
              hintText: 'Search by transaction id',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
        );
      },
    );
  }
}

final _isTyping = StateProvider((ref) => false);
