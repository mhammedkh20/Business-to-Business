import 'package:b2b_app/core/components/loading_widget.dart';
import 'package:b2b_app/core/components/my_error_widget.dart';
import 'package:b2b_app/core/utils/app_helpers.dart';
import 'package:b2b_app/future/home/models/news_model.dart';
import 'package:b2b_app/future/home/presentation/widgets/home/post_widget.dart';
import 'package:b2b_app/core/components/my_divider.dart';
import 'package:b2b_app/future/home/presentation/widgets/home/my_tap_type_news.dart';
import 'package:b2b_app/future/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:b2b_app/future/home/presentation/widgets/home/header_home_page.dart';
import 'package:b2b_app/future/home/presentation/widgets/home/my_tap_bar_homepage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    HomeCubit.get(context).getNews();
    HomeCubit.get(context).scrollingHome();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const HeaderHomePage(),
          const MyTapBarHomePage(),
          SizedBox(height: 15.h),
          const MyTapTypeNews(),
          SizedBox(height: 15.h),
          Expanded(
            child: BlocConsumer<HomeCubit, HomeState>(
              listener: (context, state) {
                if (state is NewsFailure) {
                  AppHelpers.showSnackBar(context,
                      message: state.message, error: true);
                }
              },
              builder: (context, state) {
                if (state is NewsLoading) {
                  return const LoadingWidget();
                }
                if (state is NewsFailure) {
                  return const MyErrorWidget();
                }
                List<NewsModel> news = HomeCubit.get(context).news;
                int totalNews = HomeCubit.get(context).total;
                return SmartRefresher(
                  enablePullDown: true,
                  enablePullUp: news.length < totalNews,
                  header: const WaterDropHeader(),
                  controller: RefreshController(),
                  onLoading: () {
                    HomeCubit.get(context).getNews(loadingMore: true);
                  },
                  onRefresh: () async {
                    HomeCubit.get(context).getNews();
                  },
                  child: ListView.separated(
                    controller: HomeCubit.get(context).scrollController,
                    itemCount: news.length,
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      return PostWidget(news: news[index]);
                    },
                    separatorBuilder: (context, index) {
                      return Column(
                        children: [
                          SizedBox(height: 20.h),
                          const MyDivider(padding: 0),
                          SizedBox(height: 16.h),
                        ],
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
