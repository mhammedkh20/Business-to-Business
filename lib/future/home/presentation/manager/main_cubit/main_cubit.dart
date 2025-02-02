import 'package:b2b_app/future/home/presentation/pages/home_page.dart';
import 'package:b2b_app/future/messages/presentation/pages/message_page.dart';
import 'package:b2b_app/future/notification/presentation/pages/notification_page.dart';
import 'package:b2b_app/future/profile/presentation/pages/profile_page.dart';
import 'package:b2b_app/future/search/presentation/pages/search_page.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainInitial());

  static MainCubit get(BuildContext context) {
    return BlocProvider.of(context);
  }

  int indexPage = 0;
  changeIndexPage(int index) {
    indexPage = index;
    emit(MainInitial());
  }

  final List<Widget> pages = const [
    HomePage(),
    NotificationPage(),
    SearchPage(),
    MessagePage(),
    ProfilePage(),
  ];
}
