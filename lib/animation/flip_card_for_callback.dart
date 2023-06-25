import 'dart:math';

import 'package:flutter/material.dart';

class FlipCardController {
  _FlipCardForCallbackState? _state;

  Future<void> flipCard() async => _state?.flipCard();
}

class FlipCardForCallback extends StatefulWidget {
  final FlipCardController controller;
  final Widget front;
  final Widget back;

  const FlipCardForCallback({
    super.key,
    required this.controller,
    required this.front,
    required this.back,
  });

  @override
  State<FlipCardForCallback> createState() => _FlipCardForCallbackState();
}

class _FlipCardForCallbackState extends State<FlipCardForCallback>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  bool isFront = true;

  Future<void> flipCard() async {
    isFront = !isFront;
    await controller.forward();
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    widget.controller._state = this;
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          final angle = controller.value * -pi;
          final transform = Matrix4.identity()
            ..setEntry(3, 2, 0.001)
            ..rotateY(angle);

          return Transform(
            transform: transform,
            alignment: Alignment.center,
            child: widget.front,
          );
        });
  }
}
