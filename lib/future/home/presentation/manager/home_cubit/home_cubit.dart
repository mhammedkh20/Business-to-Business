import 'package:b2b_app/future/home/domin/home_repo.dart';
import 'package:b2b_app/future/home/models/news_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo repo;

  HomeCubit(this.repo) : super(HomeInitial());

  static HomeCubit get(BuildContext context) {
    return BlocProvider.of(context);
  }

  int indexAdsNews = 0;

  changeAdsNews(int index) {
    indexAdsNews = index;
    emit(HomeInitial());
  }

  bool isExpanded = true;

  bool notifyExpanded = true;

  double pixels = 0.0;
  final ScrollController scrollController = ScrollController();

  scrollingHome() {
    scrollController.addListener(() {
      pixels = scrollController.position.pixels;
      if (pixels > 77.h && notifyExpanded) {
        notifyExpanded = false;
        isExpanded = false;
        emit(HomeInitial());
      }
      if (pixels < 77.h) {
        if (!notifyExpanded) {
          notifyExpanded = true;
          isExpanded = true;
          emit(HomeInitial());
        }
      }
    });
  }

  int typeNews = 0;

  changeTypeNews(int index) {
    typeNews = index;
  }

  List<NewsModel> news = [];
  int total = 0;
  int page = 1;

  clearData() {
    total = 0;
    page = 1;
    news.clear();
  }

  Future getNews({bool loadingMore = false}) async {
    if (loadingMore) {
      page++;
      emit(NewsPaginationLoading());
    } else {
      clearData();
      emit(NewsLoading());
    }
    (await repo.getNews(page: page, isFollowing: typeNews)).fold(
      (l) {
        emit(NewsFailure(l));
      },
      (r) async {
        total = r['total'];
        r['data'].forEach((e) => news.add(NewsModel.fromJson(e)));
        emit(NewsSuccess());
      },
    );
  }
}
