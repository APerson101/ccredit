import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'authentication_provider.g.dart';

@riverpod
Future<LottieComposition> loadAnimation(LoadAnimationRef ref) async {
  return await AssetLottie('assets/animations/loading.json').load();
}

@riverpod
Future<String> getAccountType(
    GetAccountTypeRef ref, String email, String password) async {
  if (email.contains('@admin.com')) {
    return 'admin';
  }
  if (email.contains('@business.com')) {
    return 'customer';
  }
  if (email.contains('@verifier.com')) {
    return 'verifier';
  }
  if (email.contains('@owner.com')) {
    return 'owner';
  }
  return 'null';
}

@riverpod
class AuthenticationHelper extends _$AuthenticationHelper {
  @override
  FutureOr<AuthenticationStates> build() async {
    return AuthenticationStates.logout;
  }

  signIn(String email, String password) async {
    ref.watch(showAnimationState.notifier).state = true;
    await Future.delayed(const Duration(seconds: 3), () {
      state = const AsyncData(AuthenticationStates.login);
      ref.watch(showAnimationState.notifier).state = false;
      return;
    });
  }

  signOut() async {
    await Future.delayed(const Duration(seconds: 0), () {
      state = const AsyncData(AuthenticationStates.logout);
    });
  }
}

enum AuthenticationStates { idle, loading, owner, logout, login }

final showAnimationState = StateProvider((ref) => false);
