import 'package:ccredit/views/summaries/manual_readings.dart';
import 'package:ccredit/views/summaries/satelliite_readings.dart';
import 'package:ccredit/views/summaries/summaries_providers/summaries_providers.dart';
import 'package:ccredit/views/super%20models/location_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class LocationSummaryView extends ConsumerWidget {
  const LocationSummaryView({super.key, required this.location});
  final LocationModel location;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var isSmallScreen = MediaQuery.of(context).size.width <= 500;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(location.name),
        ),
        body: isSmallScreen
            ? _SmallScreenView(location: location)
            : const _BigScreenView());
  }
}

class _SmallScreenView extends ConsumerWidget {
  const _SmallScreenView({required this.location});
  final LocationModel location;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // image
          Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                    onTap: () async {
                      await showDialog(
                          context: context,
                          builder: (context) {
                            return SizedBox(
                              width: MediaQuery.of(context).size.width * .9,
                              height: MediaQuery.of(context).size.height * .6,
                              child: const Expanded(child: FlutterLogo()),
                            );
                          });
                    },
                    child: Image.asset('assets/images/owner.png',
                        frameBuilder: (context, widget, _, __) {
                      return ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: widget);
                    }, width: 100, height: 100, fit: BoxFit.contain)),
              )),
          // basic info
          LocationBasicInfoWidget(location: location),
// location graph histroy of CO2 around the region
          Card(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Row(
                  children: [
                    Expanded(child: Divider()),
                    Expanded(child: Text('CO2 extracted over time')),
                    Expanded(child: Divider()),
                  ],
                ),
                ref.watch(fetchLocationCo2DataProvider).when(
                    data: (dataSource) {
                      return SfCartesianChart(
                          tooltipBehavior: TooltipBehavior(enable: true),
                          primaryXAxis: DateTimeAxis(),
                          series: [
                            LineSeries(
                                dataLabelSettings:
                                    const DataLabelSettings(isVisible: true),
                                dataSource: dataSource,
                                xValueMapper: (data, _) => data.date,
                                yValueMapper: (data, _) => data.consumption)
                          ]);
                    },
                    error: (er, st) {
                      debugPrintStack(stackTrace: st);
                      return const Center(child: Text("Error failed to load"));
                    },
                    loading: () => const Center(
                        child: CircularProgressIndicator.adaptive()))
              ],
            ),
          )),

          // location current data readings
          Card(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Row(
                  children: [
                    Expanded(child: Divider()),
                    Expanded(child: Text('Live reading')),
                    Expanded(child: Divider()),
                  ],
                ),
                ref.watch(fetchAtmosphereDataProvider(location)).when(
                    data: (data) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      children: [
                        SfRadialGauge(
                          axes: [
                            RadialAxis(
                              minimum: 0,
                              maximum: 300,
                              annotations: <GaugeAnnotation>[
                                GaugeAnnotation(
                                    angle: 90,
                                    positionFactor: 0.5,
                                    widget: Text('${data.pm.toString()}\np.m',
                                        style: const TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold)))
                              ],
                              pointers: [
                                NeedlePointer(
                                  value: data.pm,
                                )
                              ],
                              ranges: [
                                GaugeRange(
                                    startValue: 0,
                                    endValue: 50,
                                    color: Colors.green),
                                GaugeRange(
                                    startValue: 50,
                                    endValue: 100,
                                    color: Colors.yellow),
                                GaugeRange(
                                    startValue: 100,
                                    endValue: 150,
                                    color: Colors.orange),
                                GaugeRange(
                                    startValue: 150,
                                    endValue: 200,
                                    color: Colors.red),
                                GaugeRange(
                                    startValue: 200,
                                    endValue: 250,
                                    color: Colors.purple),
                                GaugeRange(
                                    startValue: 250,
                                    endValue: 300,
                                    color: Colors.purple),
                              ],
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                              tileColor: Colors.black.withOpacity(.1),
                              leading: const Icon(Icons.info),
                              title: const Text("Temperature"),
                              subtitle: const Text("^C"),
                              trailing: Text(data.temp.toString())),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                              tileColor: Colors.black.withOpacity(.1),
                              leading: const Icon(Icons.info),
                              title: const Text("Atmospheric pressure"),
                              subtitle: const Text("Hg"),
                              trailing: Text(data.pressure.toString())),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                              tileColor: Colors.black.withOpacity(.1),
                              leading: const Icon(Icons.info),
                              title: const Text("particulate matter"),
                              subtitle: const Text("Pm2.5"),
                              trailing: Text(data.pm.toString())),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                              tileColor: Colors.black.withOpacity(.1),
                              leading: const Icon(Icons.info),
                              title: const Text("Ozone"),
                              subtitle: const Text("ppm"),
                              trailing: Text(data.ozone.toString())),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                              tileColor: Colors.black.withOpacity(.1),
                              leading: const Icon(Icons.info),
                              title: const Text("Humidity"),
                              subtitle: const Text("%"),
                              trailing: Text(data.humidity.toString())),
                        ),
                      ],
                    ),
                  );
                }, error: (error, stackTrace) {
                  debugPrintStack(stackTrace: stackTrace);
                  return const Center(child: Text("Error, failed to load"));
                }, loading: () {
                  return const Center(
                      child: CircularProgressIndicator.adaptive());
                }),
              ],
            ),
          )),

          // View manual data readings
          Card(
              child: Center(
                  child: ListTile(
                      onTap: () {
                        // move to manual page
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return ManualReadingsView(location: location);
                        }));
                      },
                      leading: const Icon(Icons.satellite),
                      title: const Text("View manually measured data")))),

          // view live satellite data readings
          Card(
              child: Center(
                  child: ListTile(
                      onTap: () {
                        // move to satellite page
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return SatelliteReadings(location: location);
                        }));
                      },
                      leading: const Icon(Icons.satellite),
                      title: const Text("View Satellite data")))),
        ],
      ),
    );
  }
}

class LocationBasicInfoWidget extends ConsumerWidget {
  const LocationBasicInfoWidget({
    super.key,
    required this.location,
  });

  final LocationModel location;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
        child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: const Icon(Icons.person),
                    title: const Text("Owner"),
                    subtitle: Text(location.ownerName),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: const Icon(Icons.person),
                    title: const Text("Name"),
                    subtitle: Text(location.name),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: const Icon(Icons.location_city),
                    title: const Text("Location:Latitude"),
                    subtitle: Text(location.location.latitude),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: const Icon(Icons.location_city),
                    title: const Text("Location:Longitude"),
                    subtitle: Text(location.location.longitude),
                  ),
                ),
              ],
            )));
  }
}

class _BigScreenView extends ConsumerWidget {
  const _BigScreenView();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Stack(
      children: [],
    );
  }
}
