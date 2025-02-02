import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:b2b_app/core/utils/app_colors.dart';

class MyDivider extends StatelessWidget {
  final double padding;
  const MyDivider({
    super.key,
    this.padding = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding.w),
      child: Divider(
        height: 1.h,
        thickness: 1,
        color: AppColors.GRAY.withOpacity(.2),
      ),
    );
  }
}
