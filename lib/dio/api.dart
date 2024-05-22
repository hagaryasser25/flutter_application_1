import 'package:dio/dio.dart';
import 'package:flutter_application_1/consts/constant.dart';

class Api{
  final dio = Dio(BaseOptions(baseUrl: apiBaseUrl));

   Future<dynamic> getOnBoarding() async {
    dio.options.headers['x-api-key'] = apiKey;
    final response = await dio.get(
      '/student/OnBoardings',
    );
    if (response.statusCode == 200) {
      return response.data;
    } else {
      return null;
    }
  }
}