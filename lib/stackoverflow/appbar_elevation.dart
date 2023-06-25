import 'package:flutter/material.dart';

class AppBarElevationPage extends StatelessWidget {
  AppBarElevationPage({super.key});

  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('App Bar'),
        backgroundColor: Colors.grey[200],
        shadowColor: Colors.red,
      ),

      // appBar shadowColor shows when scrolling a single testPage
      // body: testPage(),

      // appBar shadowColor NOT shown when scrolling a testPage within a PageView
      body: PageView.builder(
        controller: pageController,
        itemBuilder: (context, index) => testPage(),
        itemCount: 3,
      ),
    );
  }

  Widget testPage() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Page Content',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black54,
              ),
            ),
            Container(
              color: Colors.lightBlue[100],
              height: 400,
            ),
            Container(
              color: Colors.red[100],
              height: 400,
            ),
            Container(
              color: Colors.lightBlue[100],
              height: 400,
            ),
            const Text(
              'Page Bottom',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
