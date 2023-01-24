import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_testbed/stackoverflow/background_color.dart';

void main() => runApp(
      const ProviderScope(
        child: MyApp(),
      ),
    );

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      home: myApp(),
    );
  }

  Widget myApp() {
    return SafeArea(
      child: Scaffold(
        body: BackgroundColorWidget(),
      ),
    );
  }
}
