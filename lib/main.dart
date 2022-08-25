import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Testbed',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: const TestBed(),
    );
  }
}

class TestBed extends StatelessWidget {
  const TestBed({super.key});

  @override
  Widget build(BuildContext context) {
    /// margin, padding 차이점 탐구
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 300,
                width: 300,
                decoration: const BoxDecoration(
                  color: Colors.red,
                ),
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.all(50.0),
                    color: Colors.green,
                    height: 200,
                    width: 200,
                    child: Container(
                      color: Colors.amber,
                      height: 10,
                      width: 10,
                      child: const Text('1번'),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              Container(
                height: 300,
                width: 300,
                decoration: const BoxDecoration(
                  color: Colors.blue,
                ),
                child: Container(
                  margin: const EdgeInsets.all(50.0),
                  color: Colors.pink,
                  height: 200,
                  width: 200,
                  child: Container(
                    color: Colors.amber,
                    height: 10,
                    width: 10,
                    child: const Text('2번'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
