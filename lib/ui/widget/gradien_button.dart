


import 'package:flutter/material.dart';

import '../../utils/const.dart';

class GradientButton extends StatelessWidget {
  const GradientButton({
    super.key,
    this.height = 40,
    this.textButton,
    this.onTap,
  });

  final double height;
  final String? textButton;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            gradient: AppColors.bgGradient),
        height: height,
        child: Center(
          child: Text(
            textButton ?? '',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
