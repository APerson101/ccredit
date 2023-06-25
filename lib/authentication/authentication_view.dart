import 'package:ccredit/authentication/authentication_provider/authentication_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';

class AuthenticationView extends ConsumerWidget {
  AuthenticationView({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final viewPasswordProvider = StateProvider((ref) => false);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: AbsorbPointer(
          absorbing: ref.watch(showAnimationState),
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ref.watch(loadAnimationProvider).when(data: (composition) {
                  return Lottie(
                      height: 200,
                      composition: composition,
                      animate: ref.watch(showAnimationState));
                }, error: (error, stackTrace) {
                  debugPrintStack(stackTrace: stackTrace);
                  return const Center(child: Text("Failed to load asset"));
                }, loading: () {
                  return const SizedBox(
                    height: 30,
                  );
                }),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                          labelText: 'Email',
                          suffixIcon: const Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Icon(Icons.email),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25))),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: TextFormField(
                      obscureText: !ref.watch(viewPasswordProvider),
                      controller: passwordController,
                      decoration: InputDecoration(
                          labelText: 'Password',
                          suffixIcon: GestureDetector(
                            onTap: () {
                              ref.watch(viewPasswordProvider.notifier).state =
                                  !ref.watch(viewPasswordProvider);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: ref.watch(viewPasswordProvider)
                                  ? const Icon(Icons.lock)
                                  : const Icon(Icons.lock),
                            ),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25))),
                    ),
                  ),
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple,
                        minimumSize:
                            Size(MediaQuery.of(context).size.width * .9, 60)),
                    onPressed: () {
                      ref.watch(loginEmailProvider.notifier).state =
                          emailController.text;
                      ref.watch(authenticationHelperProvider.notifier).signIn(
                          emailController.text, passwordController.text);
                    },
                    child: const Text("Login"))
              ],
            ),
          ),
        ),
      ),
    ));
  }
}

final loginEmailProvider = StateProvider((ref) => '');
