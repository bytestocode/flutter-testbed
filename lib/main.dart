import 'dart:developer';

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

class TestBed extends StatefulWidget {
  const TestBed({super.key});

  @override
  State<TestBed> createState() => _TestBedState();
}

class _TestBedState extends State<TestBed> {
  void _asyncFunction() async {
    log('await 전'); // (1) 번째
    await Future.delayed(const Duration(milliseconds: 300));
    log('await 후'); // (3) 번째
  }

  @override
  void initState() {
    super.initState();
    _asyncFunction();
    log('비동기 함수보다 먼저 실행될까?'); // (2) 번째
  }

  @override
  Widget build(BuildContext context) {
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
