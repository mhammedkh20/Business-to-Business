import 'package:b2b_app/core/network/auth_api.dart';
import 'package:b2b_app/core/network/end_points.dart';
import 'package:b2b_app/core/services/dio_service.dart';
import 'package:b2b_app/core/utils/app_helpers.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeApi {
  final DioService dio;

  HomeApi({required this.dio});

  EitherType<dynamic> news({
    required int page,
    required int isFollowing,
  }) async {
    try {
      final response = await dio.dio.get(
        "${EndPoints.NEWS}?page=$page&limit=10&is_following=$isFollowing",
        options: Options(headers: AppHelpers.getHeader()),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return right(response.data);
      } else {
        return left(response.data['message']);
      }
    } catch (ex) {
      return left(ex.toString());
    }
  }
}
