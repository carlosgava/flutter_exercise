import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class LoadingBorder extends StatefulWidget {
  final Widget child;
  final double duration;
  final double borderWidth;
  final Color colorFrom;
  final Color colorTo;
  final Color staticBorderColor;
  final BorderRadius borderRadius;
  final EdgeInsetsGeometry padding;

  const LoadingBorder({
    super.key,
    required this.child,
    this.duration = 15,
    this.borderWidth = 1.5,
    this.colorFrom = const Color(0xFFFF6640),
    this.colorTo = const Color(0xFF444FA3),
    this.staticBorderColor = const Color(0xFFCCCCCC),
    this.borderRadius = const BorderRadius.all(Radius.circular(12)),
    this.padding = EdgeInsets.zero,
  });

  @override
  State<LoadingBorder> createState() => _LoadingBorderState();
}

class _LoadingBorderState extends State<LoadingBorder> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: widget.duration.toInt()),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return CustomPaint(
          painter: BorderBeamPainter(
            progress: _animation.value,
            borderWidth: widget.borderWidth,
            colorFrom: widget.colorFrom,
            colorTo: widget.colorTo,
            staticBorderColor: widget.staticBorderColor,
            borderRadius: widget.borderRadius,
          ),
          child: Padding(
            padding: widget.padding,
            child: widget.child,
          ),
        );
      },
    );
  }
}

class BorderBeamPainter extends CustomPainter {
  final double progress;
  final double borderWidth;
  final Color colorFrom;
  final Color colorTo;
  final Color staticBorderColor;
  final BorderRadius borderRadius;

  BorderBeamPainter({
    required this.progress,
    required this.borderWidth,
    required this.colorFrom,
    required this.colorTo,
    required this.staticBorderColor,
    required this.borderRadius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    final rrect = borderRadius.toRRect(rect);

    final staticPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth
      ..color = staticBorderColor;
    canvas.drawRRect(rrect, staticPaint);

    final path = Path()..addRRect(rrect);
    final pathMetrics = path.computeMetrics().first;
    final pathLength = pathMetrics.length;
    final animationProgress = progress % 1.0;
    final start = animationProgress * pathLength;
    final end = (start + pathLength / 4) % pathLength;

    Path extractPath;
    if (end > start) {
      extractPath = pathMetrics.extractPath(start, end);
    } else {
      extractPath = pathMetrics.extractPath(start, pathLength);
      extractPath.addPath(pathMetrics.extractPath(0, end), Offset.zero);
    }

    final gradientStart =
        pathMetrics.getTangentForOffset(start)?.position ?? Offset.zero;
    final gradientEnd = pathMetrics
        .getTangentForOffset((start + pathLength / 8) % pathLength)
        ?.position ??
        Offset.zero;

    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth;

    paint.shader = ui.Gradient.linear(
      gradientStart,
      gradientEnd,
      [
        colorTo.withValues(alpha: 0.0),
        colorTo,
        colorFrom,
      ],
      [0.0, 0.3, 1.0],
    );

    canvas.drawPath(extractPath, paint);
  }

  @override
  bool shouldRepaint(covariant BorderBeamPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
