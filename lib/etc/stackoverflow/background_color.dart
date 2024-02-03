import 'package:flutter/material.dart';

class BackgroundColorWidget extends StatelessWidget {
  BackgroundColorWidget({super.key});

  final List<String> entries = <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          height: 600,
          color: Colors.yellow,
          child: SatFirstTab(),
        ),
        // ListView.builder(
        //     padding: const EdgeInsets.all(8),
        //     physics: ClampingScrollPhysics(),
        //     itemCount: 30,
        //     itemBuilder: (BuildContext context, int index) {
        //       return Container(
        //         height: 50,
        //         color: Colors.amber[colorCodes[index % 3]],
        //         child: Center(child: Text('Entry ${entries[index % 3]}')),
        //       );
        //     }),
      ],
    );
  }
}

class SatFirstTab extends StatelessWidget {
  const SatFirstTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        extendBody: true,
        body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Container(
                  height: 180,
                  width: 175,
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                    image: DecorationImage(
                      image: AssetImage('image/prog1.png'),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
                Container(
                  height: 180,
                  width: 175,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('image/prog3.png'),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
                Container(
                  height: 180,
                  width: 175,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('image/prog3.png'),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
