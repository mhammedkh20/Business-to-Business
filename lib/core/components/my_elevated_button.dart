import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:b2b_app/core/components/my_text.dart';
import 'package:b2b_app/core/utils/app_colors.dart';

// ignore: must_be_immutable
class MyElevatedButton extends StatelessWidget {
  String title;
  VoidCallback? onPressed;
  double fontSize;
  Color? titleColor;
  FontWeight fontWeight;
  Color borderColor;
  Color activeColor;
  Color? background;
  double borderWidth;
  double height;
  double width;
  double borderRaduis;
  bool enabledBorder;
  double? elevation;
  String? iconPath;
  bool iconStart;
  Color? iconColor;
  double spaceIconWithTitle;
  MyElevatedButton({
    Key? key,
    required this.title,
    this.onPressed,
    this.fontSize = 14,
    this.titleColor = AppColors.WHITE,
    this.fontWeight = FontWeight.w500,
    this.borderColor = AppColors.TRANSPARENT,
    this.background = AppColors.BASE_COLOR,
    this.activeColor = AppColors.BASE_COLOR,
    this.borderWidth = 1,
    this.height = 55,
    this.borderRaduis = 8,
    this.width = 176,
    this.enabledBorder = true,
    this.elevation,
    this.iconPath,
    this.iconStart = true,
    this.iconColor = AppColors.BLACK,
    this.spaceIconWithTitle = 10,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          minimumSize: MaterialStateProperty.all(Size(width.w, height.h)),
          shadowColor: MaterialStateProperty.resolveWith<Color?>(
            (states) => AppColors.TRANSPARENT,
          ),
          backgroundColor:
              MaterialStateProperty.resolveWith<Color?>((states) => background),
          elevation:
              MaterialStateProperty.resolveWith<double?>((states) => elevation),
          overlayColor: MaterialStateProperty.resolveWith<Color?>(
            (states) => background == AppColors.BASE_COLOR
                ? AppColors.WHITE.withOpacity(.4)
                : AppColors.GRAY.withOpacity(.2),
          ),
          shape: MaterialStateProperty.resolveWith(
            (states) {
              if (states.contains(MaterialState.pressed)) {
                return RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRaduis.r),
                  side: BorderSide(
                    color: activeColor,
                    width: borderWidth,
                  ),
                );
              }
              if (states.contains(MaterialState.hovered)) {
                return RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRaduis.r),
                  side: BorderSide(
                    color: activeColor,
                    width: borderWidth,
                  ),
                );
              }
              return RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRaduis.r),
                side: BorderSide(
                  color: borderColor,
                  width: borderWidth,
                ),
              );
            },
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (iconStart)
              if (iconPath != null) ...[
                SvgPicture.asset(
                  iconPath!,
                  colorFilter: ColorFilter.mode(iconColor!, BlendMode.srcIn),
                ),
                SizedBox(width: spaceIconWithTitle.w),
              ],
            MyText(
              title: title,
              fontSize: fontSize,
              color: titleColor,
              fontWeight: fontWeight,
              textAlign: TextAlign.center,
              height: 0,
            ),
            if (!iconStart)
              if (iconPath != null) ...[
                SizedBox(width: spaceIconWithTitle.w),
                SvgPicture.asset(
                  iconPath!,
                  colorFilter: iconColor != null
                      ? ColorFilter.mode(iconColor!, BlendMode.srcIn)
                      : null,
                ),
              ],
          ],
        ));
  }
}
