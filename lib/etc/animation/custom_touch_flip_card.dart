import 'dart:math';

import 'package:flutter/material.dart';

class CustomTouchFlipCard extends StatefulWidget {
  final double width;
  final double height;
  final double borderRadius;
  final BoxShadow? boxShadow;
  final Widget frontWidget;
  final Widget backWidget;

  const CustomTouchFlipCard({
    super.key,
    required this.width,
    required this.height,
    required this.borderRadius,
    this.boxShadow,
    required this.frontWidget,
    required this.backWidget,
  });

  @override
  State<CustomTouchFlipCard> createState() => _CustomTouchFlipCardState();
}

class _CustomTouchFlipCardState extends State<CustomTouchFlipCard>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;
  AnimationStatus animationStatus = AnimationStatus.dismissed;

  /// 오른쪽 영역, 왼쪽 영역 터치 여부 구분하기 위한 변수
  int reverseValue = 1;

  Future<void> flipCard({required bool isLeft}) async {
    if (animationStatus == AnimationStatus.dismissed) {
      reverseValue = isLeft ? 1 : -1;
      await controller.forward();
      reverseValue *= -1;
    } else if (animationStatus == AnimationStatus.completed) {
      reverseValue = isLeft ? -1 : 1;
      await controller.reverse();
      reverseValue *= -1;
    }
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    animation = Tween(begin: 0.0, end: 1.0).animate(
      // _controller,
      CurvedAnimation(parent: controller, curve: Curves.easeInOut),
    )
      ..addListener(() => setState(() {}))
      ..addStatusListener((status) => animationStatus = status);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widget.borderRadius),
      ),
      child: Stack(
        children: [
          /// 앞뒤로 뒤짚힐 카드
          SizedBox(
            width: widget.width,
            height: widget.height,
            child: Transform(
              // alignment: FractionalOffset.center,
              alignment: Alignment.center,
              transform: Matrix4.identity()
                // ..setEntry(2, 1, 0.0015)
                ..setEntry(3, 2, 0.001)
                ..rotateY(animation.value * pi * reverseValue)
                ..scale(
                  animation.value <= 0.5
                      ? 1.0 + (animation.value * 0.4)
                      : 1.4 - (animation.value * 0.4),
                  animation.value <= 0.5
                      ? 1.0 + (animation.value * 0.4)
                      : 1.4 - (animation.value * 0.4),
                )
                ..translate(
                  0.0,
                  animation.value <= 0.5
                      ? -(animation.value * 50)
                      : (animation.value * 50) - 50,
                ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(widget.borderRadius),
                  boxShadow: [widget.boxShadow ?? const BoxShadow()],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(widget.borderRadius),
                  child: animation.value <= 0.5
                      ? widget.frontWidget
                      : Transform(
                          alignment: Alignment.center,
                          transform: Matrix4.rotationY(pi),
                          child: widget.backWidget,
                        ),
                ),
              ),
            ),
          ),

          /// 카드 왼쪽, 오른쪽 터치 영역
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () async => await flipCard(isLeft: true),
                ),
              ),
              const Spacer(),
              Expanded(
                child: GestureDetector(
                  onTap: () async => await flipCard(isLeft: false),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
