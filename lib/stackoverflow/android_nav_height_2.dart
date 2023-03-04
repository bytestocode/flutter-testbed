import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';

enum AgeStatus { child, old }

class AndroidNavHeight2 extends StatefulWidget {
  @override
  State<AndroidNavHeight2> createState() => _AndroidNavHeight2State();
}

class _AndroidNavHeight2State extends State<AndroidNavHeight2> {
  int selectedIndex = 0;
  var links = <String>["Dx2HBxOXccs", "1AM5Fgb-qjA"];

  void playVideo(int index) async {
    setState(() {
      selectedIndex = index;
    });
    final devicePixelRatio = MediaQuery.of(context).devicePixelRatio;
    final screenHeight = MediaQuery.of(context).size.height;

    final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    final AndroidDeviceInfo androidInfo = await deviceInfoPlugin.androidInfo;
    final deviceHeight = androidInfo.displayMetrics.heightPx;

    final androidNavHeight = deviceHeight / devicePixelRatio - screenHeight;
    print(androidNavHeight);
  }

  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.of(context).padding;
    final viewInsets = MediaQuery.of(context).viewInsets;
    final viewPadding = MediaQuery.of(context).viewPadding;
    print('viewInsets.top: ${viewInsets.top}');
    print('padding.top: ${padding.top}');
    print('viewPadding.top: ${viewPadding.top}');
    print('viewInsets.bottom: ${viewInsets.bottom}');
    print('padding.bottom: ${padding.bottom}');
    print('viewPadding.bottom: ${viewPadding.bottom}');

    return Stack(
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
    );
  }
}
