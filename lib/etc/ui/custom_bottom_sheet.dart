import 'package:flutter/material.dart';

class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController();

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: SizedBox.expand(
              child: DraggableScrollableSheet(
                builder: (_, __) {
                  return Container(
                    color: Colors.blue[100],
                    child: ListView.builder(
                      controller: scrollController,
                      itemCount: 100,
                      itemBuilder: (_, index) {
                        return ListTile(
                          title: Text('Item $index'),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
                backgroundColor: Colors.red[100],
                builder: (context) {
                  return DraggableScrollableSheet(
                      initialChildSize: 0.8,
                      builder: (context, scrollController) {
                        return SingleChildScrollView(
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.8,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Expanded(
                                  // child: Column(
                                  //   mainAxisSize: MainAxisSize.min,
                                  child: ListView(
                                    controller: scrollController,
                                    shrinkWrap: true,
                                    primary: false,
                                    children: [
                                      const SizedBox(height: 30),
                                      Container(
                                        height: 100,
                                        color: Colors.blue[100],
                                      ),
                                      Container(
                                        height: 100,
                                        color: Colors.red[100],
                                      ),
                                      Container(
                                        height: 100,
                                        color: Colors.blue[100],
                                      ),
                                      Container(
                                        height: 100,
                                        color: Colors.red[100],
                                      ),
                                      Container(
                                        height: 100,
                                        color: Colors.blue[100],
                                      ),
                                      Container(
                                        height: 100,
                                        color: Colors.red[100],
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  color: Colors.amber,
                                  height: 100,
                                  child: const Center(
                                    child: Text(
                                      'Bottom Sheet',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                },
              );
            },
            child: const Text(
              'Bottom Sheet',
            ),
          ),
        ],
      ),
    );
  }
}
