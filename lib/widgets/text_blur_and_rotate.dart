import 'dart:math' as math;
import 'package:flutter/material.dart';

class RotatingTextWidget extends StatefulWidget {
  final String text;
  final double radius;
  final TextStyle textStyle;
  final Duration rotationDuration;

  const RotatingTextWidget({
    super.key,
    required this.text,
    required this.radius,
    required this.textStyle,
    required this.rotationDuration,
  });

  @override
  State<RotatingTextWidget> createState() => _RotatingTextWidgetState();
}

class _RotatingTextWidgetState extends State<RotatingTextWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.rotationDuration,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          size: Size(widget.radius * 2, widget.radius * 2),
          painter: _CircularTextPainter(
            text: widget.text,
            radius: widget.radius,
            textStyle: widget.textStyle,
            progress: _controller.value,
          ),
        );
      },
    );
  }
}

class _CircularTextPainter extends CustomPainter {
  final String text;
  final double radius;
  final TextStyle textStyle;
  final double progress;

  late final double _centerX;
  late final double _centerY;

  _CircularTextPainter({
    required this.text,
    required this.radius,
    required this.textStyle,
    required this.progress,
  });

  @override
  void paint(Canvas canvas, Size size) {
    _centerX = size.width / 2;
    _centerY = size.height / 2;

    final RotationCalculator calculator = RotationCalculator(
      text: text,
      radius: radius,
      textStyle: textStyle,
      progress: progress,
    );

    final SegmentMeasurements measurements =
    calculator.calculateSegmentMeasurements();
    _drawRepeatingSegments(canvas, measurements);
  }

  void _drawRepeatingSegments(Canvas canvas, SegmentMeasurements measurements) {
    double startAngle = measurements.initialStartAngle;

    for (int rep = 0; rep < measurements.repetitions; rep++) {
      _drawDot(canvas, startAngle);
      _drawTextSegment(
        canvas,
        startAngle + measurements.dotAngle / 2,
        measurements.textAngle,
        measurements.segmentAngle,
      );

      startAngle += measurements.segmentAngle;
    }
  }

  void _drawTextSegment(
      Canvas canvas,
      double startAngle,
      double textAngle,
      double segmentAngle,
      ) {
    final CharacterMeasurements charMeasurements = _measureCharacters();

    double currentAngle = startAngle;

    for (int i = 0; i < text.length; i++) {
      _drawCharacter(
        canvas,
        text[i],
        currentAngle,
        textAngle,
        charMeasurements.charWidths[i],
        charMeasurements.totalWidth,
      );

      double charProportion =
          charMeasurements.charWidths[i] / charMeasurements.totalWidth;
      currentAngle += textAngle * charProportion;
    }
  }

  void _drawCharacter(
      Canvas canvas,
      String char,
      double currentAngle,
      double textAngle,
      double charWidth,
      double totalCharWidth,
      ) {
    final textPainter = _createTextPainter(char);

    double charProportion = charWidth / totalCharWidth;
    double charAngle = textAngle * charProportion;
    double charCenterAngle = currentAngle + (charAngle / 2);

    final position = _calculatePositionOnCircle(charCenterAngle);

    _paintRotatedCharacter(
        canvas, textPainter, position, charCenterAngle, charWidth);
  }

  TextPainter _createTextPainter(String char) {
    final textSpan = TextSpan(text: char, style: textStyle);
    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    );

    textPainter.layout();
    return textPainter;
  }

  Offset _calculatePositionOnCircle(double angle) {
    final x = _centerX + radius * math.cos(angle);
    final y = _centerY + radius * math.sin(angle);
    return Offset(x, y);
  }

  void _paintRotatedCharacter(
      Canvas canvas,
      TextPainter painter,
      Offset position,
      double angle,
      double charWidth,
      ) {

    canvas.save();
    canvas.translate(position.dx, position.dy);
    canvas.rotate(angle + math.pi / 2);
    painter.paint(canvas, Offset(-charWidth / 2, -painter.height / 2));
    canvas.restore();
  }

  void _drawDot(Canvas canvas, double angle) {
    final dotRadius = textStyle.fontSize! / 4;
    final dotPaint = Paint()
      ..color = textStyle.color!
      ..style = PaintingStyle.fill;

    final dotPosition = _calculatePositionOnCircle(angle);
    canvas.drawCircle(dotPosition, dotRadius, dotPaint);
  }

  CharacterMeasurements _measureCharacters() {
    List<double> charWidths = [];
    double totalWidth = 0;

    for (int i = 0; i < text.length; i++) {
      final painter = _createTextPainter(text[i]);
      charWidths.add(painter.width);
      totalWidth += painter.width;
    }

    return CharacterMeasurements(
      charWidths: charWidths,
      totalWidth: totalWidth,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class RotationCalculator {
  final String text;
  final double radius;
  final TextStyle textStyle;
  final double progress;

  RotationCalculator({
    required this.text,
    required this.radius,
    required this.textStyle,
    required this.progress,
  });

  SegmentMeasurements calculateSegmentMeasurements() {
    final double totalAngle = 2 * math.pi;
    final double startAngle = -math.pi / 2 + (progress * totalAngle);

    double textWidth = _calculateTextWidth();
    double dotWidth = textStyle.fontSize!;
    double totalWidth = textWidth + dotWidth;

    int repetitions = (totalAngle * radius / totalWidth).floor();

    repetitions = math.max(1, repetitions);

    double segmentAngle = totalAngle / repetitions;
    double textAngle = (textWidth / totalWidth) * segmentAngle;
    double dotAngle = segmentAngle - textAngle;

    return SegmentMeasurements(
      initialStartAngle: startAngle,
      repetitions: repetitions,
      segmentAngle: segmentAngle,
      textAngle: textAngle,
      dotAngle: dotAngle,
    );
  }

  double _calculateTextWidth() {
    final textSpan = TextSpan(text: text, style: textStyle);
    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    return textPainter.width;
  }
}

class CharacterMeasurements {
  final List<double> charWidths;
  final double totalWidth;

  CharacterMeasurements({
    required this.charWidths,
    required this.totalWidth,
  });
}

class SegmentMeasurements {
  final double initialStartAngle;
  final int repetitions;
  final double segmentAngle;
  final double textAngle;
  final double dotAngle;

  SegmentMeasurements({
    required this.initialStartAngle,
    required this.repetitions,
    required this.segmentAngle,
    required this.textAngle,
    required this.dotAngle,
  });
}