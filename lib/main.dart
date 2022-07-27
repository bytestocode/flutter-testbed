import 'package:flutter/material.dart';
import 'package:flutter_testbed/factory_container.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Testbed',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TestBed(),
    );
  }
}

class TestBed extends StatelessWidget {
  const TestBed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
  
          children: [
            FactoryContainer.onlyText('yahoo'),
            FactoryContainer.onlyText('yahoo'),
            FactoryContainer.onlyText('yahoo'),
            FactoryContainer.withColor('yahoo', color: Colors.blue),
            FactoryContainer.withColor('yahoo', color: Colors.yellow),
            FactoryContainer.withColor('yahoo', color: Colors.green),
          ],
        ),
      ),
    );
  }
}
