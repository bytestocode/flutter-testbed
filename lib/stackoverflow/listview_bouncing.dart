import 'package:flutter/material.dart';

class ListviewBouncing extends StatelessWidget {
  ListviewBouncing({super.key});

  final List<String> entries = <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        physics: ClampingScrollPhysics(),
        itemCount: 30,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 50,
            color: Colors.amber[colorCodes[index % 3]],
            child: Center(child: Text('Entry ${entries[index % 3]}')),
          );
        });
  }
}
