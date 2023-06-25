import 'dart:math';

import 'package:flutter/material.dart';

class TestCustomTouchDragFlipCardWidget extends StatefulWidget {
  final double width;
  final double height;
  final double borderRadius;
  final BoxShadow? boxShadow;
  final Widget front;
  final Widget back;

  const TestCustomTouchDragFlipCardWidget({
    super.key,
    required this.width,
    required this.height,
    required this.borderRadius,
    this.boxShadow,
    required this.front,
    required this.back,
  });

  @override
  State<TestCustomTouchDragFlipCardWidget> createState() =>
      _TestCustomTouchDragFlipCardWidgetState();
}

class _TestCustomTouchDragFlipCardWidgetState
    extends State<TestCustomTouchDragFlipCardWidget>
    with TickerProviderStateMixin {
  /// 터치 관련
  late final AnimationController _touchController;
  late Animation _touchAnimation;
  AnimationStatus _touchStatus = AnimationStatus.dismissed;
  int _reverseValue = 1;

  Future<void> flipCard({required bool isLeft}) async {
    _isDragStart = false;

    // TODO: 터치하다가 드래그한 경우에 제대로 동작하려면?
    /// 뒷면으로 바꾸는 경우
    if (_touchStatus == AnimationStatus.dismissed) {
      _reverseValue = isLeft ? 1 : -1;
      await _touchController.forward();

      /// 드래그 하는데 필요한 값도 수정해 줘야함
      isFront = false;
      isFrontStart = false;
      dragPosition = 180;
      print('애니메이션 디스미스드 isFront: $isFront');

      _reverseValue *= -1;

      /// 앞면으로 바꾸는 경우
    } else if (_touchStatus == AnimationStatus.completed) {
      _reverseValue = isLeft ? -1 : 1;
      await _touchController.reverse();

      /// 드래그 하는데 필요한 값도 수정해 줘야함
      isFront = true;
      isFrontStart = true;
      dragPosition = 0;
      print('애니메이션 컴플리티드 isFront: $isFront');

      _reverseValue *= -1;
    }
  }

  /// 드래그 관련
  bool _isDragStart = false;
  late final AnimationController dragController;
  late Animation dragAnimation;
  late Animation<double> resetDragAnimation;
  bool isFront = true;
  bool isFrontStart = true;
  double dragPosition = 0;

  void setImageSide() {
    if (dragPosition <= 90 || dragPosition >= 270) {
      /// 앞면으로 바꾸는 경우
      isFront = true;
      _touchController.reverse();
    } else {
      /// 뒷면으로 바꾸는 경우
      isFront = false;
      _touchController.forward();
    }
  }

  @override
  void initState() {
    super.initState();
    _touchController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _touchAnimation = Tween(begin: 0.0, end: 1.0).animate(
      // _controller,
      CurvedAnimation(
        parent: _touchController,
        curve: Curves.easeInOut,
      ),
    )
      ..addListener(() => setState(() {}))
      ..addStatusListener((status) => _touchStatus = status);

    dragController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    dragController.addListener(() {
      setState(() {
        dragPosition = resetDragAnimation.value;
        setImageSide();
      });
    });
    dragAnimation = Tween(begin: 0.0, end: 360.0).animate(
      dragController,
    )..addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _touchController.dispose();
    dragController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final angle = dragPosition / 180 * pi;

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
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..rotateY(_isDragStart
                    ? angle
                    : _touchAnimation.value * pi * _reverseValue)
                ..scale(
                  _touchAnimation.value <= 0.5
                      ? 1.0 + (_touchAnimation.value * 0.4)
                      : 1.4 - (_touchAnimation.value * 0.4),
                )
                ..translate(
                  0.0,
                  _touchAnimation.value <= 0.5
                      ? -(_touchAnimation.value * 50)
                      : (_touchAnimation.value * 50) - 50,
                ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(widget.borderRadius),
                  boxShadow: [widget.boxShadow ?? const BoxShadow()],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(widget.borderRadius),
                  child: (_isDragStart && isFront) ||
                          (!_isDragStart && _touchAnimation.value <= 0.5)
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
          GestureDetector(
            onHorizontalDragStart: (details) {
              _isDragStart = true;
              dragController.stop();
              isFrontStart = isFront;
              print('_isDragStart: $_isDragStart');
            },
            onHorizontalDragUpdate: (details) {
              setState(() {
                dragPosition -= details.delta.dx;
                dragPosition %= 360;
                setImageSide();
              });
            },
            onHorizontalDragEnd: (details) {
              print('dragPosition: $dragPosition');

              final velocity = details.primaryVelocity!;
              if (velocity >= 80) isFront = !isFrontStart;

              final end =
                  isFront ? (dragPosition > 180.0 ? 360.0 : 0.0) : 180.0;
              resetDragAnimation = Tween(begin: dragPosition, end: end).animate(
                dragController,
              );

              dragController.forward(from: 0);
              // _isDragStart = false;
              print('_isDragStart: $_isDragStart');
            },
          ),
        ],
      ),
    );
  }
}
