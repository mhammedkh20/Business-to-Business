import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:b2b_app/core/components/my_contianer_shape.dart';
import 'package:b2b_app/core/components/my_text.dart';
import 'package:b2b_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class UserHomeWidget extends StatelessWidget {
  final bool display;
  const UserHomeWidget({super.key, this.display = true});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MyContainerShape(
          borderRadius: 50,
          width: 40.r,
          height: 40.r,
          bgContainer: display ? AppColors.BASE_COLOR : AppColors.WHITE,
          child: const Icon(
            Icons.person,
            color: AppColors.WHITE,
          ),
        ),
        SizedBox(width: 6.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                MyText(
                  title: AppLocalizations.of(context)!.welcome,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: display ? AppColors.BLACK : AppColors.WHITE,
                ),
                if (display)
                  MyText(
                    fontSize: 16,
                    title: " ${AppLocalizations.of(context)!.icWelcome}",
                  ),
              ],
            ),
            SizedBox(height: 6.h),
            MyText(
              title: "صلاح خطاب",
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: display ? AppColors.GRAY3 : AppColors.WHITE,
            )
          ],
        ),
      ],
    );
  }
}
