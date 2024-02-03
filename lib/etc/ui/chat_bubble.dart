import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ChatBubble extends StatefulWidget {
  const ChatBubble({
    super.key,
    required this.heading,
    required this.body,
  });

  final String heading;
  final String body;

  @override
  State<ChatBubble> createState() => _ChatBubbleState();
}

class _ChatBubbleState extends State<ChatBubble>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 300),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFF1F1F1),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              children: [
                Text(
                  widget.heading,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  widget.body,
                  style: const TextStyle(
                    color: Color(0xFF444444),
                    fontSize: 15,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                    height: 1.53,
                  ),
                ),
              ],
            ),
          )
              .animate(
                controller: _controller,
                autoPlay: false,
              )
              .moveY(
                begin: 0,
                end: -100,
                duration: 300.ms,
                curve: Curves.elasticIn,
              ),
          // .moveY(begin: 0, end: 10, duration: 100.ms)
          // .then()
          // .moveY(begin: 10, end: -100, duration: 200.ms),
          const SizedBox(
            height: 100,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            height: 100,
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.grey,
                minimumSize: const Size(0, 0),
                // padding: const EdgeInsets.all(10),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              onPressed: () async {
                _controller.forward();
              },
              child: Container(
                height: 100,
                width: 300,
                child: const Text('앞'),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            height: 100,
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.grey,
                minimumSize: const Size(0, 0),
                // padding: const EdgeInsets.all(10),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              onPressed: () async {
                _controller.reverse();
              },
              child: Container(
                height: 100,
                width: 300,
                child: const Text('뒤'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
