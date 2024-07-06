import 'package:flutter/material.dart';

class ShadowContainer extends StatelessWidget {
  const ShadowContainer(
      {super.key,
      this.borderRadius = 15,
      this.blurRadius = 6,
      this.child,
      this.shadowColors = Colors.black26,
      this.isTopBorder = false,
      this.height = 80});

  final double borderRadius;
  final double blurRadius;
  final double height;
  final Widget? child;
  final Color shadowColors;
  final bool isTopBorder;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: isTopBorder
            ? BorderRadius.only(
                topLeft: Radius.circular(borderRadius),
                topRight: Radius.circular(borderRadius),
              )
            : BorderRadius.only(
                bottomLeft: Radius.circular(borderRadius),
                bottomRight: Radius.circular(borderRadius),
              ),
        boxShadow: [
          BoxShadow(
            color: shadowColors, //Colors.black26,
            blurRadius: blurRadius,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: child,
    );
  }
}
