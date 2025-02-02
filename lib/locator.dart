import 'package:b2b_app/core/network/auth_api.dart';
import 'package:b2b_app/core/network/home_api.dart';
import 'package:b2b_app/future/auth/data/auth_repo_imp.dart';
import 'package:b2b_app/future/auth/domin/auth_repo.dart';
import 'package:b2b_app/future/home/data/home_repo_imp.dart';
import 'package:b2b_app/future/home/domin/home_repo.dart';
import 'package:get_it/get_it.dart';
import 'package:b2b_app/core/services/dio_service.dart';
import 'package:b2b_app/core/services/navigation_service.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => DioService());

  locator.registerLazySingleton<AuthRepo>(
      () => AuthRepoImp(api: AuthApi(dio: locator<DioService>())));

  locator.registerLazySingleton<HomeRepo>(
      () => HomeRepoImp(api: HomeApi(dio: locator<DioService>())));
}
