import 'dart:ui';

import 'package:flutter/material.dart';

enum TrianglePosition { topLeft, topRight }

class RoundedTriangleClipper extends CustomClipper<Path> {
  final TrianglePosition position;
  final double borderRadius;

  RoundedTriangleClipper({
    required this.position,
    required this.borderRadius,
  });

  @override
  Path getClip(Size size) {
    final path = Path();
    
    if (position == TrianglePosition.topLeft) {
      path.moveTo(0, borderRadius);
      path.quadraticBezierTo(0, 0, borderRadius, 0);
      path.lineTo(size.width, 0);
      path.lineTo(0, size.height);
      path.close();
    } else {
      path.moveTo(size.width - borderRadius, 0);
      path.quadraticBezierTo(size.width, 0, size.width, borderRadius);
      path.lineTo(size.width, size.height);
      path.lineTo(0, 0);
      path.close();
    }
    
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}