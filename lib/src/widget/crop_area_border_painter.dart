import 'package:flutter/material.dart';

class CropAreaBorderPainter extends CustomPainter {
  final Rect rect;
  final double radius;
  final double borderWidth;
  final Color borderColor;

  CropAreaBorderPainter({
    required this.rect,
    required this.radius,
    required this.borderWidth,
    required this.borderColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth;

    final path = Path()
      ..moveTo(rect.left, rect.top + radius)
      ..arcToPoint(Offset(rect.left + radius, rect.top),
          radius: Radius.circular(radius))
      ..lineTo(rect.right - radius, rect.top)
      ..arcToPoint(Offset(rect.right, rect.top + radius),
          radius: Radius.circular(radius))
      ..lineTo(rect.right, rect.bottom - radius)
      ..arcToPoint(Offset(rect.right - radius, rect.bottom),
          radius: Radius.circular(radius))
      ..lineTo(rect.left + radius, rect.bottom)
      ..arcToPoint(Offset(rect.left, rect.bottom - radius),
          radius: Radius.circular(radius))
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
