import 'package:flutter/material.dart';

extension DoubleSizedBoxX on double {
  SizedBox get xBox => SizedBox(width: this, height: this);

  SizedBox get wBox => SizedBox(width: this);

  SizedBox get hBox => SizedBox(height: this);
}

extension IntSizdBoxX on int {
  SizedBox get xBox => SizedBox(width: toDouble(), height: toDouble());

  SizedBox get wBox => SizedBox(width: toDouble());

  SizedBox get hBox => SizedBox(height: toDouble());
}
