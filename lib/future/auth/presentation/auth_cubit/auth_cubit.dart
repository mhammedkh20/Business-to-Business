import 'package:b2b_app/core/storage/pref/shared_pref_controller.dart';
import 'package:b2b_app/future/auth/domin/auth_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo repo;

  AuthCubit(this.repo) : super(AuthInitial());

  static AuthCubit get(BuildContext context) {
    return BlocProvider.of(context);
  }

  int typeUser = 0;
  changeTypeUser(int type) {
    typeUser = type;
    emit(AuthInitial());
  }

  Future login(String password, String email) async {
    emit(AuthLoginLoading());
    (await repo.login(email: email, password: password)).fold(
      (l) {
        emit(AuthLoginFailuer(l));
      },
      (r) async {
        await SharedPrefController().setToken(r);
        emit(AuthLoginSuccess());
      },
    );
  }
}
