import 'dart:math';

import 'package:flutter/material.dart';

class CustomDragFlipCard extends StatefulWidget {
  final double width;
  final double height;
  final double borderRadius;
  final BoxShadow? boxShadow;
  final Widget front;
  final Widget back;

  const CustomDragFlipCard({
    super.key,
    required this.width,
    required this.height,
    required this.borderRadius,
    this.boxShadow,
    required this.front,
    required this.back,
  });

  @override
  State<CustomDragFlipCard> createState() => _CustomDragFlipCardState();
}

class _CustomDragFlipCardState extends State<CustomDragFlipCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  late Animation<double> animation;
  bool isFront = true;
  bool isFrontStart = true;
  double dragPosition = 0.0;

  void setImageSide() {
    if (dragPosition <= 90.0 || dragPosition >= 270.0) {
      isFront = true;
    } else {
      isFront = false;
    }
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    )..addListener(() {
        setState(() {
          dragPosition = animation.value;
          setImageSide();
        });
      });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double dragInclination = dragPosition / 180.0;
    final double remain = dragInclination - dragInclination.toInt();
    final Matrix4 transform = Matrix4.identity()
      ..setEntry(3, 2, 0.001)
      ..rotateY(dragInclination * pi)
      ..scale(
        remain <= 0.5 ? 1.0 + (remain * 0.4) : 1.4 - (remain * 0.4),
        remain <= 0.5 ? 1.0 + (remain * 0.4) : 1.4 - (remain * 0.4),
      )
      ..translate(
        0.0,
        remain <= 0.5 ? -(remain * 25) : (remain * 25) - 25,
      );

    return GestureDetector(
      onHorizontalDragStart: (details) {
        controller.stop();
        isFrontStart = isFront;
      },
      onHorizontalDragUpdate: (details) {
        setState(() {
          dragPosition -= details.delta.dx;
          dragPosition %= 360;
          setImageSide();
        });
        // TODO: 너무 천천히 돌리면 원위치 시키기
      },
      onHorizontalDragEnd: (details) async {
        final velocity = details.primaryVelocity!;
        // final velocity = details.velocity.pixelsPerSecond.dx.abs();
        if (velocity >= 80 || velocity <= -80) isFront = !isFrontStart;

        final end = isFront ? (dragPosition > 180.0 ? 360.0 : 0.0) : 180.0;
        // TODO: 터치해서 플릭하기 추가 - 터치한 경우에 애니메이션 만들어서 실행
        animation = Tween(begin: dragPosition, end: end).animate(
          // controller,
          CurvedAnimation(parent: controller, curve: Curves.easeInOut),
        );

        await controller.forward(from: 0);
      },
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.borderRadius),
        ),
        child: SizedBox(
          width: widget.width,
          height: widget.height,
          child: Transform(
            transform: transform,
            alignment: Alignment.center,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(widget.borderRadius),
                boxShadow: [widget.boxShadow ?? const BoxShadow()],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(widget.borderRadius),
                child: isFront
                    ? widget.front
                    : Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.rotationY(pi),
                        child: widget.back,
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
