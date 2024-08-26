import 'package:flutter/material.dart';

class GameControlDraw extends CustomPainter {
  double shadowWidth;
  Color backgroundColor;
  Color borderColor;
  double borderWidth;
  GameControlDraw({
    required this.shadowWidth,
    required this.backgroundColor,
    required this.borderColor,
    required this.borderWidth,
  });
  @override
  void paint(Canvas canvas, Size size) {
    var background = Paint()
      ..style = PaintingStyle.fill
      ..color = HSLColor.fromColor(backgroundColor).withLightness(0.2).toColor();

    var paintFill = Paint()
      ..style = PaintingStyle.fill
      ..maskFilter = MaskFilter.blur(BlurStyle.inner, shadowWidth)
      ..color = backgroundColor;

    var paintStroke = Paint()
      ..color = HSLColor.fromColor(borderColor).withLightness(0.6).toColor()
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth;

    var path = Path();

    path.moveTo(size.width * 0.36, 0);
    path.lineTo(size.width * 0.65, 0);

    path.quadraticBezierTo(size.width * 0.97, size.height * 0.02, size.width, size.height * 0.46);

    path.lineTo(size.width, size.height * 0.63);

    double bottomDetailY = size.height * 0.923;
    path.quadraticBezierTo(size.width * 0.99, size.height * 0.97, size.width * 0.75, size.height);
    path.quadraticBezierTo(size.width * 0.7, size.height * 0.918, size.width * 0.5, bottomDetailY);
    path.quadraticBezierTo(size.width * 0.3, size.height * 0.918, size.width * 0.25, size.height);

    path.quadraticBezierTo(size.width * 0.01, size.height * 0.97, 0, size.height * 0.63);

    path.lineTo(0, size.height * 0.46);

    path.quadraticBezierTo(size.width * 0.03, size.height * 0.02, size.width * 0.36, 0);

    canvas.drawPath(path, background);
    canvas.drawPath(path, paintFill);
    canvas.clipPath(path);

    //canvas.drawPath(path, paintStroke);

    var leftDetailPath = Path();
    leftDetailPath.moveTo(size.width * 0.03, size.height * 0.27);
    leftDetailPath.quadraticBezierTo(size.width * 0.07, size.height * 0.6, size.width * 0.011, size.height * 0.76);
    canvas.drawPath(leftDetailPath, paintStroke);

    var rightDetailPath = Path();
    rightDetailPath.moveTo(size.width * 0.97, size.height * 0.27);
    rightDetailPath.quadraticBezierTo(size.width * 0.93, size.height * 0.6, size.width * 0.99, size.height * 0.76);
    canvas.drawPath(rightDetailPath, paintStroke);

    //canvas.drawShadow(path, Colors.black, -12.0, false);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
