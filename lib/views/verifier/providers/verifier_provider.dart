import 'package:flutter/services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'verifier_provider.g.dart';

@riverpod
Future<ByteData> fetchAsset(FetchAssetRef ref) async {
  return await rootBundle.load('assets/images/back.png');
}
