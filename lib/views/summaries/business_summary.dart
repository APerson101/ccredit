import 'package:ccredit/views/super%20models/business_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BusinessSummaryView extends ConsumerWidget {
  const BusinessSummaryView({super.key, required this.business});
  final BusinessModel business;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(centerTitle: true, title: Text(business.name)),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
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
                        children: [
                          SizedBox(
                              width: 150,
                              child: Padding(
                                  padding: const EdgeInsets.only(left: 8),
                                  child: Image.asset(
                                      'assets/images/business.png'))),
                          Text(business.name),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Expanded(
                        child: VerticalDivider(),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          ListTile(
                              leading: const Icon(Icons.location_history),
                              title: Text(business.location)),
                          ListTile(
                              title: Text(business.number),
                              leading: const Icon(Icons.phone)),
                          ListTile(
                              title: Text(business.email),
                              leading: const Icon(Icons.email)),
                          ListTile(
                              leading: const Icon(Icons.calendar_month),
                              title: Text(business.dateCreated.toString())),
                        ],
                      ),
                    )
                  ]),
                ),
              ),
              const SizedBox(height: 20),
              const Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Sustainability summary"),
                        Icon(Icons.menu)
                      ],
                    ),
                  ),
                  Card(
                      child: ListTile(
                    title: Text("CO2 purchased: 34Kg/N2"),
                    leading: Icon(Icons.co2),
                  )),
                  Card(
                      child: ListTile(
                          leading: Icon(Icons.location_city),
                          title: Text("Most frequent location: Maitama"))),
                ],
              )
            ],
          )),
        ));
  }
}
