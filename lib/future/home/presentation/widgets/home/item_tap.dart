import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:b2b_app/core/components/my_contianer_shape.dart';
import 'package:b2b_app/core/components/my_text.dart';
import 'package:b2b_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class ItemTap extends StatelessWidget {
  const ItemTap({
    super.key,
    required this.onTap,
    required this.isSelected,
    required this.title,
  });

  final Function() onTap;
  final bool isSelected;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Column(
          children: [
            SizedBox(height: 10.h),
            MyText(
              title: title,
              fontSize: 14,
              fontWeight: isSelected ? FontWeight.w400 : FontWeight.w300,
              color: isSelected ? AppColors.BLACK : AppColors.GRAY3,
            ),
            SizedBox(height: 10.h),
            AnimatedSize(
              duration: const Duration(milliseconds: 300),
              child: MyContainerShape(
                height: 4.h,
                width: 33.w,
                borderRadius: 4,
                bgContainer:
                    isSelected ? AppColors.BASE_COLOR : AppColors.TRANSPARENT,
              ),
            ),
            const Divider(
              height: 1,
              color: AppColors.WHITE6,
              thickness: 2,
            ),
          ],
        ),
      ),
    );
  }
}
