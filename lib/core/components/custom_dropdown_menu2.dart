import 'package:b2b_app/core/components/my_contianer_shape.dart';
import 'package:b2b_app/core/components/my_text.dart';
import 'package:b2b_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDropdownMenu2<T> extends StatefulWidget {
  final List<T> listItems;
  final double? width;
  final double? height;
  final bool enabledBorder;
  final AlignmentDirectional alignment;
  final double paddingHorizontal;
  final Color textColor;
  final Color background;
  final bool isDense;
  final Widget? iconDropdown;
  final bool isExpanded;
  final bool textDirectionLTR;
  final bool notify;
  final T? initValue;
  final void Function<T>(T) onChanged;
  final String? hint;
  final Color? hintColor;
  final double? hintFontSize;
  final FontWeight? hintFontWight;
  final double borderRaduis;

  const CustomDropdownMenu2({
    super.key,
    required this.listItems,
    required this.onChanged,
    this.enabledBorder = true,
    this.isDense = false,
    this.alignment = AlignmentDirectional.centerStart,
    this.width,
    this.height,
    this.paddingHorizontal = 16,
    this.textColor = AppColors.BLACK,
    this.iconDropdown,
    this.isExpanded = true,
    this.textDirectionLTR = false,
    this.notify = false,
    this.initValue,
    this.background = AppColors.WHITE4,
    this.hint,
    this.hintColor = AppColors.GRAY3,
    this.hintFontSize = 14,
    this.hintFontWight = FontWeight.w300,
    this.borderRaduis = 4,
  });

  @override
  State<CustomDropdownMenu2> createState() => _CustomDropdownMenu2State<T>();
}

class _CustomDropdownMenu2State<T> extends State<CustomDropdownMenu2> {
  T? initValue;
  @override
  void initState() {
    // initValue = widget.listItems[0];
    if (widget.notify) {
      initValue =
          widget.initValue == '' ? widget.listItems[0] : widget.initValue;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: widget.background,
      borderRadius: BorderRadius.circular(widget.borderRaduis.r),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(widget.borderRaduis.r),
        child: MyContainerShape(
          width: widget.width,
          height: widget.height,
          alignment: widget.alignment,
          enableRadius: true,
          enableBorder: widget.enabledBorder,
          enableShadow: false,
          bgContainer: AppColors.TRANSPARENT,
          borderRadius: widget.borderRaduis.r,
          topEndRaduis: 10.r,
          topStartRaduis: 10.r,
          bottomEndRaduis: 10.r,
          bottomStartRaduis: 10.r,
          widthBorder: 1,
          child: DropdownButton<T>(
            borderRadius: BorderRadius.circular(10.r),
            alignment: widget.alignment,
            underline: const SizedBox(),
            hint: widget.hint != null
                ? Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: widget.paddingHorizontal.w),
                    child: MyText(
                      title: widget.hint!,
                      fontSize: widget.hintFontSize!,
                      fontWeight: widget.hintFontWight!,
                      color: widget.hintColor!,
                    ),
                  )
                : null,
            isExpanded: widget.isExpanded,
            value: initValue,
            isDense: widget.isDense,
            icon: setIcon(),
            dropdownColor: AppColors.WHITE,
            items: widget.listItems.map((items) {
              return DropdownMenuItem<T>(
                value: (items as T),
                alignment: widget.alignment,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: widget.paddingHorizontal.w,
                  ),
                  child: widget.textDirectionLTR
                      ? Directionality(
                          textDirection: TextDirection.ltr,
                          child: MyText(
                            textAlign: TextAlign.center,
                            title: items.toString(),
                            fontSize: 14,
                            color: widget.textColor,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      : MyText(
                          textAlign: TextAlign.center,
                          title: items.toString(),
                          fontSize: 14,
                          color: widget.textColor,
                          fontWeight: FontWeight.w500,
                        ),
                ),
              );
            }).toList(),
            onChanged: (T? s) {
              if (s != null) {
                initValue = s;
                widget.onChanged(s);

                setState(() {});
              }
            },
          ),
        ),
      ),
    );
  }

  Widget setIcon() {
    if (widget.iconDropdown != null) {
      return widget.iconDropdown!;
    }
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: widget.paddingHorizontal.w,
      ),
      child: SvgPicture.asset(
        'assets/images/ic_arrow_down2.svg',
        width: 24.r,
        height: 24.r,
      ),
    );
  }
}
