import 'package:flutter/material.dart';

import 'test/date_time_test_widget.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Code Sample',
      home: Scaffold(
        body: DateTimeTestWidget(),
      ),
    );
  }
}
