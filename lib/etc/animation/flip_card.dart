import 'dart:math';

import 'package:flutter/material.dart';

class FlipCard extends StatefulWidget {
  const FlipCard({super.key});

  @override
  State<FlipCard> createState() => _FlipCardState();
}

class _FlipCardState extends State<FlipCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;
  AnimationStatus _status = AnimationStatus.dismissed;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        _status = status;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flip Card'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 100),
            Transform(
                alignment: Alignment.center,
                // alignment: FractionalOffset.center,
                transform: Matrix4.identity()
                  // ..setEntry(2, 1, 0.0015)
                  ..setEntry(3, 2, 0.001)
                  ..rotateY(_animation.value * pi),
                child: Card(
                  child: _animation.value <= 0.5
                      ? Container(
                          width: 240,
                          height: 300,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Center(
                            child: Text('Front'),
                          ),
                        )
                      : Container(
                          transformAlignment: Alignment.center,
                          transform: Matrix4.rotationY(pi),
                          width: 240,
                          height: 300,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Center(
                            child: Text('Back'),
                          ),
                        ),
                )),
            const SizedBox(height: 100),
            ElevatedButton(
              onPressed: () {
                if (_status == AnimationStatus.dismissed) {
                  _controller.forward();
                } else if (_status == AnimationStatus.completed) {
                  _controller.reverse();
                }
              },
              child: const Text('Flip'),
            ),
          ],
        ),
      ),
    );
  }
}
