library flutter_package_test;
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class PhoneModel {
  String home;
  String mobile;

  PhoneModel({this.home, this.mobile});

  PhoneModel.fromJson(Map<String, dynamic> json) {
    home = json['home'];
    mobile = json['mobile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['home'] = this.home;
    data['mobile'] = this.mobile;
    return data;
  }
}
