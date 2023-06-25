import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CustomerHistroyDetails extends ConsumerWidget {
  CustomerHistroyDetails({super.key, required this.item});
  final String item;
  final WebViewController controller = WebViewController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    controller.loadRequest(
        Uri.parse('https://testnet.dragonglass.me/transactions/$item'));
    return Scaffold(
        appBar: AppBar(), body: WebViewWidget(controller: controller));
  }
}
