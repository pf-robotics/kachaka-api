import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kachaka_api_flutter_sample/app.dart';

void main() {
  runApp(
    const ProviderScope(
      child: KachakaApiSampleApp(),
    ),
  );
}
