import 'package:b2b_app/core/components/my_contianer_shape.dart';
import 'package:b2b_app/core/components/my_text.dart';
import 'package:b2b_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomCard extends StatelessWidget {
  final String icon;
  final String title;
  final String desc;
  final bool backgroundBaseColor;
  const CustomCard({
    super.key,
    required this.desc,
    required this.icon,
    required this.title,
    required this.backgroundBaseColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 206.h,
      child: Stack(
        children: [
          PositionedDirectional(
            top: 70.r / 2,
            bottom: 0,
            start: 0,
            end: 0,
            child: MyContainerShape(
              bgContainer:
                  backgroundBaseColor ? AppColors.BASE_COLOR : AppColors.WHITE,
              blur: 50,
              paddingHorizontal: 16,
              enableShadow: true,
              shadow: Color(0xff0074D9).withOpacity(.09),
              child: Column(
                children: [
                  SizedBox(height: 14.h + 35.h),
                  MyText(
                    title: title,
                    color:
                        backgroundBaseColor ? AppColors.WHITE : AppColors.BLACK,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(height: 20.h),
                  MyText(
                    title: desc,
                    fontSize: 12,
                    textAlign: TextAlign.center,
                    height: 1.6,
                    color:
                        backgroundBaseColor ? AppColors.WHITE : AppColors.BLACK,
                  ),
                ],
              ),
            ),
          ),
          PositionedDirectional(
            top: 0,
            end: 0,
            start: 0,
            child: SvgPicture.asset(
              icon,
              width: 70.r,
              height: 70.r,
            ),
          ),
        ],
      ),
    );
  }
}
