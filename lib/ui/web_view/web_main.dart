import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_ui_mobile_web/ui/responsive.dart';
import 'package:responsive_ui_mobile_web/ui/widget/custome_shap/buttom_curved.dart';
import 'package:responsive_ui_mobile_web/ui/widget/gradien_button.dart';
import 'package:responsive_ui_mobile_web/utils/image.dart';
import '../../utils/const.dart';
import '../widget/appBar/app_bar.dart';

class WebView extends StatefulWidget {
  const WebView({super.key});

  @override
  State<WebView> createState() => _WebViewState();
}

class _WebViewState extends State<WebView> {
  int _selectedIndex = 0;

  final List<Widget> _tabs = [
    Center(child: Text('Arbeitnehmer Content')),
    Center(child: Text('Arbeitgeber Content')),
    Center(child: Text('Temporärbüro Content')),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(0),
        child: Column(
          children: [
            /// agreement lay out
            ClipPath(
              clipper: BottomInnerCurveClipper(),
              child: Container(
                height: 450,
                width: double.infinity,
                decoration: const BoxDecoration(
                    // color: Colors.red
                    gradient: AppColors.magentaGradient),
                child: Expanded(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    /// first Column
                    Flexible(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Deine Job \nwebsite",
                            style: TextStyle(
                                fontSize: 50,
                                fontWeight: FontWeight.bold,
                                color: AppColors.black),
                            textAlign: TextAlign.start,
                          ),
                          SizedBox(height: 20.h),
                          SizedBox(
                            width: 150.w,
                            child: const GradientButton(
                              textButton: 'Kostenlos Registrieren',
                            ),
                          )
                        ],
                      ),
                    ),

                    SizedBox(width: 15.w),

                    /// agreement column
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Flexible(
                          child: CircleAvatar(
                            minRadius: 80.r,
                            maxRadius: 90.r,
                            backgroundColor: Colors.white,
                            child: ClipOval(
                              child: SvgPicture.asset(
                                // height: 200.h,
                                fit: BoxFit.fill,
                                AppImages.agreementSvg,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),


                  ],
                )),
              ),
            ),

            /// Tab bar
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.teal, width: 1),
              ),
              child: SizedBox(
                width:   Responsive.isMob(context) ? double.infinity : 600,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildTabItem(0, 'Arbeitnehmer'),
                    _buildTabItem(1, 'Arbeitgeber'),
                    _buildTabItem(2, 'Temporärbüro'),
                  ],
                ),
              ),
            ),

            /// Text View
          ],
        ),
      )),
    );
  }

  Widget _buildTabItem(int index, String text) {
    return Expanded(
      child: GestureDetector(
        onTap: () => _onTabTapped(index),
        child: Container(
          decoration: BoxDecoration(
              color: _selectedIndex == index ? Colors.teal : Colors.transparent,
              borderRadius: index == 0
                  ? BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      topLeft: Radius.circular(12))
                  : index == 1
                      ? BorderRadius.zero
                      : BorderRadius.only(
                          bottomRight: Radius.circular(12),
                          topRight: Radius.circular(12))),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: _selectedIndex == index ? Colors.white : Colors.teal,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
