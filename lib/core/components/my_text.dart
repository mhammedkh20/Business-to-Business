// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:b2b_app/core/utils/app_colors.dart';

class MyText extends StatelessWidget {
  final String title;
  final Color? color;
  final double fontSize;
  final double height;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final bool lineThrough;
  final bool typeLineThrough;
  final bool textOverflow;
  final int? maxLines;

  const MyText({
    Key? key,
    required this.title,
    this.color = AppColors.BLACK,
    this.fontSize = 14,
    this.height = 1.3,
    this.fontWeight = FontWeight.w400,
    this.textAlign = TextAlign.start,
    this.lineThrough = false,
    this.textOverflow = false,
    this.typeLineThrough = false,
    this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      overflow: textOverflow ? TextOverflow.ellipsis : null,
      maxLines: maxLines,
      style: TextStyle(
        fontFamily: 'Montserrat',
        color: color,
        fontSize: fontSize.sp,
        fontWeight: fontWeight,
        height: height,
        decorationThickness: 1,
        decoration: lineThrough
            ? typeLineThrough
                ? TextDecoration.lineThrough
                : TextDecoration.underline
            : null,
      ),
    );
  }
}
