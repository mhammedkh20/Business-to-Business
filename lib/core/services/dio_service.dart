import 'package:dio/dio.dart';
import 'package:b2b_app/core/network/end_points.dart';
import 'package:b2b_app/core/utils/app_helpers.dart';

class DioService {
  static final DioService _singleton = DioService._internal();

  factory DioService() {
    return _singleton;
  }

  late final Dio dio;

  DioService._internal() {
    dio = Dio(
      BaseOptions(
        baseUrl: EndPoints.BASE_URL,
        followRedirects: false,
        validateStatus: (int? status) {
          return status! < 500;
        },
        headers: AppHelpers.getHeader(),
      ),
    );
  }
}
