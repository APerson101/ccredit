import 'package:ccredit/views/summaries/summaries_providers/summaries_providers.dart';
import 'package:ccredit/views/super%20models/location_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ManualReadingsView extends ConsumerWidget {
  const ManualReadingsView({super.key, required this.location});
  final LocationModel location;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("On-site readings"),
        ),
        body: _DataView(location: location));
  }
}

class _DataView extends ConsumerWidget {
  const _DataView({required this.location});
  final LocationModel location;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(fetchManualDataProvider(location)).when(data: (data) {
      // display data in a table manner
      return SingleChildScrollView(
        child: Column(
            children: data
                .map(
                  (e) => Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: SizedBox(
                          height: 250,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: ListTile(
                                  leading: const Icon(Icons.person),
                                  title: const Text("verifier"),
                                  subtitle: Text(e.verifier.name),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: ListTile(
                                  leading: const Icon(Icons.co2),
                                  title: const Text("CO2 value"),
                                  subtitle: Text(e.value.toString()),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: ListTile(
                                  leading: const Icon(Icons.calendar_month),
                                  title: const Text("Date"),
                                  subtitle: Text(e.date.toString()),
                                ),
                              ),
                            ],
                          )),
                    ),
                  ),
                )
                .toList()),
      );
    }, error: (error, stackTrace) {
      debugPrintStack(stackTrace: stackTrace);
      return const Center(child: Text("Failed to load"));
    }, loading: () {
      return const CircularProgressIndicator.adaptive();
    });
  }
}
