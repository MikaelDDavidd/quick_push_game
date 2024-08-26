import 'dart:ui' as ui;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

//Copy this CustomPainter code to the Bottom of the File
class LeftElement extends CustomPainter {
  final Color cornerColor;

  LeftElement({
    required this.cornerColor
  });

  double WIDTH = 300;
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(0, 0);
    path_0.lineTo(size.width * 0.9627792, 0);
    path_0.lineTo(size.width * 0.9646898, size.height * 0.0005753968);
    path_0.quadraticBezierTo(size.width * 0.9662531, size.height * 0.001031746,
        size.width * 0.9649628, size.height * 0.001865079);
    path_0.cubicTo(
        size.width * 0.9400248,
        size.height * 0.01779762,
        size.width * 0.9167494,
        size.height * 0.03412698,
        size.width * 0.8916873,
        size.height * 0.05265873);
    path_0.cubicTo(
        size.width * 0.8640199,
        size.height * 0.07309524,
        size.width * 0.8391067,
        size.height * 0.09509921,
        size.width * 0.8158561,
        size.height * 0.1169841);
    path_0.quadraticBezierTo(size.width * 0.7752605, size.height * 0.1551984,
        size.width * 0.7399256, size.height * 0.2008929);
    path_0.quadraticBezierTo(size.width * 0.6985608, size.height * 0.2543849,
        size.width * 0.6645658, size.height * 0.3133135);
    path_0.quadraticBezierTo(size.width * 0.5970968, size.height * 0.4302579,
        size.width * 0.5521588, size.height * 0.5606746);
    path_0.quadraticBezierTo(size.width * 0.5486600, size.height * 0.5707738,
        size.width * 0.5434988, size.height * 0.5803373);
    path_0.quadraticBezierTo(size.width * 0.5060050, size.height * 0.6496825,
        size.width * 0.4577916, size.height * 0.7098810);
    path_0.quadraticBezierTo(size.width * 0.4167742, size.height * 0.7610714,
        size.width * 0.3782134, size.height * 0.7962897);
    path_0.quadraticBezierTo(size.width * 0.3554342, size.height * 0.8171230,
        size.width * 0.3241687, size.height * 0.8410317);
    path_0.cubicTo(
        size.width * 0.2779653,
        size.height * 0.8763889,
        size.width * 0.2227047,
        size.height * 0.9045040,
        size.width * 0.1643424,
        size.height * 0.9265079);
    path_0.quadraticBezierTo(size.width * 0.1640447, size.height * 0.9266071,
        size.width * 0.1636973, size.height * 0.9266270);
    path_0.quadraticBezierTo(size.width * 0.1630521, size.height * 0.9266667,
        size.width * 0.1624566, size.height * 0.9269048);
    path_0.quadraticBezierTo(size.width * 0.1311663, size.height * 0.9389484,
        size.width * 0.09816377, size.height * 0.9484325);
    path_0.quadraticBezierTo(size.width * 0.07498759, size.height * 0.9550992,
        size.width * 0.05208437, size.height * 0.9608929);
    path_0.quadraticBezierTo(size.width * 0.03225806, size.height * 0.9659127,
        size.width * 0.002282878, size.height * 0.9709524);
    path_0.quadraticBezierTo(size.width * 0.001091811, size.height * 0.9711508,
        size.width * 0.0009925558, size.height * 0.9701786);
    path_0.lineTo(0, size.height * 0.9605754);
    path_0.lineTo(0, 0);
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
