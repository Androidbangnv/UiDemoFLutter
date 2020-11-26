import 'package:flutter_package_test/app_dio.dart';
///https://www.androidhive.info/2014/05/android-working-with-volley-library-1/
class ApiWebserver {

  /// test post api
  Future<BaseModel> graphView() async {
    Map<String, dynamic> params = {
      "req_user_id": "5b29cedd723f8e711ece4665",
      "api": "get_footprint_statistic"
    };

    final customDio = await AppDio.getInstance().getAppDio();
    final response = await customDio.sendPostRequest("get_footprint_statistic", params, true);
    final model = BaseModel.fromJson(response.data);
    return model;
  }


  /// test get api
  Future<BaseModel> getAttentionNumber() async {
    Map<String, dynamic> params = {
      "api": "get_user_inf_version_2",
      "req_user_id": "5b29cedd723f8e711ece4665",
    };

    final customDio = await AppDio.getInstance().getAppDio();
    final response = await customDio.sendPostRequest("get_user_inf_version_2", params, true);
    final model = BaseModel.fromJson(response.data);
    return model;
  }
}
