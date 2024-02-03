import 'package:flutter/material.dart';

enum AgeStatus { child, old }

class VideoDetail extends StatefulWidget {
  @override
  State<VideoDetail> createState() => _VideoDetailState();
}

class _VideoDetailState extends State<VideoDetail> {
  // late YoutubePlayerController _controller;
  int selectedIndex = 0;
  var links = <String>["Dx2HBxOXccs", "1AM5Fgb-qjA"];

  void playVideo(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Scaffold(
            body: Builder(builder: (context) {
              return Container(
                color: Colors.grey,
                child: Column(
                  children: [
                    // player,
                    Expanded(
                      child: ListView.builder(
                        itemCount: 2,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              const SizedBox(
                                height: 5.0,
                              ),
                              GestureDetector(
                                onTap: () {
                                  playVideo(index);
                                  // _controller.loadVideoById(
                                  //   videoId: links[index],
                                  // );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: index == selectedIndex
                                        ? Colors.blue
                                        : Colors.white,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Row(
                                      children: [
                                        Center(
                                          child: Stack(
                                            children: [
                                              Container(
                                                alignment: Alignment.center,
                                                height: 50,
                                                child: Text(
                                                  '1',
                                                  // "images/video.png",
                                                ),
                                              ),
                                              Positioned(
                                                bottom: 15.0,
                                                left: 20.0,
                                                child: Align(
                                                  alignment:
                                                      Alignment.bottomRight,
                                                  child: Text('Play!!'),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              "Basic Introduction of shapes",
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            IntrinsicHeight(
                                              child: Row(
                                                children: [
                                                  const Text(
                                                    "03:40 min",
                                                  ),
                                                  const SizedBox(
                                                    width: 1.0,
                                                  ),
                                                  const SizedBox(
                                                    height: 12.0,
                                                    child: VerticalDivider(
                                                      thickness: 1.0,
                                                    ),
                                                  ),
                                                  Text(
                                                    index == selectedIndex
                                                        ? "Now Playing..."
                                                        : "Viewed",
                                                    style: TextStyle(
                                                      fontSize: 13.0,
                                                      color:
                                                          index == selectedIndex
                                                              ? Colors.red
                                                              : Colors.green,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    )
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
