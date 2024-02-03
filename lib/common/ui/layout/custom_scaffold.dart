import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold._({
    this.appBar,
    required this.body,
    required this.extendBodyBehindAppBar,
  });
  
  factory CustomScaffold.common({
    PreferredSizeWidget? appBar,
    required Widget body,
  }) {
    return CustomScaffold._(
      appBar: appBar,
      extendBodyBehindAppBar: false,
      body: body,
    );
  }

  factory CustomScaffold.noAppBar({
    required Widget body,
  }) {
    return CustomScaffold._(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.transparent,
        systemOverlayStyle: const SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.transparent,
          systemNavigationBarIconBrightness: Brightness.light,
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
      ),
      extendBodyBehindAppBar: true,
      body: body,
    );
  }

  final PreferredSizeWidget? appBar;
  final Widget body;
  final bool extendBodyBehindAppBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      extendBodyBehindAppBar: extendBodyBehindAppBar,
      body: body,
    );
  }
}
