import 'package:flutter/material.dart';

class StackOverflowExample extends StatelessWidget {
  Widget _buildListItem() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      height: 100,
      color: Colors.red[100],
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
              child: SizedBox(
                height: 150,
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(16.0),
                  scrollDirection: Axis.vertical,
                  child: Text(
                    '3 lines of text\nsecond line\n3rd invisible line',
                    // maxLines: 2,
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
