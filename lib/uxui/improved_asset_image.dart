import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';

class ImprovedAssetImage extends StatelessWidget {
  const ImprovedAssetImage({super.key});

  static const imageRatio = 9 / 16;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Asset Image Placeholder'),
      ),
      body: Column(
        children: [
          Image.asset(
            'assets/images/sea_of_stars.png',
            fit: BoxFit.fitWidth,
            // ! 이미지 높이 값을 지정해서 이미지 아래의 위젯들이 밀려나는 현상을 방지
            height: MediaQuery.sizeOf(context).width * imageRatio,
            // * 이미지가 자연스럽게 나오도록 fade-in 효과 부여
            frameBuilder: (
              BuildContext _,
              Widget child,
              int? frame,
              bool wasSynchronouslyLoaded,
            ) {
              if (wasSynchronouslyLoaded) return child;
              return AnimatedOpacity(
                opacity: frame == null ? 0 : 1,
                duration: const Duration(seconds: 1),
                curve: Curves.easeOut,
                child: child,
              );
            },
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              lorem(paragraphs: 2, words: 60),
            ),
          ),
        ],
      ),
    );
  }
}
