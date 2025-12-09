import 'dart:typed_data';
import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:formfun_flutter_test/screens/first_exercise/repository/read_files_repository.dart';

part 'lottie_animation_state.dart';

class LottieAnimationCubit extends Cubit<LottieAnimationState> {
  final ReadFilesRepository repository;

  LottieAnimationCubit(this.repository) : super(LottieAnimationInitialState());

  Future<void> readFileBytes(String filePath) async {
    emit(LottieAnimationLoadingState());
    try {
      final fileContent = await repository.readBytesFromFile(filePath);
      emit(LottieAnimationLoadedState(fileContent));
    } catch(e) {
      emit(LottieAnimationErrorState(e.toString()));
    }
  }
}