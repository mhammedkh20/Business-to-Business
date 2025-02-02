import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:b2b_app/core/components/my_contianer_shape.dart';
import 'package:b2b_app/core/components/my_text.dart';
import 'package:b2b_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HeaderProfileWidget extends StatelessWidget {
  const HeaderProfileWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MyContainerShape(
      bottomEndRaduis: 50,
      bottomStartRaduis: 50,
      bgContainer: AppColors.WHITE6,
      paddingVertical: 24.h,
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).padding.top + 24.h),
          MyContainerShape(
            height: 80.r,
            width: 80.r,
            borderRadius: 80,
            bgContainer: AppColors.BASE_COLOR,
            child: const Icon(
              Icons.person,
              color: AppColors.WHITE,
              size: 40,
            ),
          ),
          SizedBox(height: 12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyText(title: 'محمد السيقلي'),
              SizedBox(width: 3.w),
              MyText(
                title: '(مطور فلاتر)',
                fontSize: 12,
                color: AppColors.GRAY3,
              ),
              SizedBox(width: 5.w),
              SvgPicture.asset(
                'assets/images/ic_verify.svg',
                width: 16.r,
              ),
            ],
          ),
          SizedBox(height: 20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  MyText(
                    title: '273',
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(width: 6.w),
                  MyText(
                    title: AppLocalizations.of(context)!.followers,
                    fontWeight: FontWeight.w300,
                    color: AppColors.GRAY3,
                  ),
                ],
              ),
              SizedBox(width: 32.w),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  MyText(
                    title: '357',
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(width: 6.w),
                  MyText(
                    title: AppLocalizations.of(context)!.follows,
                    fontWeight: FontWeight.w300,
                    color: AppColors.GRAY3,
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
