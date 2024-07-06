import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_ui_mobile_web/ui/mobile_view/mobile_main.dart';
import 'package:responsive_ui_mobile_web/ui/responsive.dart';
import 'package:responsive_ui_mobile_web/ui/web_view/web_main.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 600), // replace here sized initial
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const Responsive(
              mobView: MobileView(),
              webView: WebView(),
          ),
        );
      },
    );
  }
}
