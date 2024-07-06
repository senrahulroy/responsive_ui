import 'package:flutter/material.dart';

// Here i mention Screen size for our project you can customize as per want
// Here isMob for Mobile , isTab for Tablet, isDes for Desktop/Web
class Responsive extends StatelessWidget {
  final Widget mobView;
  final Widget webView;

  const Responsive({
    super.key,
    required this.mobView,
    required this.webView,
  });

  static bool isMob(context) {
    var isMob = MediaQuery.of(context).size.width < 650.0;
    return isMob;
  }

  static bool isWeb(context) {
    var isDes = MediaQuery.of(context).size.width >= 1100;
    return isDes;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 650) {
          return webView;
        } else {
          return mobView;
        }
      },
    );
  }
}
