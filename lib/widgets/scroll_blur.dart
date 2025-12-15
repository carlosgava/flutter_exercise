import 'package:flutter/material.dart';

class SingleScrollerWithBlur extends StatelessWidget {
  final Widget child;
  final ScrollController? controller;
  const SingleScrollerWithBlur({
    super.key,
    required this.child,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ShaderMask(
        shaderCallback: (Rect bounds) {
          return LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: const [
              Colors.transparent,
              Colors.black,
              Colors.black,
              Colors.transparent,
            ],
            stops: const [0.0, 0.25, 0.95, 1.0],
          ).createShader(bounds);
        },
        blendMode: BlendMode.dstIn,
        child: SingleChildScrollView(
          controller: controller!.hasClients ? controller : null,
          child: child,
        ),
      ),
    );
  }
}
