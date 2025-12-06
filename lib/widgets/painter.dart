import 'package:flutter/material.dart';
import 'dart:math' as math;

class Painter extends CustomPainter {
  final Animation animation;
  final double cornerRadius;
  final double borderWidth;
  final Color borderColor;
  final Color trailingBorderColor;
  final bool isTrailingTransparent;
  final int startingPosition;

  Painter({
    required this.animation,
    required this.cornerRadius,
    required this.borderWidth,
    required this.borderColor,
    required this.trailingBorderColor,
    required this.isTrailingTransparent,
    required this.startingPosition,
  }) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final paint = Paint()..color = Colors.transparent;
    final progress = animation.value;

    if (progress > 0.0) {
      paint.color = trailingBorderColor;
      paint.shader = SweepGradient(
        colors: [
          isTrailingTransparent
              ? Colors.transparent
              : borderColor.withOpacity(0.1),
          borderColor,
          Colors.transparent,
        ],
        stops: const [
          0.0,
          1.0,
          1.0,
        ],
        startAngle: math.pi / 8,
        endAngle: math.pi / 2,
        transform: GradientRotation(
          (math.pi * 2 * progress) + startingPosition,
        ),
      ).createShader(rect);
    }

    var rRect = RRect.fromRectAndRadius(
      rect,
      Radius.circular(cornerRadius),
    );

    final path = Path()..addRRect(rRect);

    canvas.drawRRect(
      rRect,
      paint
        ..strokeWidth = borderWidth
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round,
    );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(Painter oldDelegate) => true;
}