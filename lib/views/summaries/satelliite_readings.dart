import 'package:ccredit/views/super%20models/location_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'summaries_providers/summaries_providers.dart';

class SatelliteReadings extends ConsumerWidget {
  const SatelliteReadings({super.key, required this.location});
  final LocationModel location;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Satellite readings"),
        ),
        body: _SatelliteReadingView(location: location));
  }
}

class _SatelliteReadingView extends ConsumerWidget {
  const _SatelliteReadingView({required this.location});
  final LocationModel location;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(fetchsatelliteReadingsProvider(location)).when(
        data: (data) {
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
                                height: 300,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: ListTile(
                                        leading: const Icon(Icons.person),
                                        title: const Text("satellite"),
                                        subtitle: Text(e.satellite.name),
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
                                        leading:
                                            const Icon(Icons.calendar_month),
                                        title: const Text("Date"),
                                        subtitle: Text(e.date.toString()),
                                      ),
                                    ),
                                    ElevatedButton(
                                        onPressed: () async {
                                          await showDialog(
                                              context: context,
                                              builder: (context) {
                                                return const Dialog(
                                                    child:
                                                        FlutterLogo(size: 48));
                                              });
                                        },
                                        child: const Text("View Image"))
                                  ],
                                )),
                          ),
                        ),
                      )
                      .toList()));
        },
        error: (error, stackTrace) {
          debugPrintStack(stackTrace: stackTrace);
          return const Center(child: Text("Failed to load data"));
        },
        loading: () => const CircularProgressIndicator.adaptive());
  }
}
