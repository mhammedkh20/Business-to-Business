import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:b2b_app/core/components/my_contianer_shape.dart';
import 'package:b2b_app/core/components/my_divider.dart';
import 'package:b2b_app/core/components/my_text.dart';
import 'package:b2b_app/core/utils/app_colors.dart';
import 'package:b2b_app/future/home/presentation/widgets/home/post_widget.dart';
import 'package:b2b_app/future/search/presentation/manager/cubit/filter_search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class MyBodySearch extends StatelessWidget {
  const MyBodySearch({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterSearchCubit, FilterSearchState>(
      builder: (context, state) {
        int indexType = FilterSearchCubit.get(context).indexTapSearch;
        if (indexType == 0 || indexType == 1) {
          return Expanded(
            child: ListView.separated(
              itemCount: 20,
              padding: EdgeInsets.symmetric(vertical: 13.h),
              itemBuilder: (context, index) {
                return const PostWidget();
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
        } else {
          return Expanded(
            child: ListView.builder(
              itemCount: 20,
              padding: EdgeInsets.symmetric(horizontal: 16.h),
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    SizedBox(height: 13.h),
                    Row(
                      children: [
                        MyContainerShape(
                          height: 50.r,
                          width: 50.r,
                          bgContainer: AppColors.BASE_COLOR,
                          borderRadius: 50,
                          child: const Icon(
                            Icons.person,
                            color: AppColors.WHITE,
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  MyText(
                                    title: 'Mlak Company',
                                    fontWeight: FontWeight.bold,
                                  ),
                                  SizedBox(width: 10.w),
                                  SvgPicture.asset(
                                    'assets/images/ic_verify.svg',
                                  ),
                                ],
                              ),
                              SizedBox(height: 5.h),
                              MyText(
                                title: 'متابع لاحدث اصدارات السيارات الحديثة ',
                                fontSize: 12,
                                color: AppColors.GRAY3,
                                fontWeight: FontWeight.w300,
                              ),
                            ],
                          ),
                        ),
                        Material(
                          borderRadius: BorderRadius.circular(30),
                          color: AppColors.BLACK,
                          child: InkWell(
                            onTap: () {},
                            borderRadius: BorderRadius.circular(30),
                            child: MyContainerShape(
                              paddingHorizontal: 18,
                              paddingVertical: 8,
                              bgContainer: AppColors.TRANSPARENT,
                              child: MyText(
                                color: AppColors.WHITE,
                                title: AppLocalizations.of(context)!.followUp,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 13.h),
                  ],
                );
              },
            ),
          );
        }
      },
    );
  }
}
