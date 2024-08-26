import 'package:flutter/material.dart';
import 'package:game/app/modules/home/drawings/left_background_element.dart';

class LeftCorner extends StatelessWidget {
  final double height;
  final double width;
  Color cornerColor;

   LeftCorner(
      {super.key,
      required this.height,
      required this.width,
      required this.cornerColor});
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      top: 0,
      child: CustomPaint(
        size: Size(
          width,
          height,
        ),
        painter: LeftElement(cornerColor: cornerColor),
      ),
    );
  }
}
