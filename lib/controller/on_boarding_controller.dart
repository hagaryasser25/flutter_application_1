import 'package:flutter/material.dart';
import 'package:flutter_application_1/dio/dio_helper.dart';
import 'package:flutter_application_1/models/on_boarding_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getOnBoarding = ChangeNotifierProvider<OnBoardingController>(
    (ref) => OnBoardingController());

class OnBoardingController extends ChangeNotifier {
  OnBoardingModel? onBoardingModel;

  OnBoardingController() {
    getOnBoarding();
  }

  void getOnBoarding() {
    DioHelper.getData(url: '/student/OnBoardings').then((value) {
      onBoardingModel = OnBoardingModel.fromJson(value.data);
      notifyListeners();
      print(onBoardingModel!.status);
    }).catchError((error) {
      print(error.toString());
    });
    
  }
}
