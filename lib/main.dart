import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'image/photo_manage_test.dart';

void main() => runApp(
      const ProviderScope(
        child: MyApp(),
      ),
    );

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final testWidget = TodayPhotosPage();
    const wrapWithSafeArea = true;

    if (wrapWithSafeArea) {
      return MaterialApp(
        home: SafeArea(
          child: Scaffold(
            body: testWidget,
          ),
        ),
      );
    }

    return MaterialApp(
      home: testWidget,
    );
  }
}
