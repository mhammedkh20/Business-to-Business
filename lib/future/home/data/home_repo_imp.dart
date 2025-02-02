import 'package:b2b_app/core/network/auth_api.dart';
import 'package:b2b_app/core/network/home_api.dart';
import 'package:b2b_app/future/home/domin/home_repo.dart';

class HomeRepoImp extends HomeRepo {
  HomeRepoImp({required this.api});
  final HomeApi api;

  @override
  EitherType<dynamic> getNews({
    required int page,
    required int isFollowing,
  }) {
    return api.news(page: page, isFollowing: isFollowing);
  }
}
