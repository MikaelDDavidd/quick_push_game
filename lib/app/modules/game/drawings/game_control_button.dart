import 'package:flutter/material.dart';

class GameControlButton extends CustomPainter {
  Color themeColor;
  GameControlButton({
    required this.themeColor,
  });
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = HSLColor.fromColor(themeColor).withLightness(0.22).toColor()
      ..style = PaintingStyle.fill;

    var shadow = Paint()
      ..style = PaintingStyle.fill
      ..maskFilter = MaskFilter.blur(BlurStyle.inner, size.width * 0.15)
      ..color = HSLColor.fromColor(themeColor).toColor();

    // Inicia o path
    final path = Path()
      ..moveTo(size.width * 0.3, 0)
      ..lineTo(size.width * 0.7, 0)
      ..quadraticBezierTo(size.width, 0, size.width, size.height * 0.3)
      ..lineTo(size.width, size.height * 0.7)
      ..quadraticBezierTo(size.width, size.height, size.width * 0.7, size.height)
      ..lineTo(size.width * 0.3, size.height)
      ..quadraticBezierTo(0, size.height, 0, size.height * 0.7)
      ..lineTo(0, size.height * 0.3)
      ..quadraticBezierTo(0, 0, size.width * 0.3, 0);

    canvas.drawPath(path, paint);
    canvas.drawPath(path, shadow);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
