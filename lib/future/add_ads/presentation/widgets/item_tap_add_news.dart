import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:b2b_app/core/components/my_contianer_shape.dart';
import 'package:b2b_app/core/components/my_text.dart';
import 'package:b2b_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class ItemTapAddNews extends StatelessWidget {
  const ItemTapAddNews({
    super.key,
    required this.onTap,
    required this.isSelected,
    required this.title,
    required this.index,
    required this.indexSelected,
  });

  final Function() onTap;
  final bool isSelected;
  final String title;
  final int? index;
  final int indexSelected;
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
            SizedBox(
              height: 4.h,
              child: Stack(
                children: [
                  Divider(
                    height: 4.h,
                    color: AppColors.WHITE6,
                    thickness: 4.h,
                  ),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    height: isSelected ? 4.h : 0,
                    child: const MyContainerShape(
                      borderRadius: 0,
                      bgContainer: AppColors.BASE_COLOR,
                    ),
                  ),
                  if (index != null)
                    MyContainerShape(
                      bgContainer: indexSelected > index!
                          ? AppColors.BASE_COLOR.withOpacity(.3)
                          : AppColors.TRANSPARENT,
                    )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
