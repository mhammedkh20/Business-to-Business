import 'package:b2b_app/core/network/auth_api.dart';
import 'package:b2b_app/future/auth/model/general_auth_response.dart';
import 'package:b2b_app/future/auth/model/user_model.dart';

abstract class AuthRepo {
  EitherType<String> login({
    required String email,
    required String password,
  });

  EitherType<GeneralAuthResponse<String>> register({
    required String phone,
    required String name,
    required String password,
  });

  EitherType<GeneralAuthResponse<UserModel>> verifyCode({
    required String phone,
    required String code,
  });

  EitherType<GeneralAuthResponse<void>> forgetPassword({
    required String phone,
  });

  EitherType<GeneralAuthResponse<void>> resetPassword({
    required String phone,
    required String password,
    required String passwordConfirmation,
  });

  EitherType<GeneralAuthResponse<void>> changePassword({
    required String currentPass,
    required String newPass,
    required String confirmPass,
  });
}
