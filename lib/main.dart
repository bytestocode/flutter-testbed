import 'package:flutter/material.dart';

import 'uxui/improved_asset_image.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Testbed',
      debugShowCheckedModeBanner: false,
      home: ImprovedAssetImage(),
    );
  }
}
