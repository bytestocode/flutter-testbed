import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: StackOverflowExample()));
}

class StackOverflowExample extends StatelessWidget {
  Widget _buildListItem() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      height: 100,
      color: Colors.blue[100],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => print('tap'),
        child: Stack(
          children: [
            ListView.builder(
              itemCount: 20,
              itemBuilder: (_, __) => _buildListItem(),
            ),
            const Center(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(4.0),
                scrollDirection: Axis.vertical,
                child: Text(
                  '3 lines of text\nsecond line\n3rd invisible line',
                  maxLines: 2,
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
