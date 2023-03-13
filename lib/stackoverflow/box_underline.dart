import 'package:flutter/material.dart';

class BoxUnderline extends StatelessWidget {
  const BoxUnderline({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              // title
              Text(
                '123123',
                // style: baseStyle,
              ),

              // underline
              Container(
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(2),
                ),
                // hacky
                // child: Text(
                //   title,
                //   style: baseStyle,
                // ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
