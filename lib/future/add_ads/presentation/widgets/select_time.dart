import 'package:b2b_app/core/components/my_contianer_shape.dart';
import 'package:b2b_app/core/utils/app_colors.dart';
import 'package:b2b_app/core/utils/app_helpers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:b2b_app/core/components/my_text.dart';
import 'package:flutter/material.dart';

class SelectTime extends StatefulWidget {
  final String title;
  const SelectTime({super.key, required this.title});

  @override
  State<SelectTime> createState() => _SelectTimeState();
}

class _SelectTimeState extends State<SelectTime> {
  String? time;
  bool is24 = true;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: MyText(
            title: widget.title,
            maxLines: 1,
            textOverflow: true,
          ),
        ),
        SizedBox(width: 30.w),
        Flexible(
          flex: 3,
          child: MyContainerShape(
            height: 45.h,
            enableBorder: true,
            borderRadius: 7,
            paddingHorizontal: 5,
            paddingVertical: 5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () async {
                    time = await AppHelpers.selectTime(context);
                    setState(() {});
                  },
                  child: MyContainerShape(
                    paddingHorizontal: 8.w,
                    paddingVertical: 4,
                    borderRadius: 7,
                    height: double.infinity,
                    bgContainer: AppColors.WHITE5,
                    child: MyText(
                      title: time ?? "00:00",
                      fontSize: 16,
                    ),
                  ),
                ),
                MyContainerShape(
                  paddingHorizontal: 2,
                  borderRadius: 7,
                  paddingVertical: 2,
                  height: double.infinity,
                  bgContainer: AppColors.WHITE5,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            is24 = true;
                          });
                        },
                        child: MyContainerShape(
                          width: 45.r,
                          borderRadius: 7,
                          bgContainer:
                              is24 ? AppColors.WHITE : AppColors.TRANSPARENT,
                          child: const MyText(
                            title: 'PM',
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            is24 = false;
                          });
                        },
                        child: MyContainerShape(
                          width: 45.r,
                          borderRadius: 7,
                          bgContainer:
                              !is24 ? AppColors.WHITE : AppColors.TRANSPARENT,
                          child: const MyText(
                            title: 'AM',
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
