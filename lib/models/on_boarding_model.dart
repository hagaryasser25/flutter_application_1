
import 'package:flutter_application_1/consts/constant.dart';

class OnBoardingModel {
  final bool status;
  final List<OnBoardingData> data;

  OnBoardingModel({required this.status, required this.data});

  factory OnBoardingModel.fromJson(Map<String, dynamic> json) {
    List<OnBoardingData> data = [];
    if (json['data'] != null) {
      json['data'].forEach((element) {
        data.add(OnBoardingData.fromJson(element));
      });
    }
    return OnBoardingModel(status: json['status'], data: data);
  }
}

class OnBoardingData {
   int? uid;
   String? image;
   dynamic title;
   dynamic subtitle;
   int? active;

  OnBoardingData(
      {required this.uid,
      required this.title,
      required this.image,
      required this.subtitle,
      required this.active});

   OnBoardingData.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    image = json['image'];
    title = json['title'][languageCode];
    subtitle = json['subtitle'][languageCode];
    active = json['active'];
    // createdAt = json['created_at'];
    // updatedAt = json['updated_at'];
  }
}






