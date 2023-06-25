import 'dart:ui';

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: TestScreen(),
    );
  }
}

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 400,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://picsum.photos/200'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Center(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 40,
                    crossAxisSpacing: 2.5,
                  ),
                  scrollDirection: Axis.vertical,
                  itemCount: 19,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return const Text(
                      '_',
                    );
                  },
                ),
              ),
              loginContainer(),
            ],
          ),
        ),
      ),
    );
  }
}

Widget loginContainer() {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white70,
      borderRadius: BorderRadius.circular(10),
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 5.0,
          sigmaY: 5.0,
        ),
        child: getLoginContainer(),
      ),
    ),
  );
}

Widget getLoginContainer() {
  return Column(
    children: [
      Text('df'),
      const SizedBox(
        height: 10.0,
      ),
      Text('df'),
      const SizedBox(
        height: 10.0,
      ),
    ],
  );
}
