/*
class OnBoardingModel {
  final bool? status;
  final List<OnBoardingData>? data;

  OnBoardingModel({required this.status, required this.data});

  final OnBoardingModel.fromJson(Map<String, dynamic> json) {
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
  final int? uid;
  final String? image;
  final String? title;
  final String? subtitle;
  final int? active;

  OnBoardingData(
      {required this.uid,
      required this.title,
      required this.image,
      required this.subtitle,
      required this.active});

  factory OnBoardingData.fromJson(Map<String, dynamic> json) {
    return OnBoardingData(
        uid: json['uid'],
        title: json['title']['en'],
        image: json['image'],
        subtitle: json['subtitle']['en'],
        active: json['active']);
  }
}
*/

class OnBoardingModel {
late final bool status;
 late final List<OnBoardingData> data;

  OnBoardingModel({required this.status, required this.data});

  OnBoardingModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    
    if (json['data'] != null) {
      data = <OnBoardingData>[];
      json['data'].forEach((v) {
        data!.add(OnBoardingData.fromJson(v));
      // print(Data.fromJson(v));
       print(v);
      });
    }
  }

  

 
}

class OnBoardingData {
 late final int uid;
 late final String image;
  dynamic title;
  dynamic subtitle;
  int? active;
  // DateTime? createdAt;
  // DateTime? updatedAt;

  OnBoardingData(
      {   required this.uid,
         required this.image,
         this.title,
         this.subtitle,
         this.active,
        });

  OnBoardingData.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    image = json['image'];
    title = json['title']['en'];
    subtitle = json['subtitle']['en'];
    active = json['active'];
    // createdAt = json['created_at'];
    // updatedAt = json['updated_at'];
  }

}


/*
import 'package:emmo_bank/models/educations_types_response_model.dart';

class OnBoardingModel{
  bool? status;
  DataModel? data;

  OnBoardingModel({required this.data, required this.status});

   factory OnBoardingModel.fromJson(Map<String, dynamic> json) {
    return OnBoardingModel(
      status: json["status"],
      data: json["data"] != null ? DataModel.fromJson(json["data"]) : null,
    );
  }
}
class DataModel{
  int? uid;
  String? image;
  dynamic title;
  dynamic subtitle;
  int? active;

  DataModel({required this.uid, required this.image, required this.title, required this.subtitle, required this.active});

   factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      uid: json['uid'],
      image: json['image'],
      title: json['title'],
      subtitle: json['subtitle'],
      active: json['active'],
    );
  }
}
*/
