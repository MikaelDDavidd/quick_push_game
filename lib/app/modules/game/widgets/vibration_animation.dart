import 'dart:async';

import 'package:flutter/material.dart';

class VibrationAnimationController {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _rotationAnimation;
  Duration _duration = const Duration(milliseconds: 5000);
  Timer? _timer;

  VibrationAnimationController({required TickerProvider vsync, required Duration duration}) {
    _controller = AnimationController(vsync: vsync, duration: const Duration(milliseconds: 1000))..repeat();
    _scaleAnimation = Tween(begin: 1.0, end: 1.0).animate(_controller);
    _rotationAnimation = Tween(begin: 0.0, end: 0.0).animate(_controller);
    _duration = duration;
    //_controller.stop();
    //_controller.reset();
  }

  void startAnimation(animate, onAnimationEnd) {
    if (animate) {
      _controller.duration = _duration;
      _scaleAnimation = TweenSequence([
        TweenSequenceItem(tween: Tween(begin: 1.0, end: 0.7), weight: 1),
        TweenSequenceItem(tween: Tween(begin: 0.7, end: 1.0), weight: 1),
      ]).animate(_controller);
      _rotationAnimation = TweenSequence([
        TweenSequenceItem(tween: Tween(begin: 0.0, end: -0.52), weight: 1),
        TweenSequenceItem(tween: Tween(begin: -0.52, end: 0.52), weight: 1),
        TweenSequenceItem(tween: Tween(begin: 0.52, end: 0.0), weight: 1),
      ]).animate(_controller);
      _controller.forward(from: 0.0);
      Timer(_duration, () {
        onAnimationEnd();
      });
    } else {
      onAnimationEnd();
    }
  }

  Animation<double> get scaleAnimation => _scaleAnimation;
  Animation<double> get rotationAnimation => _rotationAnimation;

  void dispose() {
    _timer?.cancel();
    _controller.dispose();
  }
}

class VibrationAnimationPage extends StatefulWidget {
  final Widget child;
  final VibrationAnimationController controller;

  VibrationAnimationPage({
    Key? key,
    required this.child,
    required this.controller,
  }) : super(key: key);

  @override
  _VibrationAnimationPageState createState() => _VibrationAnimationPageState();
}

class _VibrationAnimationPageState extends State<VibrationAnimationPage> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([
        widget.controller.scaleAnimation,
        widget.controller.rotationAnimation,
      ]),
      child: widget.child,
      builder: (context, child) {
        return Transform.rotate(
          angle: widget.controller.rotationAnimation.value,
          child: Transform.scale(
            scale: widget.controller.scaleAnimation.value,
            child: child,
          ),
        );
      },
    );
  }
}
