import 'package:ccredit/authentication/authentication_provider/authentication_provider.dart';
import 'package:ccredit/views/admin/admin_main.dart';
import 'package:ccredit/views/customer/customer_main.dart';
import 'package:ccredit/views/verifier/verifier_main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'authentication/authentication_view.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(authenticationHelperProvider).when(
        data: (state) {
          return MaterialApp(
              theme: ThemeData.dark(),
              home: Scaffold(
                  resizeToAvoidBottomInset: false,
                  body: state == AuthenticationStates.logout
                      ? AuthenticationView()
                      : const MainView()));
        },
        error: (er, st) {
          return const Material(
            child: Center(child: Text("Error")),
          );
        },
        loading: () => const Material(
            child: Center(child: CircularProgressIndicator.adaptive())));
  }
}

class MainView extends ConsumerWidget {
  const MainView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Widget view = ref
        .watch(getAccountTypeProvider(ref.watch(loginEmailProvider), ''))
        .when(
            data: (state) {
              if (state == 'admin') {
                return const AdminMainView();
              }
              if (state == 'customer') {
                return const CustomerMainView();
              }

              if (state == 'onwer') {
                return Container();
              }

              if (state == 'verifier') {
                return const VerifierMainView();
              }
              return Container();
            },
            error: (er, st) {
              debugPrintStack(stackTrace: st);
              return const Text("ErROR");
            },
            loading: () =>
                const Center(child: CircularProgressIndicator.adaptive()));
    return view;
  }
}
