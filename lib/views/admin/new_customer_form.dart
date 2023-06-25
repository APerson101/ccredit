import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddNewBusinessForm extends ConsumerWidget {
  const AddNewBusinessForm({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            ..._BusinessFormFields.values.map((e) => TextFormField(
                  obscureText: e == _BusinessFormFields.password ? true : false,
                  decoration: InputDecoration(
                      hintText: e.label,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                )),
            ListTile(
                leading: const Icon(Icons.confirmation_num),
                onTap: () {},
                title: const Text("Confirm business creation"))
          ]),
        ));
  }
}

enum _BusinessFormFields {
  email(label: 'email'),
  password(label: "Password"),
  name(label: "fulll name"),
  number(label: "Phone number"),
  location(label: "Location");

  final String label;
  const _BusinessFormFields({required this.label});
}
