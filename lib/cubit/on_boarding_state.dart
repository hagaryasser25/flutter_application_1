abstract class OnBoardingState{}
class OnBoardingInitialState extends OnBoardingState {}

class LoadingOnBoardingDataState extends OnBoardingState {}

class OnBoardingSucessState extends OnBoardingState {}

class OnBoardingErrorState extends OnBoardingState {
  final dynamic error;

  OnBoardingErrorState(this.error);
}