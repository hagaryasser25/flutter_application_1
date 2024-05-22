import 'package:dio/dio.dart';
import 'package:flutter_application_1/consts/constant.dart';


class DioHelper {
  static late Dio dio;

  static init() async {
    dio = Dio(BaseOptions(
      baseUrl: apiBaseUrl,
      receiveDataWhenStatusError: true,
    ));
  }


  static Future<Response> getData({
    required url,
  }) async {
    dio.options.headers['x-api-key'] = apiKey;
    return await dio.get(
      url,
    );
  }

    
}

