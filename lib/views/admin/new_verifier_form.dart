import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddNewVerifierForm extends ConsumerWidget {
  const AddNewVerifierForm({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            child: Column(children: [
              ..._FormFields.values
                  .map((e) => TextFormField(
                        obscureText: e.obscureText,
                        decoration: InputDecoration(
                            labelText: e.label,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                      ))
                  .toList(),
              ListTile(
                  leading: const Icon(Icons.person),
                  onTap: () {},
                  title: const Text("confirm Verifier creation"))
            ]),
          ),
        ),
      ),
    );
  }
}

enum _FormFields {
  email(
    label: "Email",
    obscureText: false,
  ),
  password(label: "password", obscureText: true),
  location(label: "Location", obscureText: false),
  number(label: "Number", obscureText: false);

  const _FormFields({required this.label, required this.obscureText});
  final String label;
  final bool obscureText;
}
