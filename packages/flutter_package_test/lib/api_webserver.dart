library flutter_package_test;
import 'package:flutter_package_test/app_dio.dart';
import 'package:flutter_package_test/remote_constants.dart';

import 'model/UserTest.dart';
///https://www.androidhive.info/2014/05/android-working-with-volley-library-1/
class ApiWebserver {

  /// test post api
  Future<UserTest> testPostMethod() async {
    Map<String, dynamic> params = {
      "name": "Androidhive",
      "email": "abc@androidhive.info",
      "password": "password123",
    };
    final customDio = await AppDio.getInstance().getAppDio();
    final response = await customDio.sendPostRequest(APICons.PERSON_OBJECT, params);
    final model = UserTest.fromJson(response.data);
    return model;
  }


  /// test get api
  Future<UserTest> testGetMethod() async {
    //Map<String, dynamic> params = {};
    final customDio = await AppDio.getInstance().getAppDio();
    final response = await customDio.sendGetRequest(APICons.PERSON_OBJECT);
    //final response = await AppDio.getInstance().sendGetRequest(APICons.PERSON_OBJECT,param: params);
    final model = UserTest.fromJson(response.data);
    return model;
  }

  /// test get api
  Future<List<UserTest>> testGetListMethod() async {
    //Map<String, dynamic> params = {};
    final customDio = await AppDio.getInstance().getAppDio();
    final response = await customDio.sendGetRequest(APICons.PERSON_ARRAY);
    //final response = await AppDio.getInstance().sendGetRequest(APICons.PERSON_OBJECT,param: params);
    List<UserTest> listdata = List<UserTest>();
    final model = (response.data as List).forEach((element) {
      listdata.add(UserTest.fromJson(element));
    });
    return listdata;
  }
}
