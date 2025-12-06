import 'package:flutter/material.dart';
import 'package:formfun_flutter_test/widgets/loading_border.dart';
import 'package:lottie/lottie.dart';

void main() {
  runApp(const FormAndFunApp());
}

class FormAndFunApp extends StatelessWidget {
  const FormAndFunApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Form & Fun Test',
      theme: ThemeData(
        fontFamily: 'AktivGrotesk',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
      ),
      home: const LottieCardAnimation(),
    );
  }
}

final class LottieCardAnimation extends StatefulWidget {
  const LottieCardAnimation({super.key});

  @override
  State<LottieCardAnimation> createState() => _LottieCardAnimationState();
}

class _LottieCardAnimationState extends State<LottieCardAnimation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form & Fun Exercise 1'),
      ),
      body: Center(
        child: Card(
          elevation: 5,
          margin: const EdgeInsets.all(10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: LoadingBorder(
            cornerRadius: 15,
            borderWidth: 0.8,
            child:
            Container(
              height: 190,
              width: 355,
              padding: const EdgeInsets.only(left: 8.0, top: 16.0, right: 8.0, bottom: 16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Lottie.asset(
                    'assets/lottie/searching.json',
                    repeat: true,
                    reverse: false,
                    animate: true,
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Completado!',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'Ação totalmente processada.',
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}