import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:game/app/data/app_colors.dart';

// Cores

class RightElement extends CustomPainter {
   Color cornerColor;

  RightElement({
    required this.cornerColor
  });

  double WIDTH = 300;
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width, size.height * 0.01227633);
    path_0.lineTo(size.width, size.height);
    path_0.lineTo(size.width * 0.01526633, size.height);
    path_0.quadraticBezierTo(size.width * 0.01852261, size.height * 0.9894224,
        size.width * 0.02282412, size.height * 0.9793092);
    path_0.quadraticBezierTo(size.width * 0.03193970, size.height * 0.9579275,
        size.width * 0.03955779, size.height * 0.9419819);
    path_0.quadraticBezierTo(size.width * 0.06019095, size.height * 0.8987882,
        size.width * 0.08760804, size.height * 0.8606569);
    path_0.quadraticBezierTo(size.width * 0.1070653, size.height * 0.8335900,
        size.width * 0.1229447, size.height * 0.8186070);
    path_0.quadraticBezierTo(size.width * 0.1350754, size.height * 0.8071574,
        size.width * 0.1551256, size.height * 0.7948471);
    path_0.quadraticBezierTo(size.width * 0.1861407, size.height * 0.7757984,
        size.width * 0.2250151, size.height * 0.7608154);
    path_0.quadraticBezierTo(size.width * 0.2751558, size.height * 0.7414836,
        size.width * 0.3322312, size.height * 0.7275085);
    path_0.quadraticBezierTo(size.width * 0.3513467, size.height * 0.7228313,
        size.width * 0.3848643, size.height * 0.7109626);
    path_0.quadraticBezierTo(size.width * 0.4549950, size.height * 0.6861268,
        size.width * 0.5209648, size.height * 0.6512458);
    path_0.cubicTo(
        size.width * 0.5319899,
        size.height * 0.6454134,
        size.width * 0.5428945,
        size.height * 0.6399094,
        size.width * 0.5535075,
        size.height * 0.6336693);
    path_0.cubicTo(
        size.width * 0.5804121,
        size.height * 0.6178709,
        size.width * 0.6077688,
        size.height * 0.6010419,
        size.width * 0.6317387,
        size.height * 0.5834541);
    path_0.cubicTo(
        size.width * 0.6623116,
        size.height * 0.5610193,
        size.width * 0.6896985,
        size.height * 0.5321631,
        size.width * 0.7150352,
        size.height * 0.5008607);
    path_0.quadraticBezierTo(size.width * 0.7219095, size.height * 0.4923669,
        size.width * 0.7282915, size.height * 0.4836467);
    path_0.quadraticBezierTo(size.width * 0.7699397, size.height * 0.4266931,
        size.width * 0.7993769, size.height * 0.3626840);
    path_0.quadraticBezierTo(size.width * 0.8040101, size.height * 0.3526274,
        size.width * 0.8082111, size.height * 0.3414836);
    path_0.quadraticBezierTo(size.width * 0.8243216, size.height * 0.2988335,
        size.width * 0.8411457, size.height * 0.2608607);
    path_0.quadraticBezierTo(size.width * 0.8486935, size.height * 0.2438392,
        size.width * 0.8614673, size.height * 0.2176897);
    path_0.quadraticBezierTo(size.width * 0.8838593, size.height * 0.1718460,
        size.width * 0.9104724, size.height * 0.1310306);
    path_0.quadraticBezierTo(size.width * 0.9477889, size.height * 0.07378256,
        size.width * 0.9917186, size.height * 0.02202718);
    path_0.quadraticBezierTo(size.width * 0.9936683, size.height * 0.01972820,
        size.width * 0.9957688, size.height * 0.01691959);
    path_0.quadraticBezierTo(size.width * 0.9977286, size.height * 0.01431484,
        size.width, size.height * 0.01227633);
    path_0.close();

    // Pinte o caminho com a cor definida
    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = cornerColor;
    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
