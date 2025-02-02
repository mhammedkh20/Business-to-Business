import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:b2b_app/core/components/my_text.dart';
import 'package:b2b_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ItemInform extends StatelessWidget {
  final Function() onTap;
  final String? icon;
  final String? iconTrealing;
  final String title;

  const ItemInform({
    super.key,
    this.icon,
    this.iconTrealing,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(6.r),
      child: Column(
        children: [
          SizedBox(height: 20.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: Row(
              children: [
                if (icon != null) ...[
                  SvgPicture.asset(
                    icon!,
                    width: 16.r,
                    height: 16.r,
                  ),
                  SizedBox(width: 14.w),
                ],
                Expanded(
                  child: MyText(
                    title: title,
                    fontSize: 14,
                  ),
                ),
                if (iconTrealing != null)
                  SvgPicture.asset(iconTrealing!)
                else
                  SvgPicture.asset(
                    'assets/images/ic_back.svg',
                  ),
              ],
            ),
          ),
          SizedBox(height: 20.h),
          const Divider(
            height: 1,
            thickness: 1,
            color: AppColors.DIVIDER_COLOR,
          )
        ],
      ),
    );
  }
}
