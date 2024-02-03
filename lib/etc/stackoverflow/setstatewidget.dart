import 'package:flutter/material.dart';

enum AgeStatus { child, old }

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  AgeStatus? ageStatus;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Practising_Cards'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: AllContainers(
                    onPress: () {
                      setState(() {
                        ageStatus = AgeStatus.child;
                      });
                    },
                    colors:
                        ageStatus == AgeStatus.child ? Colors.red : Colors.blue,
                    mycard: Text('Female'),
                  ),
                ),
                Expanded(
                  child: AllContainers(
                    colors:
                        ageStatus == AgeStatus.old ? Colors.blue : Colors.red,
                    onPress: () {
                      setState(() {
                        ageStatus = AgeStatus.old;
                      });
                    },
                    mycard: Text('Female'),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            width: double.infinity,
            height: 50,
            color: Colors.red,
          ),
        ],
      ),
    );
  }
}

class AllContainers extends StatelessWidget {
  final Color colors;
  final Widget mycard;

  // final Function onPress;
  final VoidCallback onPress;

  AllContainers({
    required this.colors,
    required this.mycard,
    required this.onPress,
  });

  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: onPress(),
      onTap: onPress,
      child: Container(
        child: mycard,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: colors,
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
