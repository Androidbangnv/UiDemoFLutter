library flutter_package_test;
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutter_package_test/remote_constants.dart';

enum DioMethod {
  post,
  get,
  delete,
  put,
}

class AppDio {
  static AppDio _instance;
  Dio dio;
  Dio tokenDio;
  bool isRefreshed = false;
  String newToken;

  AppDio._internal();

  static AppDio getInstance() {
    if (_instance == null) {
      _instance = AppDio._internal();
      _instance.dio = Dio();
      _instance.tokenDio = Dio();
      BaseOptions options = BaseOptions(
        baseUrl: APICons.baseURL,
        contentType: 'application/json',
        connectTimeout: 30000,
        sendTimeout: 30000,
        receiveTimeout: 30000,
      );
      _instance.dio.options = options;
      _instance.dio.interceptors
        ..add(DioCacheManager(CacheConfig(baseUrl: APICons.baseURL)).interceptor
        as Interceptor);
      _instance.dio.httpClientAdapter = DefaultHttpClientAdapter();

    }
    return _instance;
  }

  Future<AppDio> getAppDio() async {
    /// config time out intercepter
    return this;
  }

  Future<Response<dynamic>> sendPostRequest(String apiPath, Map<String, dynamic> param, {bool hasToken : false}) async {
    try {
      print("------- Request api: $apiPath-------");
      Map<String, dynamic> params = param;
      // if (hasToken) {
      //   params["token"] = await _getToken();
      // }
      final response = await dio.post(apiPath, data: params);
      print("------- Response api: $apiPath  token: ${dio.options.headers["Authorization"]} - data: $response -------");
      return await _response(response, apiPath, param, DioMethod.post);
    } on DioError catch (error) {
      int errorCode = _checkConnectionError(error)
          ? ErrorCode.networkError
          : error.response.statusCode;
      print("------- Request API: $apiPath - Error code: $errorCode");
      throw (errorCode);
    }
  }

  Future<Response<dynamic>> sendGetRequest(String apiPath, Map<String, dynamic> param,{bool hasToken : false}) async {
    try {
      print("------- Request api: $apiPath-------");
      Map<String, dynamic> params = param;
      // if (hasToken) {
      //   params["token"] = await _getToken();
      // }
      final response = await dio.get(apiPath, queryParameters: params);
      print("------- Response api: $apiPath data: $response -------");
      return await _response(response, apiPath, param, DioMethod.get);
    } on DioError catch (error) {
      int errorCode = _checkConnectionError(error)
          ? ErrorCode.networkError
          : error.response.statusCode;
      print("------- Request API: $apiPath - Error code: $errorCode");
      throw (errorCode);
    }
  }


  dynamic _response(Response<dynamic> response, String apiPath,
      Map<String, dynamic> param, DioMethod method) async {
    return response;

    // final code = response.data[APIParams.code];
    // switch (code) {
    //   case ErrorCode.success:
    //     isRefreshed = false;
    //     return response;
    //     break;
    //   case ErrorCode.tokenexpired:
    //     if (!isRefreshed) {
    //       dio.interceptors.requestLock.lock();
    //       dio.interceptors.responseLock.lock();
    //       dio.interceptors.errorLock.lock();
    //       newToken = await _refreshToken();
    //       isRefreshed = true;
    //       dio.interceptors.requestLock.unlock();
    //       dio.interceptors.responseLock.unlock();
    //       dio.interceptors.errorLock.unlock();
    //     }
    //     switch (method) {
    //       case DioMethod.post:
    //         print(
    //             '----------Request API Again apiPath: $apiPath Token $newToken param: $param');
    //         final customDio = await AppDio.getInstance().getAppDio();
    //         return response =
    //         await customDio.sendPostRequest(apiPath, param, true);
    //         break;
    //       case DioMethod.get:
    //         print(
    //             '----------Request API Again apiPath: $apiPath Token $newToken param: $param');
    //         final customDio = await AppDio.getInstance().getAppDio();
    //         return response =
    //         await customDio.sendGetRequest(apiPath, param, true);
    //         break;
    //       default:
    //         break;
    //     }
    //     break;
    //   default:
    //     throw (code);
    //     break;
    // }
  }


  // dynamic _response(Response<dynamic> response, String apiPath,
  //     Map<String, dynamic> param, DioMethod method) async {
  //   final code = response.data[APIParams.code];
  //   switch (code) {
  //     case ErrorCode.success:
  //       isRefreshed = false;
  //       return response;
  //       break;
  //     case ErrorCode.tokenexpired:
  //       if (!isRefreshed) {
  //         dio.interceptors.requestLock.lock();
  //         dio.interceptors.responseLock.lock();
  //         dio.interceptors.errorLock.lock();
  //         newToken = await _refreshToken();
  //         isRefreshed = true;
  //         dio.interceptors.requestLock.unlock();
  //         dio.interceptors.responseLock.unlock();
  //         dio.interceptors.errorLock.unlock();
  //       }
  //       switch (method) {
  //         case DioMethod.post:
  //           print(
  //               '----------Request API Again apiPath: $apiPath Token $newToken param: $param');
  //           final customDio = await AppDio.getInstance().getAppDio();
  //           return response =
  //               await customDio.sendPostRequest(apiPath, param, true);
  //           break;
  //         case DioMethod.get:
  //           print(
  //               '----------Request API Again apiPath: $apiPath Token $newToken param: $param');
  //           final customDio = await AppDio.getInstance().getAppDio();
  //           return response =
  //               await customDio.sendGetRequest(apiPath, param, true);
  //           break;
  //         default:
  //           break;
  //       }
  //       break;
  //     default:
  //       throw (code);
  //       break;
  //   }
  // }

  // Future<String> _getToken() async {
  //   final userLogin = UserModel.fromJson(
  //       await SharedPreference.shared.read(KeyPreference.loginUser));
  //   return userLogin.data.token;
  // }
  //
  // Future<String> _refreshToken() async {
  //   print('---------refreshToken');
  //   Map<String, dynamic> params = {
  //     APIParams.email: "nam1049@nn.nn",
  //     "pwd": "3d4f2bf07dc1be38b20cd6e46949a1071f9d0e3d",
  //     "device_id": "B721CEBE-B0AC-4AD6-BE15-0327AE7343F3",
  //     "notify_token": "",
  //     "voip_notify_token": "",
  //     "device_type": 0,
  //     "login_time": "20201118134849",
  //     "application_version": "5.6",
  //     "os_version": "12.3",
  //     "device_name": "iphone 6",
  //     "idfa": "60053DF3-9792-4DA3-AAA0-C2D8FCD37FCD",
  //     "applicaton_type": 1,
  //     "application": "tsubaki",
  //     "allow_send_real_gift": true,
  //     "api": "login_version_2"
  //   };
  //
  //   BaseOptions options = BaseOptions(
  //     baseUrl: APICons.baseURL,
  //     contentType: 'application/json',
  //     connectTimeout: 30000,
  //     sendTimeout: 30000,
  //     receiveTimeout: 30000,
  //   );
  //
  //   tokenDio.options = options;
  //   tokenDio.interceptors
  //     ..add(DioCacheManager(CacheConfig(baseUrl: APICons.baseURL)).interceptor
  //         as Interceptor);
  //   tokenDio.httpClientAdapter = DefaultHttpClientAdapter();
  //
  //   final response = await tokenDio.post(APICons.login, data: params);
  //   final loginUser = UserModel.fromJson(response.data);
  //   if (loginUser.code == ErrorCode.success) {
  //     print('--------RESPONSE refreshToken Success ${loginUser.data.token}');
  //     await SharedPreference.shared.save(KeyPreference.loginUser, loginUser);
  //   } else {
  //     print('--------RESPONSE refreshToken Fail');
  //     // ToDo: move to login screen
  //   }
  //   return loginUser.data.token;
  // }
  //
  bool _checkConnectionError(e) {
    if (e.toString().contains('SocketException') ||
        e.toString().contains('HandshakeException')) {
      return true;
    } else {
      return false;
    }
  }
}
