import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:formfun_flutter_test/widgets/loading_border.dart';
import 'package:formfun_flutter_test/widgets/linear_progress_bar.dart'
    show LinearProgressStrategy;
import 'package:formfun_flutter_test/widgets/progress_bar.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreen();
}

class _FirstScreen extends State<FirstScreen> {
  static const Color _primaryWhite = Color.fromARGB(255, 255, 255, 255);
  static const Color _softWhite = Color.fromARGB(255, 191, 184, 174);
  static const Color _mediumGray = Color.fromARGB(255, 128, 128, 128);

  final double _progress = 0.7;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Center(
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: LoadingBorder(
            duration: 4,
            colorFrom: Colors.black,
            colorTo: Colors.white70,
            staticBorderColor: const Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(20),
            padding: EdgeInsets.all(16),
            child: SizedBox(
              width: 320,
              height: 195,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                    const SizedBox(height: 20),
                    ProgressLoader(
                      progress: _progress,
                      strategy: LinearProgressStrategy(),
                      style: ProgressStyle(
                        gradientColors: const [_softWhite, _primaryWhite],
                        height: 16,
                        width: MediaQuery.of(context).size.width - 15,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(4),
                        ),
                        backgroundColor: _mediumGray,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '${(_progress * 100).toStringAsFixed(1)}%',
                      style: Theme.of(context).textTheme.headlineSmall
                          ?.copyWith(
                            color: Colors.black54,
                            fontFamily: 'AktivGrotesk',
                            fontWeight: FontWeight.w200,
                            letterSpacing: 0.3,
                          ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Form&Fun Exercise Showcase',
                      style: Theme.of(context).textTheme.headlineSmall
                          ?.copyWith(
                            color: Colors.black54,
                            fontFamily: 'AktivGrotesk',
                            fontWeight: FontWeight.w200,
                            letterSpacing: 0.3,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
