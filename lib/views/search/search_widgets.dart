import 'package:ccredit/views/search/search_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AllSearchBarWidget extends ConsumerWidget {
  const AllSearchBarWidget({super.key, required this.suggestions});
  final List<String> suggestions;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Autocomplete<String>(
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text.isEmpty) {
          return const Iterable.empty();
        } else {
          return suggestions.where((element) => element
              .toLowerCase()
              .contains(textEditingValue.text.toLowerCase()));
        }
      },
      onSelected: (selection) {
        ref.watch(searchWidgetProvider.notifier).search(text: selection);
      },
      fieldViewBuilder: (context, controller, node, fieldSubmitted) {
        return TextFormField(
          controller: controller,
          onFieldSubmitted: (value) {
            ref.watch(searchWidgetProvider.notifier).search(text: value);
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
              hintText: 'Search for location, device name, verifier or company',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
        );
      },
    );
  }
}

final _isTyping = StateProvider((ref) => false);
