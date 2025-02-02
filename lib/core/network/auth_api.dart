import 'package:b2b_app/core/network/end_points.dart';
import 'package:b2b_app/core/services/dio_service.dart';
import 'package:b2b_app/core/utils/app_helpers.dart';
import 'package:b2b_app/future/auth/model/general_auth_response.dart';
import 'package:b2b_app/future/auth/model/user_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

typedef EitherType<T> = Future<Either<String, T>>;

class AuthApi {
  final DioService dio;

  AuthApi({required this.dio});

  EitherType<String> login(String password, String email) async {
    try {
      final data = {
        "email": email,
        "password": password,
      };
      final response = await dio.dio.post(
        EndPoints.LOGIN,
        data: data,
        options: Options(headers: AppHelpers.getHeader()),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return right(response.data['access_token']);
      } else {
        return left(response.data['message']);
      }
    } catch (ex) {
      return left(ex.toString());
    }
  }

  EitherType<GeneralAuthResponse<String>> register(
    String phone,
    String name,
    String password,
  ) async {
    try {
      final data = {
        "phone": phone,
        "password": password,
        "name": name,
      };
      final response = await dio.dio.post(
        EndPoints.REGISTR,
        options: Options(headers: AppHelpers.getHeader()),
        data: data,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return right(GeneralAuthResponse.fromJson(response.data));
      } else {
        return left(response.data['message']);
      }
    } catch (ex) {
      return left(ex.toString());
    }
  }

  EitherType<GeneralAuthResponse<UserModel>> verifyCode(
    String phone,
    String code,
  ) async {
    try {
      final data = {
        "phone": phone,
        "code": code,
      };
      final response = await dio.dio.post(
        EndPoints.VERIFY_CODE,
        options: Options(headers: AppHelpers.getHeader()),
        data: data,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return right(GeneralAuthResponse.fromJson(response.data));
      } else {
        return left(response.data['message']);
      }
    } catch (ex) {
      return left(ex.toString());
    }
  }

  EitherType<GeneralAuthResponse<void>> forgetPassword(String phone) async {
    try {
      final data = {"phone": phone};
      final response = await dio.dio.post(
        EndPoints.FORGET_PASSWORD,
        data: data,
        options: Options(headers: AppHelpers.getHeader()),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return right(GeneralAuthResponse.fromJson(response.data));
      } else {
        return left(response.data['message']);
      }
    } catch (ex) {
      return left(ex.toString());
    }
  }

  EitherType<GeneralAuthResponse<void>> resetPassword(
    String phone,
    String password,
    String passwordConfirmation,
  ) async {
    try {
      final data = {
        "phone": phone,
        "password": password,
        "password_confirmation": passwordConfirmation,
      };
      final response = await dio.dio.post(
        EndPoints.RESET_PASSWORD,
        data: data,
        options: Options(headers: AppHelpers.getHeader()),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return right(GeneralAuthResponse.fromJson(response.data));
      } else {
        return left(response.data['message']);
      }
    } catch (ex) {
      return left(ex.toString());
    }
  }

  EitherType<GeneralAuthResponse<void>> changePassword(
    String currentPass,
    String newPass,
    String confirmPass,
  ) async {
    try {
      final data = {
        "current_password": currentPass,
        "password": newPass,
        "password_confirmation": confirmPass,
      };
      final response = await dio.dio.post(
        EndPoints.CHANGE_PASSWORD,
        data: data,
        options: Options(headers: AppHelpers.getHeader()),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return right(GeneralAuthResponse.fromJson(response.data));
      } else {
        return left(response.data['message']);
      }
    } catch (ex) {
      return left(ex.toString());
    }
  }
}
