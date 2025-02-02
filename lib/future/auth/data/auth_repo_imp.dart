import 'package:b2b_app/core/network/auth_api.dart';
import 'package:b2b_app/future/auth/domin/auth_repo.dart';
import 'package:b2b_app/future/auth/model/general_auth_response.dart';
import 'package:b2b_app/future/auth/model/user_model.dart';

class AuthRepoImp extends AuthRepo {
  AuthRepoImp({required this.api});
  final AuthApi api;

  @override
  EitherType<String> login({
    required String email,
    required String password,
  }) {
    return api.login(password, email);
  }

  @override
  EitherType<GeneralAuthResponse<String>> register({
    required String phone,
    required String name,
    required String password,
  }) {
    return api.register(phone, name, password);
  }

  @override
  EitherType<GeneralAuthResponse<UserModel>> verifyCode({
    required String phone,
    required String code,
  }) {
    return api.verifyCode(phone, code);
  }

  @override
  EitherType<GeneralAuthResponse> forgetPassword({
    required String phone,
  }) {
    return api.forgetPassword(phone);
  }

  @override
  EitherType<GeneralAuthResponse<void>> resetPassword({
    required String phone,
    required String password,
    required String passwordConfirmation,
  }) {
    return api.resetPassword(phone, password, passwordConfirmation);
  }

  @override
  EitherType<GeneralAuthResponse<void>> changePassword({
    required String currentPass,
    required String newPass,
    required String confirmPass,
  }) {
    return api.changePassword(currentPass, newPass, confirmPass);
  }
}
