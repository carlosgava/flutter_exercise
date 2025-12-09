import 'package:flutter/material.dart';

class ProgressBarIndicator extends StatelessWidget {
  final double progress;
  final Color backgroundColor;
  final Color progressBarColor;
  final double height;
  final BorderRadius borderRadius;

  const ProgressBarIndicator({
    super.key,
    required this.progress,
    this.backgroundColor = Colors.grey,
    this.progressBarColor = Colors.blue,
    this.height = 20.0,
    this.borderRadius = const BorderRadius.all(Radius.circular(10.0)),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: borderRadius,
      ),
      child: Stack(
        children: [
          FractionallySizedBox(
            widthFactor: progress,
            child: Container(
              decoration: BoxDecoration(
                color: progressBarColor,
                borderRadius: borderRadius,
              ),
            ),
          ),
          Center(
            child: Text(
              '${(progress * 100).toInt()}%',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}