import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../search/search_view.dart';
import 'verifier.dart';

class VerifierMainView extends ConsumerWidget {
  const VerifierMainView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isSmallScreen = MediaQuery.of(context).size.width <= 500;
    bool isFullSize = MediaQuery.of(context).size.width >= 900;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              !isSmallScreen
                  ? Positioned(
                      left: 0,
                      top: 0,
                      bottom: 0,
                      child: NavigationRail(
                          onDestinationSelected: (selectedIndex) => ref
                              .watch(_currenIndexProvider.notifier)
                              .state = _NavigationBar.values[selectedIndex],
                          extended: isFullSize,
                          destinations: _NavigationBar.values
                              .map((e) => NavigationRailDestination(
                                  icon: e.icon, label: Text(e.label)))
                              .toList(),
                          selectedIndex: _NavigationBar.values
                              .indexOf(ref.watch(_currenIndexProvider))))
                  : Container(),
              Positioned(
                  left: isSmallScreen
                      ? 0
                      : isFullSize
                          ? 260
                          : 100,
                  right: 0,
                  top: 0,
                  bottom: 0,
                  child: const _VerifierMainView())
            ],
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: isSmallScreen ? const _BottomNavigationBar() : null,
    );
  }
}

class _BottomNavigationBar extends ConsumerWidget {
  const _BottomNavigationBar();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BottomNavigationBar(
        currentIndex:
            _NavigationBar.values.indexOf(ref.watch(_currenIndexProvider)),
        onTap: (newIndex) => ref.watch(_currenIndexProvider.notifier).state =
            _NavigationBar.values[newIndex],
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.white,
        items: _NavigationBar.values.map((item) {
          return BottomNavigationBarItem(icon: item.icon, label: item.label);
        }).toList());
  }
}

enum _NavigationBar {
  dashboard(value: 0, label: "Dashboard", icon: Icon(Icons.dashboard)),
  history(value: 1, label: "History", icon: Icon(Icons.history)),
  search(value: 2, label: "Search", icon: Icon(Icons.search)),
  profile(value: 4, label: "Profile", icon: Icon(Icons.person));

  const _NavigationBar(
      {required this.value, required this.label, required this.icon});
  final int value;
  final String label;
  final Widget icon;
}

final _currenIndexProvider =
    StateProvider.autoDispose((ref) => _NavigationBar.dashboard);

class _VerifierMainView extends ConsumerWidget {
  const _VerifierMainView();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    switch (ref.watch(_currenIndexProvider)) {
      case _NavigationBar.dashboard:
        return const VerifierDashboardView();
      case _NavigationBar.history:
        return const VerifierHistoryView();
      case _NavigationBar.profile:
        return const VerifierProfileView();
      case _NavigationBar.search:
        return const SearchView();
      default:
        return Container();
    }
  }
}
