import 'package:b2b_app/core/network/auth_api.dart';

abstract class HomeRepo {
  EitherType<dynamic> getNews({
    required int page,
    required int isFollowing,
  });
}
