import 'package:ccredit/views/admin/new_customer_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'new_farmer_form.dart';

class AdminMainView extends ConsumerWidget {
  const AdminMainView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text("Admin page")),
      persistentFooterButtons: [
        ListTile(
          onTap: () {},
          title: const Text("LogOut"),
        )
      ],
      body: Column(children: [
        ListTile(
            leading: const Icon(Icons.person),
            title: const Text("Add new Farm owner"),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return const NewFarmOwnerForm();
              }));
            }),
        ListTile(
            leading: const Icon(Icons.person),
            title: const Text("Add new business"),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return const AddNewBusinessForm();
              }));
            }),
        ListTile(
            leading: const Icon(Icons.person),
            title: const Text("Add new Verifier"),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return const NewFarmOwnerForm();
              }));
            }),
      ]),
    );
  }
}
