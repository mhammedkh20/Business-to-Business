import 'package:b2b_app/core/components/my_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:b2b_app/core/components/my_contianer_shape.dart';
import 'package:b2b_app/core/utils/app_colors.dart';
import 'package:b2b_app/future/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyTapTypeNews extends StatelessWidget {
  const MyTapTypeNews({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MyContainerShape(
      width: 170.w,
      height: 45.h,
      paddingHorizontal: 5,
      paddingVertical: 5,
      borderRadius: 50,
      bgContainer: AppColors.WHITE4,
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          int indexSelected = HomeCubit.get(context).typeNews;
          return Stack(
            children: [
              AnimatedPositionedDirectional(
                start: indexSelected == 0 ? (170 / 2 - 10).w : 0,
                top: 0,
                bottom: 0,
                duration: const Duration(milliseconds: 500),
                child: MyContainerShape(
                  width: (170 / 2).w,
                  bgContainer: AppColors.GRAY3,
                  borderRadius: 40,
                ),
              ),
              item(
                isSelected: indexSelected == 0,
                title: AppLocalizations.of(context)!.public,
                onTap: () {
                  HomeCubit.get(context).changeTypeNews(0);
                  HomeCubit.get(context).getNews();
                },
                start: false,
              ),
              item(
                isSelected: indexSelected == 1,
                title: AppLocalizations.of(context)!.followUp,
                onTap: () {
                  HomeCubit.get(context).changeTypeNews(1);
                  HomeCubit.get(context).getNews();
                },
                start: true,
              )
            ],
          );
        },
      ),
    );
  }

  Widget item({
    required String title,
    required bool isSelected,
    required Function() onTap,
    bool start = true,
  }) {
    return PositionedDirectional(
      start: start ? 0 : null,
      end: start ? null : 0,
      top: 0,
      bottom: 0,
      child: Material(
        borderRadius: BorderRadius.circular(30),
        color: AppColors.TRANSPARENT,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(30),
          child: MyContainerShape(
            borderRadius: 30,
            bgContainer: AppColors.TRANSPARENT,
            width: (170 / 2).w,
            child: MyText(
              title: title,
              fontWeight: FontWeight.w300,
              textAlign: TextAlign.center,
              color: isSelected ? AppColors.WHITE : AppColors.GRAY3,
            ),
          ),
        ),
      ),
    );
  }
}
