import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_ui_mobile_web/ui/widget/shadow_container.dart';
import 'package:responsive_ui_mobile_web/utils/const.dart';

import '../../utils/image.dart';
import '../responsive.dart';
import '../widget/appBar/app_bar.dart';
import '../widget/custome_shap/buttom_curved.dart';
import '../widget/gradien_button.dart';

class MobileView extends StatefulWidget {
  const MobileView({super.key});

  @override
  State<MobileView> createState() => _MobileViewState();
}

class _MobileViewState extends State<MobileView> {
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
      backgroundColor: AppColors.white,
      appBar: const CommonAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// agreement Screen
            ClipPath(
              clipper: BottomInnerCurveClipper(),
              child: Container(
                width: double.infinity,
                decoration:
                    const BoxDecoration(gradient: AppColors.magentaGradient),
                child: Column(
                  children: [
                    Column(
                      children: [
                        const Text(
                          "Deine Job \nwebsite",
                          style: TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                              color: AppColors.black),
                          textAlign: TextAlign.start,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 28.0),
                          child: SizedBox(
                            width: double.infinity,
                            child: SvgPicture.asset(
                              // height: 200.h,
                              fit: BoxFit.fill,
                              AppImages.agreementSvg,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),

            ///  Tab bar
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.teal, width: 1),
              ),
              child: SizedBox(
                width: Responsive.isMob(context) ? double.infinity : 600,
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

            const SizedBox(height: 18),

            /// second
            const Padding(
              padding:  EdgeInsets.all(10),
              child:  Text(
                "Drei einfache Schritte \nzu deinem neuen Job",
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: AppColors.grey),
                textAlign: TextAlign.start,
              ),
            ),

            /// third

          ],
        ),
      ),

      /// Bottom Navigation Bar
      bottomNavigationBar: const  ShadowContainer(
        height: 100,
        isTopBorder: true,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18, vertical: 24),
          child: GradientButton(
            textButton: 'Kostenlos Registrieren',
          ),
        ),
      ),
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
                      : const BorderRadius.only(
                          bottomRight: Radius.circular(12),
                          topRight: Radius.circular(12))),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
