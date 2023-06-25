import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../customer/customer_profile.dart';

class VerifierProfileView extends ConsumerWidget {
  const VerifierProfileView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const CustomerProfileView();
  }
}
