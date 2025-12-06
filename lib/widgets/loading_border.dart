import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:formfun_flutter_test/widgets/painter.dart';

class LoadingBorder extends StatefulWidget {
  final Widget child;
  final ValueChanged<AnimationController>? controller;
  final Duration duration;
  final double cornerRadius;
  final double borderWidth;
  final Color borderColor;
  final Color trailingBorderColor;
  final EdgeInsets padding;
  final bool startWithRandomPosition;
  final bool isTrailingTransparent;

  const LoadingBorder({
    required this.child,
    this.controller,
    this.duration = const Duration(seconds: 4),
    this.cornerRadius = 0.0,
    this.borderWidth = 1,
    this.borderColor = Colors.black,
    this.trailingBorderColor = Colors.black,
    this.padding = EdgeInsets.zero,
    this.startWithRandomPosition = true,
    this.isTrailingTransparent = true,
    Key? key,
  }) : super(key: key);

  @override
  _LoadingBorderState createState() => _LoadingBorderState();
}

class _LoadingBorderState extends State<LoadingBorder>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  Color borderColor = Colors.transparent;

  @override
  void didUpdateWidget(LoadingBorder oldWidget) {
    if (oldWidget != oldWidget) {
      _controller.forward(from: 0.0);
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    super.initState();
    borderColor = widget.borderColor;
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    )..addStatusListener((status) {
      if (status == AnimationStatus.reverse) {
        setState(() {
          borderColor = Colors.transparent;
        });
      }
    });

    _controller.repeat();

    widget.controller?.call(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: Painter(
        animation: _controller,
        cornerRadius: widget.cornerRadius,
        borderWidth: widget.borderWidth,
        borderColor: borderColor,
        trailingBorderColor: widget.trailingBorderColor,
        isTrailingTransparent: widget.isTrailingTransparent,
        startingPosition:
        widget.startWithRandomPosition ? getRandomNumber() : 0,
      ),
      child: Padding(
        padding: widget.padding,
        child: widget.child,
      ),
    );
  }

  int getRandomNumber() {
    var random = math.Random();
    return (random.nextInt(20) + 6);
  }
}