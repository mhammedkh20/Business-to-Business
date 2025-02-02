import 'package:b2b_app/core/components/my_contianer_shape.dart';
import 'package:b2b_app/core/utils/app_colors.dart';
import 'package:b2b_app/future/add_ads/presentation/manager/add_ads_cubit/add_ads_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class IconsAddAndRemoveFormSelectDateTime extends StatelessWidget {
  const IconsAddAndRemoveFormSelectDateTime({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        BlocBuilder<AddAdsCubit, AddAdsState>(
          builder: (context, state) {
            return AddAdsCubit.get(context).formCount == 0
                ? const SizedBox()
                : Row(
                    children: [
                      Material(
                        color: AppColors.WHITE5,
                        borderRadius: BorderRadius.circular(8.r),
                        child: InkWell(
                          onTap: () {
                            AddAdsCubit.get(context).changeFormCount(
                                AddAdsCubit.get(context).formCount - 1);
                          },
                          borderRadius: BorderRadius.circular(8.r),
                          child: MyContainerShape(
                            height: 55.r,
                            width: 55.r,
                            bgContainer: AppColors.TRANSPARENT,
                            borderRadius: 8,
                            child: const Icon(
                              Icons.delete_forever_outlined,
                              color: AppColors.RED,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 16.w),
                    ],
                  );
          },
        ),
        Material(
          color: AppColors.WHITE5,
          borderRadius: BorderRadius.circular(8.r),
          child: InkWell(
            onTap: () {
              AddAdsCubit.get(context)
                  .changeFormCount(AddAdsCubit.get(context).formCount + 1);
            },
            borderRadius: BorderRadius.circular(8.r),
            child: MyContainerShape(
              height: 55.r,
              width: 55.r,
              bgContainer: AppColors.TRANSPARENT,
              borderRadius: 8,
              child: SvgPicture.asset(
                'assets/images/ic_add3.svg',
                width: 24.r,
                height: 24.r,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
