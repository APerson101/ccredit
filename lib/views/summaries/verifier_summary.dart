import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../super models/verifier_model.dart';

class VerifierSummaryView extends ConsumerWidget {
  const VerifierSummaryView({super.key, required this.verifier});
  final VerifierModel verifier;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(centerTitle: true, title: Text(verifier.name)),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Card(
                child: SizedBox(
                  height: 250,
                  width: MediaQuery.of(context).size.width <= 500
                      ? MediaQuery.of(context).size.width * .97
                      : 500,
                  child: Row(children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 150,
                            child: Image.asset('assets/images/pic1.png'),
                          ),
                          Text(verifier.name),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: VerticalDivider(),
                    ),
                    Expanded(
                      flex: 2,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ListTile(
                              leading: const Icon(Icons.email),
                              title: Text(verifier.email),
                            ),
                            ListTile(
                              leading: const Icon(Icons.phone),
                              title: Text(verifier.number),
                            ),
                            ListTile(
                              leading: const Icon(Icons.location_city),
                              title: Text(verifier.location),
                            ),
                          ]),
                    ),
                  ]),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Column(children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Sustainability Summary"),
                      Icon(Icons.menu),
                    ],
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: const Icon(Icons.numbers),
                    subtitle: Text(verifier.numberOfVerifications.toString()),
                    title: const Text("Number of verifications"),
                  ),
                ),
              ])
            ]),
          ),
        ));
  }
}
