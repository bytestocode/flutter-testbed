import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_testbed/ui/expanded_test.dart';

import 'stackoverflow/scrollview_up.dart';

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
      home: MyScrollView(),
    );
  }

  Widget myApp() {
    return SafeArea(
      child: Scaffold(
        body: ExpandedTestWidget(),
      ),
    );
  }
}
