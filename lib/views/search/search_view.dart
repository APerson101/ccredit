import 'package:ccredit/views/search/search_provider.dart';
import 'package:ccredit/views/search/search_widgets.dart';
import 'package:ccredit/views/summaries/business_summary.dart';
import 'package:ccredit/views/summaries/location_summary.dart';
import 'package:ccredit/views/summaries/verifier_summary.dart';
import 'package:ccredit/views/super%20models/business_model.dart';
import 'package:ccredit/views/super%20models/location_model.dart';
import 'package:ccredit/views/super%20models/verifier_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchView extends ConsumerWidget {
  const SearchView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(searchWidgetProvider).when(data: (data) {
      return Scaffold(
          resizeToAvoidBottomInset: false,
          body: Center(
              child: Column(
            children: [
              // auto complete search things
              AllSearchBarWidget(
                suggestions: data,
              ),

              SizedBox(
                  height: MediaQuery.of(context).size.height * .75,
                  child: const _AllSearchResults())
            ],
          )));
    }, error: (er, st) {
      debugPrintStack(stackTrace: st);
      return const Center(child: Text("Failed to laod"));
    }, loading: () {
      return const Center(
        child: CircularProgressIndicator.adaptive(),
      );
    });
  }
}

class _AllSearchResults extends ConsumerWidget {
  const _AllSearchResults();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(allSearchProvider).when(data: (result) {
      return DefaultTabController(
        length: 3,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: const Text("Results"),
            bottom: const TabBar(
              tabs: [
                Tab(
                  text: "locations",
                ),
                Tab(
                  text: "Verifiers",
                ),
                Tab(
                  text: "businesses",
                ),
              ],
            ),
          ),
          body: Center(
            child: TabBarView(children: [
              _LocationSearchResult(locations: result.locations),
              _VerifiersSearchResult(verifiers: result.verifiers),
              _BusinessesSearchResult(businesses: result.businesses)
            ]),
          ),
        ),
      );
    }, error: (er, st) {
      debugPrintStack(stackTrace: st);
      return const Center(child: Text("Error "));
    }, loading: () {
      return const CircularProgressIndicator.adaptive();
    });
  }
}

class _LocationSearchResult extends ConsumerWidget {
  const _LocationSearchResult({required this.locations});
  final List<LocationModel> locations;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (locations.isNotEmpty) {
      return SingleChildScrollView(
        child: Column(
          children: locations
              .map((e) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      onTap: () {
                        //show details
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return LocationSummaryView(location: e);
                        }));
                      },
                      leading: const FlutterLogo(),
                      title: Text(e.name),
                      subtitle: Text(e.location.latitude),
                    ),
                  ))
              .toList(),
        ),
      );
    }

    return const Center(child: Text("No location with such name"));
  }
}

class _VerifiersSearchResult extends ConsumerWidget {
  const _VerifiersSearchResult({required this.verifiers});
  final List<VerifierModel> verifiers;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return verifiers.isNotEmpty
        ? SingleChildScrollView(
            child: Column(
              children: verifiers
                  .map((e) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          onTap: () {
                            //show details
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return VerifierSummaryView(verifier: e);
                            }));
                          },
                          leading: const FlutterLogo(),
                          title: Text(e.name),
                          subtitle: Text(e.location),
                          trailing:
                              Text("verifications:${e.numberOfVerifications}"),
                        ),
                      ))
                  .toList(),
            ),
          )
        : const Center(
            child: Text("No verifiers with such name"),
          );
  }
}

class _BusinessesSearchResult extends ConsumerWidget {
  const _BusinessesSearchResult({required this.businesses});
  final List<BusinessModel> businesses;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return businesses.isNotEmpty
        ? SingleChildScrollView(
            child: Column(
              children: businesses
                  .map((e) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          onTap: () {
                            //show details
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return BusinessSummaryView(
                                business: e,
                              );
                            }));
                          },
                          leading: const FlutterLogo(),
                          title: Text(e.name),
                          subtitle: Text(e.location),
                        ),
                      ))
                  .toList(),
            ),
          )
        : const Center(child: Text("No businesses with such name"));
  }
}
