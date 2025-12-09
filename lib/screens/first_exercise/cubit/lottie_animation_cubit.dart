import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

part 'lottie_animation_state.dart';

class LottieAnimationCubit extends Cubit<LottieAnimationState> {

  LottieAnimationCubit() : super(LottieAnimationInitialState());

  Future<void> readFileBytes(String filePath) async {
    emit(LottieAnimationLoadingState());
    try {
      await Future.delayed(const Duration(seconds: 6));
      emit(LottieAnimationLoadedState('Loaded'));
    } catch(e) {
      emit(LottieAnimationErrorState(e.toString()));
    }
  }
}