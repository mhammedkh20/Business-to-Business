import 'package:b2b_app/core/components/my_divider.dart';
import 'package:b2b_app/core/components/my_elevated_button.dart';
import 'package:b2b_app/core/utils/app_colors.dart';
import 'package:b2b_app/core/utils/app_helpers.dart';
import 'package:b2b_app/future/add_ads/presentation/manager/add_ads_cubit/add_ads_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyBottomNavAddFinancing extends StatelessWidget {
  const MyBottomNavAddFinancing({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 16.h),
        const MyDivider(padding: 0),
        SizedBox(height: 10.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: BlocBuilder<AddAdsCubit, AddAdsState>(
            builder: (context, state) {
              return Row(
                children: [
                  Expanded(
                    child: MyElevatedButton(
                      title: AppLocalizations.of(context)!.cancel,
                      titleColor: AppColors.GRAY3,
                      onPressed: () {
                        AppHelpers.navigationBack(context);
                      },
                      enabledBorder: false,
                      borderColor: AppColors.TRANSPARENT,
                      background: AppColors.WHITE,
                      borderRaduis: 8,
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    flex: 4,
                    child: MyElevatedButton(
                      title: AppLocalizations.of(context)!.advertisingFinancing,
                      onPressed: () {},
                      borderRaduis: 8,
                      background: AppColors.ORANGE,
                      iconColor: AppColors.WHITE,
                      spaceIconWithTitle: 12,
                      iconPath: 'assets/images/ic_ads.svg',
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        SizedBox(height: MediaQuery.of(context).padding.bottom + 10),
      ],
    );
  }
}
