import 'package:flutter/material.dart';
import '../modules/home/drawings/right_background_element.dart';

class RightCorner extends StatelessWidget {
  final double height;
  final double width;
  Color cornerColor;

   RightCorner(
      {super.key,
      required this.height,
      required this.width,
      required this.cornerColor});
  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      bottom: 0,
      child: CustomPaint(
        size: Size(
          width,
          height,
        ),
        painter: RightElement(cornerColor: cornerColor),
      ),
    );
  }
}
