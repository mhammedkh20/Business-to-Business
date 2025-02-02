import 'package:b2b_app/core/components/my_contianer_shape.dart';
import 'package:b2b_app/core/utils/app_colors.dart';
import 'package:b2b_app/future/home/presentation/manager/main_cubit/main_cubit.dart';
import 'package:b2b_app/future/home/presentation/widgets/main/item_bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyBottonNav extends StatelessWidget {
  const MyBottonNav({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MyContainerShape(
      height: 80.h,
      enableBorder: true,
      colorBorder: AppColors.BG_BOTTOM_NAV_S,
      bgContainer: AppColors.WHITE,
      child: BlocBuilder<MainCubit, MainState>(
        builder: (context, state) {
          int selected = MainCubit.get(context).indexPage;
          return Row(
            children: [
              ItemBottomNav(
                icon: 'assets/images/bottom_nav/ic_home.svg',
                onTap: () {
                  MainCubit.get(context).changeIndexPage(0);
                },
                isSelected: selected == 0,
                height: 20.r,
                width: 20.r,
              ),
              ItemBottomNav(
                icon: 'assets/images/bottom_nav/ic_notification.svg',
                isSelected: selected == 1,
                onTap: () {
                  MainCubit.get(context).changeIndexPage(1);
                },
                width: 14.r,
                height: 20.r,
              ),
              ItemBottomNav(
                icon: 'assets/images/bottom_nav/ic_search.svg',
                isSelected: selected == 2,
                onTap: () {
                  MainCubit.get(context).changeIndexPage(2);
                },
                width: 20.r,
                height: 20.r,
              ),
              ItemBottomNav(
                onTap: () {
                  MainCubit.get(context).changeIndexPage(3);
                },
                isSelected: selected == 3,
                icon: 'assets/images/bottom_nav/ic_messages.svg',
                width: 20.r,
                height: 20.r,
              ),
              ItemBottomNav(
                onTap: () {
                  MainCubit.get(context).changeIndexPage(4);
                },
                isSelected: selected == 4,
                icon: 'assets/images/bottom_nav/ic_profile.svg',
                width: 16.r,
                height: 20.r,
              ),
            ],
          );
        },
      ),
    );
  }
}
