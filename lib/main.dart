import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formfun_flutter_test/screens/first_exercise/cubit/lottie_animation_cubit.dart';
import 'package:formfun_flutter_test/screens/first_exercise/lottie_animation.dart';
import 'package:formfun_flutter_test/screens/first_exercise/repository/read_files_repository.dart';


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
      home: BlocProvider(
        create: (context) => LottieAnimationCubit(ReadFilesRepository()),
        child: LottieCardAnimation(),
      )
    );
  }
}