library flutter_package_test;
import 'package:flutter_package_test/model/PhoneModel.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class UserTest {
  String name;
  String email;
  PhoneModel phone;

  UserTest({this.name, this.email, this.phone});

  UserTest.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'] != null ? new PhoneModel.fromJson(json['phone']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    if (this.phone != null) {
      data['phone'] = this.phone.toJson();
    }
    return data;
  }

}
