import 'package:b2b_app/core/components/my_contianer_shape.dart';
import 'package:b2b_app/core/components/my_text.dart';
import 'package:b2b_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyToggleButton extends StatefulWidget {
  final String? title;
  final List<String> values;
  final Color background;
  final bool isBorder;
  final double tapWidth;
  final double fontSize;

  const MyToggleButton({
    super.key,
    required this.title,
    required this.values,
    this.fontSize = 14,
    this.tapWidth = 100,
    this.background = AppColors.WHITE4,
    this.isBorder = false,
  });

  @override
  State<MyToggleButton> createState() => _MyToggleButtonState();
}

class _MyToggleButtonState extends State<MyToggleButton> {
  int indexSelected = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (widget.title != null)
          MyText(
            title: widget.title!,
            maxLines: 1,
            textOverflow: true,
          ),
        Flexible(
          child: MyContainerShape(
            width: widget.tapWidth.w * widget.values.length,
            paddingHorizontal: 5,
            paddingVertical: 5,
            borderRadius: 4,
            bgContainer: widget.background,
            enableBorder: widget.isBorder,
            height: 55.h,
            child: ListView.builder(
              itemCount: widget.values.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      indexSelected = index;
                    });
                  },
                  child: MyContainerShape(
                    width: (widget.tapWidth - 5).w,
                    height: double.infinity,
                    bgContainer: indexSelected == index
                        ? AppColors.GRAY3
                        : AppColors.TRANSPARENT,
                    borderRadius: 4,
                    child: MyText(
                      fontSize: widget.fontSize,
                      title: widget.values[index],
                      fontWeight: indexSelected == index
                          ? FontWeight.w400
                          : FontWeight.w300,
                      color: indexSelected == index
                          ? AppColors.WHITE
                          : AppColors.GRAY3,
                    ),
                  ),
                );
              },
            ),
          ),
        )
      ],
    );
  }
}
