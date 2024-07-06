import 'package:flutter/material.dart';

class DoubleCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    // Start from the top-left corner
    path.moveTo(0, 40);

    // Top curve
    var topFirstControlPoint = Offset(size.width / 4, 0);
    var topFirstEndPoint = Offset(size.width / 2, 30);

    var topSecondControlPoint = Offset(size.width * 3 / 4, 60);
    var topSecondEndPoint = Offset(size.width, 40);

    path.quadraticBezierTo(
      topFirstControlPoint.dx,
      topFirstControlPoint.dy,
      topFirstEndPoint.dx,
      topFirstEndPoint.dy,
    );

    path.quadraticBezierTo(
      topSecondControlPoint.dx,
      topSecondControlPoint.dy,
      topSecondEndPoint.dx,
      topSecondEndPoint.dy,
    );

    // Right side straight line
    path.lineTo(size.width, size.height - 40);

    // Bottom curve
    var bottomFirstControlPoint = Offset(size.width * 3 / 4, size.height);
    var bottomFirstEndPoint = Offset(size.width / 2, size.height - 30);

    var bottomSecondControlPoint = Offset(size.width / 4, size.height - 60);
    var bottomSecondEndPoint = Offset(0, size.height - 40);

    path.quadraticBezierTo(
      bottomFirstControlPoint.dx,
      bottomFirstControlPoint.dy,
      bottomFirstEndPoint.dx,
      bottomFirstEndPoint.dy,
    );

    path.quadraticBezierTo(
      bottomSecondControlPoint.dx,
      bottomSecondControlPoint.dy,
      bottomSecondEndPoint.dx,
      bottomSecondEndPoint.dy,
    );

    // Left side straight line
    path.lineTo(0, 40);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
