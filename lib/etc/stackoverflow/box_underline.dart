import 'package:flutter/material.dart';

class BoxUnderline extends StatelessWidget {
  const BoxUnderline({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IntrinsicWidth(
          child: Column(
            children: [
              // title
              Text(
                '123 asdf ',
                // style: baseStyle,
              ),

              // underline
              Container(
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.yellow,
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
        ),
      ],
    );
  }
}
