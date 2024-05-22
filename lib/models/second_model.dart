
class OnBoardingModel {
  bool? status;
  List<Data>? data;

  OnBoardingModel({this.status, this.data});

  OnBoardingModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      // print(Data.fromJson(v));
       print(v);
      });
    }
  }

  

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? uid;
  String? image;
  dynamic title;
  dynamic subtitle;
  int? active;
  // DateTime? createdAt;
  // DateTime? updatedAt;

  Data(
      {   this.uid,
         this.image,
         this.title,
         this.subtitle,
         this.active,
        });

  Data.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    image = json['image'];
    title = json['title']['en'];
    subtitle = json['subtitle']['en'];
    active = json['active'];
    // createdAt = json['created_at'];
    // updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uid'] = uid;
    data['image'] = image;
    data['title']['en'] = title;
    data['subtitle']['en'] = subtitle;
    data['active'] = active;
    // data['created_at'] = this.createdAt;
    // data['updated_at'] = this.updatedAt;
    return data;
  }
}
