import 'package:ccredit/authentication/authentication_provider/authentication_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomerProfileView extends ConsumerWidget {
  const CustomerProfileView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        body: Column(children: [
      // card info of basic stuff
      Card(
        child: SizedBox(
          height: 300,
          child: Row(children: [
            Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ListTile(
                        tileColor: Colors.black.withOpacity(.1),
                        leading: const Icon(Icons.email),
                        title: const Text('test@gmail.com'),
                      ),
                      ListTile(
                        tileColor: Colors.black.withOpacity(.1),
                        leading: const Icon(Icons.phone),
                        title: const Text('4753458347858'),
                      ),
                      ListTile(
                        tileColor: Colors.black.withOpacity(.1),
                        leading: const Icon(Icons.location_city),
                        title: const Text('Jikwe rental Farms'),
                      ),
                    ],
                  ),
                ))
          ]),
        ),
      ),
      // generate report
      Card(
          child: ListTile(
        onTap: () {},
        leading: const Icon(Icons.book),
        title: const Text("Generate report"),
      )),
// Hedera Account Stuff
      Card(
          child: ListTile(
        leading: const Icon(Icons.circle_outlined),
        title: const Text("Hedera account Id"),
        subtitle: const Text("0.0.123455"),
        trailing: TextButton(
            onPressed: () async {
              //
              await Clipboard.setData(const ClipboardData(
                  text: '34562834752457234523875hdjsgfuy3425437'));
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Successfully copied private key")));
              }
            },
            child: const Text("copy Private Key")),
      )),

      // Logout
      Card(
          child: ListTile(
        onTap: () {
          ref.watch(authenticationHelperProvider.notifier).signOut();
        },
        leading: const Icon(Icons.logout),
        title: const Text("Logout"),
      )),
    ]));
  }
}
