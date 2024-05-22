import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/cubit/on_boarding_state.dart';
import 'package:flutter_application_1/dio/dio_helper.dart';
import 'package:flutter_application_1/models/on_boarding_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class OnBoardingCubit extends Cubit<OnBoardingState>{
  OnBoardingCubit() : super(OnBoardingInitialState());

  static OnBoardingCubit get(context) => BlocProvider.of(context);
  OnBoardingModel? onBoardingModel;

   void getOnBoarding() {
    emit(LoadingOnBoardingDataState());

    DioHelper.getData(url: '/student/OnBoardings').then((value) {
      onBoardingModel = OnBoardingModel.fromJson(value.data);
      print(onBoardingModel!.status);
      emit(OnBoardingSucessState());
    }).catchError((error) {
      print(error.toString());
      emit(OnBoardingErrorState(error));
    });
  }


}