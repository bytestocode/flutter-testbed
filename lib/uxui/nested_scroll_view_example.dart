import 'package:flutter/material.dart';

// 참고 링크: https://api.flutter.dev/flutter/widgets/NestedScrollView-class.html
class NestedScrollViewExample extends StatelessWidget {
  const NestedScrollViewExample({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> tabs = <String>['Tab 1', 'Tab 2'];

    final statusBarHeight = MediaQuery.of(context).padding.top;
    final appBarHeight = kToolbarHeight;
    final topPadding = statusBarHeight + appBarHeight;

    final tabBarHeight = 50.0;

    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, _) {
            return [
              SliverOverlapAbsorber(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: const SliverAppBar(
                  title: Text('NestedScrollView Example'),
                  pinned: true,
                  expandedHeight: 250,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Image(
                      image: AssetImage('assets/images/sail.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Transform(
                  transform: Matrix4.translationValues(0, topPadding, 0),
                  child: Column(
                    children: [
                      Container(
                        color: Colors.red,
                        child: Text(
                          'asfdsaf ' * 40,
                        ),
                      ),
                      Container(
                        color: Colors.blue,
                        child: Text(
                          'asfdsaf ' * 30,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ];
          },
          body: Stack(
            children: [
              TabBarView(
                children: tabs
                    .map((String name) => Padding(
                          padding: EdgeInsets.only(top: tabBarHeight),
                          child: Builder(
                            builder: (BuildContext context) {
                              return CustomScrollView(
                                key: PageStorageKey<String>(name),
                                slivers: [
                                  SliverOverlapInjector(
                                    handle: NestedScrollView
                                        .sliverOverlapAbsorberHandleFor(
                                            context),
                                  ),
                                  SliverPadding(
                                    padding: const EdgeInsets.all(0),
                                    sliver: SliverFixedExtentList(
                                      itemExtent: 48,
                                      delegate: SliverChildBuilderDelegate(
                                        (_, int index) {
                                          return Container(
                                            color: index.isOdd
                                                ? Colors.white
                                                : Colors.black12,
                                            child: Center(
                                              child: Text('Item $index'),
                                            ),
                                          );
                                        },
                                        childCount: 30,
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ))
                    .toList(),
              ),
              Container(
                margin: EdgeInsets.only(top: topPadding),
                color: Colors.white,
                height: tabBarHeight,
                child: TabBar(
                  tabs: tabs.map((name) => Tab(text: name)).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
