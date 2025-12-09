
import 'package:flutter/material.dart';
import 'package:formfun_flutter_test/widgets/progress_bar_indicator.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formfun_flutter_test/screens/first_exercise/cubit/lottie_animation_cubit.dart';
import 'package:formfun_flutter_test/widgets/loading_border.dart';

class LottieCardAnimation extends StatefulWidget {
  const LottieCardAnimation({super.key});

  @override
  State<LottieCardAnimation> createState() => _LottieCardAnimation();
}

class _LottieCardAnimation extends State<LottieCardAnimation> {

  @override
  void initState()  {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form & Fun Exercise 1'),
      ),
      body: BlocBuilder<LottieAnimationCubit, LottieAnimationState>(
        builder: (context, state) {
          if (state is LottieAnimationInitialState) {
            return Container();
          } else if (state is LottieAnimationLoadingState) {
            return showAnimation(true);
          } else if (state is LottieAnimationLoadedState) {
            return showAnimation(false);
          } else if (state is LottieAnimationErrorState) {
            return Container(
              color: Colors.red,
            );
          } else {
            return Container(
              color: Colors.black12,
            );
          }
        },
      ),
    );
  }
}

Widget showAnimation(bool startAnimation) {
  return Center(
    child: Card(
        elevation: 5,
        margin: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: startAnimation ? _withAnimation() : _withoutAnimation(),
    ),
  );
}

Widget _withoutAnimation() {
  return Container(
    height: 190,
    width: 355,
    decoration: BoxDecoration(
      border: Border.all(
        color: Colors.black,
        width: 0.8,
      ),
      borderRadius: BorderRadius.circular(15),
    ),
    padding: const EdgeInsets.only(
        left: 8.0,
        top: 16.0,
        right: 8.0,
        bottom: 16.0)
    ,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Lottie.asset(
          'assets/lottie/searching.json',
          repeat: false,
          reverse: false,
          animate: false,
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
  );
}

Widget _withAnimation() {
  double currentProgress = 0.3;
  return LoadingBorder(
    cornerRadius: 15,
    borderWidth: 0.8,
    child:
    Container(
      height: 190,
      width: 355,
      padding: const EdgeInsets.only(
          left: 8.0,
          top: 16.0,
          right: 8.0,
          bottom: 16.0)
      ,
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
          ProgressBarIndicator(
            progress: (currentProgress + 0.1).clamp(0.0, 1.0),
            progressBarColor: Colors.grey,
            backgroundColor: Colors.black26,
            height: 25.0,
            borderRadius: BorderRadius.circular(12.0),
          ),
          const SizedBox(height: 5),
          const Text(
            'Ação totalmente processada.',
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ),
  );
}