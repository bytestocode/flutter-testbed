import 'package:flutter/material.dart';

import 'uxui/nested_scroll_view_example.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Testbed',
      debugShowCheckedModeBanner: false,
      home: NestedScrollViewExample(),
    );
  }
}
