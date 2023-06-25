import 'package:ccredit/views/customer/providers/customer_dashboard_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SendHbarView extends ConsumerWidget {
  SendHbarView({super.key});
  final TextEditingController receiverController = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      persistentFooterButtons: [
        Card(
          child: ListTile(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("successfully sent")));
              Navigator.of(context).pop();
            },
            title: const Text("confirm transfer"),
            leading: const Icon(Icons.send),
          ),
        )
      ],
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            TextFormField(
              controller: receiverController,
              decoration: InputDecoration(
                  hintText: 'Enter receiver address',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),

            // show assets
            const Row(
              children: [
                Expanded(child: Divider()),
                Expanded(child: Text('Select Asset')),
                Expanded(child: Divider()),
              ],
            ),
            ref.watch(fetchAssetsProvider).when(
                data: (data) {
                  return Expanded(
                      child: Column(
                    children: [
                      ListTile(
                        tileColor: ref.watch(_isAssetSelectedProvider) == 0
                            ? Colors.greenAccent
                            : null,
                        onTap: () {
                          ref.watch(_isAssetSelectedProvider.notifier).state =
                              0;
                        },
                        title: Text(data.$1.name),
                      ),
                      ...data.$2
                          .map((e) => ListTile(
                                tileColor:
                                    ref.watch(_isAssetSelectedProvider) ==
                                            data.$2.indexOf(e) + 1
                                        ? Colors.greenAccent
                                        : null,
                                onTap: () {
                                  ref
                                      .watch(_isAssetSelectedProvider.notifier)
                                      .state = data.$2.indexOf(e) + 1;
                                },
                                title: Text(e.name),
                              ))
                          .toList(),
                    ],
                  ));
                },
                error: (error, stackTrace) {
                  debugPrintStack(stackTrace: stackTrace);
                  return const Center(child: Text("Failed to load"));
                },
                loading: () =>
                    const Center(child: CircularProgressIndicator.adaptive()))
          ]),
        ),
      ),
    );
  }
}

final _isAssetSelectedProvider = StateProvider((ref) => 0);
