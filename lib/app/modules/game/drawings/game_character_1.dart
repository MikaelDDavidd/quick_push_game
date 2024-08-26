import 'dart:ui';

import 'package:flutter/material.dart';

class GameCharacter1 extends CustomPainter {
  Color themeColor;
  GameCharacter1({
    required this.themeColor,
  });
  @override
  void paint(Canvas canvas, Size size) {
    double strokeWidth = size.width * 0.029;

    Path path_9 = Path();
    path_9.moveTo(size.width * 0.08598071, size.height * 0.7427974);
    path_9.quadraticBezierTo(size.width * 0.07742765, size.height * 0.7429582, size.width * 0.06807074, size.height * 0.7395177);
    path_9.cubicTo(size.width * 0.04614148, size.height * 0.7314148, size.width * 0.02832797, size.height * 0.7218006, size.width * 0.01980707,
        size.height * 0.7003215);
    path_9.cubicTo(size.width * 0.007427653, size.height * 0.6690032, size.width * 0.008231511, size.height * 0.6290675, size.width * 0.01009646,
        size.height * 0.5960450);
    path_9.cubicTo(size.width * 0.01125402, size.height * 0.5762058, size.width * 0.01649518, size.height * 0.5523473, size.width * 0.03440514,
        size.height * 0.5404502);
    path_9.quadraticBezierTo(size.width * 0.06202572, size.height * 0.5220900, size.width * 0.09652733, size.height * 0.5169132);
    path_9.arcToPoint(Offset(size.width * 0.09810289, size.height * 0.5157235),
        radius: Radius.elliptical(size.width * 0.002057878, size.height * 0.002025723), rotation: 7.5, largeArc: false, clockwise: false);
    path_9.cubicTo(size.width * 0.1313505, size.height * 0.4437621, size.width * 0.1888424, size.height * 0.3855305, size.width * 0.2579421,
        size.height * 0.3469775);
    path_9.cubicTo(size.width * 0.4041801, size.height * 0.2653698, size.width * 0.5909968, size.height * 0.2655949, size.width * 0.7366559,
        size.height * 0.3494855);
    path_9.quadraticBezierTo(size.width * 0.8387138, size.height * 0.4082637, size.width * 0.8894212, size.height * 0.5091640);
    path_9.cubicTo(size.width * 0.8911897, size.height * 0.5127331, size.width * 0.8954019, size.height * 0.5152733, size.width * 0.8992283,
        size.height * 0.5158199);
    path_9.cubicTo(size.width * 0.9279100, size.height * 0.5200000, size.width * 0.9563344, size.height * 0.5285209, size.width * 0.9766238,
        size.height * 0.5466238);
    path_9.cubicTo(size.width * 0.9878457, size.height * 0.5566559, size.width * 0.9922830, size.height * 0.5807074, size.width * 0.9931833,
        size.height * 0.5961415);
    path_9.quadraticBezierTo(size.width * 0.9962379, size.height * 0.6482637, size.width * 0.9886174, size.height * 0.6849518);
    path_9.quadraticBezierTo(size.width * 0.9809325, size.height * 0.7217363, size.width * 0.9446945, size.height * 0.7355949);
    path_9.cubicTo(size.width * 0.9363344, size.height * 0.7387781, size.width * 0.9282958, size.height * 0.7427010, size.width * 0.9194212,
        size.height * 0.7425402);
    path_9.cubicTo(size.width * 0.9130225, size.height * 0.7424759, size.width * 0.9090675, size.height * 0.7450482, size.width * 0.9031511,
        size.height * 0.7462701);
    path_9.quadraticBezierTo(size.width * 0.9009646, size.height * 0.7466881, size.width * 0.9001286, size.height * 0.7487781);
    path_9.quadraticBezierTo(size.width * 0.8548232, size.height * 0.8622186, size.width * 0.7431833, size.height * 0.9295820);
    path_9.cubicTo(size.width * 0.5717363, size.height * 1.033023, size.width * 0.3312540, size.height * 1.017492, size.width * 0.1813826,
        size.height * 0.8805788);
    path_9.quadraticBezierTo(size.width * 0.1185531, size.height * 0.8231833, size.width * 0.08884244, size.height * 0.7447267);
    path_9.quadraticBezierTo(size.width * 0.08810289, size.height * 0.7427331, size.width * 0.08598071, size.height * 0.7427974);
    path_9.close();

    Paint paint_9_fill = Paint()..style = PaintingStyle.fill;
    paint_9_fill.color = HSLColor.fromColor(themeColor).withLightness(0.2).toColor();

    var paintBackground = Paint()
      ..style = PaintingStyle.fill
      ..maskFilter = MaskFilter.blur(BlurStyle.inner, strokeWidth * 2)
      ..color = HSLColor.fromColor(themeColor).toColor();

    canvas.drawPath(path_9, paint_9_fill);
    canvas.drawPath(path_9, paintBackground);

    Paint paint_9_fill_stroke = Paint()..style = PaintingStyle.stroke;
    paint_9_fill_stroke.strokeWidth = (strokeWidth);
    paint_9_fill_stroke.color = HSLColor.fromColor(themeColor).withLightness(0.2).toColor();
    //canvas.drawPath(path_9, paint_9_fill_stroke);

    Path path_11 = Path();
    path_11.moveTo(size.width * 0.5794855, size.height * 0.3697749);
    path_11.cubicTo(size.width * 0.6871383, size.height * 0.3694212, size.width * 0.7750161, size.height * 0.4505466, size.width * 0.7865595,
        size.height * 0.5558199);
    path_11.cubicTo(size.width * 0.7888103, size.height * 0.5763023, size.width * 0.7879421, size.height * 0.5984566, size.width * 0.7876849,
        size.height * 0.6198071);
    path_11.quadraticBezierTo(size.width * 0.7864309, size.height * 0.7196785, size.width * 0.7228296, size.height * 0.7949196);
    path_11.cubicTo(size.width * 0.6763987, size.height * 0.8498392, size.width * 0.6085531, size.height * 0.8845016, size.width * 0.5379421,
        size.height * 0.8894855);
    path_11.quadraticBezierTo(size.width * 0.5085852, size.height * 0.8915756, size.width * 0.4694212, size.height * 0.8907395);
    path_11.cubicTo(size.width * 0.3818006, size.height * 0.8888424, size.width * 0.3024759, size.height * 0.8490997, size.width * 0.2512540,
        size.height * 0.7783601);
    path_11.quadraticBezierTo(size.width * 0.2037942, size.height * 0.7127974, size.width * 0.1998392, size.height * 0.6313505);
    path_11.cubicTo(size.width * 0.1987460, size.height * 0.6087138, size.width * 0.1979743, size.height * 0.5757878, size.width * 0.2013183,
        size.height * 0.5503537);
    path_11.cubicTo(size.width * 0.2129582, size.height * 0.4613826, size.width * 0.2804502, size.height * 0.3898714, size.width * 0.3685852,
        size.height * 0.3734727);
    path_11.quadraticBezierTo(size.width * 0.3911897, size.height * 0.3692605, size.width * 0.4295820, size.height * 0.3695177);
    path_11.quadraticBezierTo(size.width * 0.5084887, size.height * 0.3700322, size.width * 0.5794855, size.height * 0.3697749);
    path_11.close();

    Paint paint_11_fill = Paint()..style = PaintingStyle.stroke;
    paint_11_fill.strokeWidth = strokeWidth;
    paint_11_fill.color = Color(0xffffffff);
    canvas.drawPath(path_11, paint_11_fill);

    var paintFill = Paint()
      ..style = PaintingStyle.fill
      ..maskFilter = MaskFilter.blur(BlurStyle.inner, 10)
      ..color = HSLColor.fromColor(Color(0XFFf1ebc9)).toColor();

    Paint paint_12_fill = Paint()..style = PaintingStyle.fill;
    paint_12_fill.color = HSLColor.fromColor(Color(0XFFf1ebc9)).withLightness(0.57).toColor();

    canvas.drawPath(path_11, paint_12_fill);
    canvas.drawPath(path_11, paintFill);

    Paint paint13 = Paint()
      ..color = Color(0xffffffff)
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(size.width * 0.3475, size.height * 0.5725), size.width * 0.071, paint13);

    Paint paint14 = Paint()
      ..color = Color(0xffffffff)
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(size.width * 0.6367, size.height * 0.5725), size.width * 0.071, paint14);

    Path path_5 = Path();
    path_5.moveTo(size.width * 0.3856228, size.height * 0.7327180);
    path_5.arcToPoint(Offset(size.width * 0.3320080, size.height * 0.7003743),
        radius: Radius.elliptical(size.width * 0.05864952, size.height * 0.02192926), rotation: 10.6, largeArc: false, clockwise: false);
    path_5.arcToPoint(Offset(size.width * 0.2703257, size.height * 0.7111405),
        radius: Radius.elliptical(size.width * 0.05864952, size.height * 0.02192926), rotation: 10.6, largeArc: false, clockwise: false);
    path_5.arcToPoint(Offset(size.width * 0.3239405, size.height * 0.7434842),
        radius: Radius.elliptical(size.width * 0.05864952, size.height * 0.02192926), rotation: 10.6, largeArc: false, clockwise: false);
    path_5.arcToPoint(Offset(size.width * 0.3856228, size.height * 0.7327180),
        radius: Radius.elliptical(size.width * 0.05864952, size.height * 0.02192926), rotation: 10.6, largeArc: false, clockwise: false);

    Paint paint_5_stroke = Paint()
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.006430868;
    paint_5_stroke.color = Color(0xFFFF90B7);
    canvas.drawPath(path_5, paint_5_stroke);

    Path path_6 = Path();
    path_6.moveTo(size.width * 0.7072762, size.height * 0.7109756);
    path_6.arcToPoint(Offset(size.width * 0.6455749, size.height * 0.7003170),
        radius: Radius.elliptical(size.width * 0.05864952, size.height * 0.02192926), rotation: -10.7, largeArc: false, clockwise: false);
    path_6.arcToPoint(Offset(size.width * 0.5920164, size.height * 0.7327543),
        radius: Radius.elliptical(size.width * 0.05864952, size.height * 0.02192926), rotation: -10.7, largeArc: false, clockwise: false);
    path_6.arcToPoint(Offset(size.width * 0.6537177, size.height * 0.7434129),
        radius: Radius.elliptical(size.width * 0.05864952, size.height * 0.02192926), rotation: -10.7, largeArc: false, clockwise: false);
    path_6.arcToPoint(Offset(size.width * 0.7072762, size.height * 0.7109756),
        radius: Radius.elliptical(size.width * 0.05864952, size.height * 0.02192926), rotation: -10.7, largeArc: false, clockwise: false);

    Paint paint_6_stroke = Paint()
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.006430868;
    paint_6_stroke.color = Color(0xFFFF90B7);
    canvas.drawPath(path_6, paint_6_stroke);

    Paint paint_17_fill = Paint()..style = PaintingStyle.fill;
    paint_17_fill.color = Color(0xff000000);
    canvas.drawCircle(Offset(size.width * 0.3472669, size.height * 0.5723473), size.width * 0.05646302, paint_17_fill);

    Paint paint_18_fill = Paint()..style = PaintingStyle.fill;
    paint_18_fill.color = Color(0xff000000);
    canvas.drawCircle(Offset(size.width * 0.6366559, size.height * 0.5723473), size.width * 0.05639871, paint_18_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
