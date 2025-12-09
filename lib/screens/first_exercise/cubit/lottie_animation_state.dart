part of 'lottie_animation_cubit.dart';

@immutable
abstract class LottieAnimationState {}

class LottieAnimationInitialState extends LottieAnimationState {}
class LottieAnimationLoadingState extends LottieAnimationState {}

class LottieAnimationLoadedState extends LottieAnimationState {
  final Uint8List bytes;
  LottieAnimationLoadedState(this.bytes);
}

class LottieAnimationErrorState extends LottieAnimationState {
  final String message;
  LottieAnimationErrorState(this.message);
}