import 'package:ccredit/views/customer/history/customer_history.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VerifierHistoryView extends ConsumerWidget {
  const VerifierHistoryView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomerHistoryView();
  }
}
