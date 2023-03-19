import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_testbed/animation/flip_card_for_callback.dart';

import 'animation/custom_drag_flip_card.dart';
import 'animation/custom_touch_flip_card.dart';

void main() => runApp(
      ProviderScope(
        child: MyApp(),
      ),
    );

class MyApp extends ConsumerWidget {
  MyApp({super.key});

  final controller = FlipCardController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final testWidget = Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomDragFlipCard(
            width: 240,
            height: 300,
            borderRadius: 10,
            boxShadow: BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 4,
              offset: const Offset(0, 4),
            ),
            front: Image.asset(
              'assets/front.jpeg',
              fit: BoxFit.cover,
            ),
            back: Image.asset(
              'assets/back.jpeg',
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 100.0),
          // TextButton(
          //   onPressed: () {
          //     controller.flipCard();
          //   },
          //   child: Text('돌리기'),
          // ),
          // const SizedBox(height: 100.0),
          CustomTouchFlipCard(
            width: 240,
            height: 300,
            borderRadius: 10,
            boxShadow: BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 4,
              offset: const Offset(0, 4),
            ),
            front: Image.asset(
              'assets/front.jpeg',
              fit: BoxFit.cover,
            ),
            back: Image.asset(
              'assets/back.jpeg',
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );

    const wrapWithSafeArea = false;

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
      home: Scaffold(
        body: testWidget,
      ),
    );
  }
}
