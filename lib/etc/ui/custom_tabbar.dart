import 'package:flutter/material.dart';

class TabBarExample extends StatefulWidget {
  const TabBarExample({super.key});

  @override
  State<TabBarExample> createState() => _TabBarExampleState();
}

class _TabBarExampleState extends State<TabBarExample>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TabBar Sample'),
        bottom: TabBar(
          controller: _tabController,
          padding: EdgeInsets.zero,
          labelPadding: EdgeInsets.zero,
          indicatorPadding: EdgeInsets.zero,
          tabs: [
            Container(
              height: 50,
              width: 120,
              decoration: BoxDecoration(
                color: _tabController.index == 0
                    ? const Color(0xfffacdc9)
                    : const Color(0xFFF4F1F1),
                border: Border.all(color: const Color(0xFFFAC5C5), width: 2),
                borderRadius: const BorderRadius.all(Radius.circular(25)),
              ),
              child: OutlinedButton(
                onPressed: () {
                  setState(() {
                    _tabController.animateTo(0);
                  });
                },
                child: const Text('1st'),
              ),
            ),
            Container(
              height: 50,
              width: 120,
              decoration: BoxDecoration(
                color: _tabController.index == 1
                    ? const Color(0xfffacdc9)
                    : const Color(0xFFF4F1F1),
                border: Border.all(color: const Color(0xFFFAC5C5), width: 2),
                borderRadius: const BorderRadius.all(Radius.circular(25)),
              ),
              child: OutlinedButton(
                onPressed: () {
                  setState(() {
                    _tabController.animateTo(1);
                  });
                },
                child: const Text('2nd'),
              ),
            ),
            Container(
              height: 50,
              width: 120,
              decoration: BoxDecoration(
                color: _tabController.index == 2
                    ? const Color(0xfffacdc9)
                    : const Color(0xFFF4F1F1),
                border: Border.all(color: const Color(0xfffccccc), width: 2),
                borderRadius: const BorderRadius.all(Radius.circular(25)),
              ),
              child: OutlinedButton(
                onPressed: () {
                  setState(() {
                    _tabController.animateTo(2);
                  });
                },
                child: const Text('3rd'),
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Center(
            child: Text("It's cloudy here"),
          ),
          Center(
            child: Text("It's rainy here"),
          ),
          Center(
            child: Text("It's sunny here"),
          ),
        ],
      ),
    );
  }
}
