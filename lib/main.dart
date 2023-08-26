import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_testbed/ui/custom_listview.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        // body: Column(
        //   children: [
        //     CustomTableCalendar(),
        //   ],
        // ),
        appBar: AppBar(
          forceMaterialTransparency: true,
          title: const Text('Instagram'),
          leading: IconButton(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            onPressed: () {},
            icon: const Icon(
              Icons.camera_alt_outlined,
              color: Colors.red,
            ),
          ),
          actions: [
            IconButton(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              onPressed: () {},
              icon: const Icon(Icons.email_outlined),
            ),
          ],
        ),
        body: ListView(
          children: <Widget>[
            UserStory(),
            UserPost(),
          ],
        ),
      ),
    );
  }
}

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 400,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://picsum.photos/200'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                height: 300,
                child: ListView(
                  children: [
                    IntrinsicHeight(
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              color: Colors.greenAccent,
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 20,
                                  horizontal: 12,
                                ),
                                child: Text('test@example.com'),
                              ),
                            ),
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.grey,
                              minimumSize: const Size(0, 0),
                              // padding: const EdgeInsets.all(10),
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            onPressed: () {},
                            child: Container(
                              height: double.infinity,
                              child: Icon(Icons.logout),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      color: Colors.red,
                    ),
                  ],
                ),
              ),
              Center(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 40,
                    crossAxisSpacing: 2.5,
                  ),
                  scrollDirection: Axis.vertical,
                  itemCount: 19,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return const Text(
                      '_',
                    );
                  },
                ),
              ),
              loginContainer(),
            ],
          ),
        ),
      ),
    );
  }
}

Widget loginContainer() {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white70,
      borderRadius: BorderRadius.circular(10),
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 5.0,
          sigmaY: 5.0,
        ),
        child: getLoginContainer(),
      ),
    ),
  );
}

Widget getLoginContainer() {
  return Column(
    children: [
      Text('df'),
      const SizedBox(
        height: 10.0,
      ),
      Text('df'),
      const SizedBox(
        height: 10.0,
      ),
    ],
  );
}
