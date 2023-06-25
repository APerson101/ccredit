import 'package:ccredit/views/customer/providers/customer_dashboard_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AutoCompleteLocationNamesWidget extends ConsumerWidget {
  const AutoCompleteLocationNamesWidget(
      {super.key, required this.locationNames});
  final List<String> locationNames;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Autocomplete<String>(
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text.isEmpty) {
          return const Iterable.empty();
        } else {
          return locationNames.where((element) => element
              .toLowerCase()
              .contains(textEditingValue.text.toLowerCase()));
        }
      },
      onSelected: (selection) {
        ref.watch(fetchLocationDetailsProvider.notifier).fetchDets(selection);
      },
      fieldViewBuilder: (context, controller, node, fieldSubmitted) {
        return TextFormField(
          controller: controller,
          onFieldSubmitted: (value) {
            ref.watch(fetchLocationDetailsProvider.notifier).fetchDets(value);
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
              hintText: 'Enter location name',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
        );
      },
    );
  }
}

final _isTyping = StateProvider((ref) => false);
