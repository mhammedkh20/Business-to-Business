import 'package:b2b_app/core/components/my_contianer_shape.dart';
import 'package:b2b_app/core/components/my_text.dart';
import 'package:b2b_app/core/utils/app_bottom_sheet.dart';
import 'package:b2b_app/core/utils/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ItemProductWidget extends StatelessWidget {
  const ItemProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MyContainerShape(
      bgContainer: AppColors.WHITE5,
      borderRadius: 8,
      child: Column(
        children: [
          SizedBox(
            height: 155.h,
            child: Stack(
              children: [
                Image.asset(
                  'assets/images/im_test.png',
                  height: 155.h,
                  fit: BoxFit.cover,
                ),
                Align(
                  alignment: AlignmentDirectional.topEnd,
                  child: IconButton(
                    onPressed: () {
                      AppBottomSheet.actionForProductBottomSheet(context);
                    },
                    icon: const Icon(
                      Icons.more_horiz,
                      color: AppColors.WHITE,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Column(
                children: [
                  SizedBox(height: 12.h),
                  MyText(
                    title: 'سيارة رغوة الذاكرة مسند الذراع وسادة..',
                    fontSize: 12,
                    maxLines: 2,
                    textOverflow: true,
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/images/ic_quantity.svg',
                        width: 14.r,
                        height: 14.r,
                      ),
                      SizedBox(width: 4.w),
                      MyText(
                        title: 'الكمية المعروضة : ',
                        fontSize: 12,
                        color: AppColors.GRAY3,
                      ),
                      MyText(
                        title: '55',
                        fontSize: 12,
                      ),
                    ],
                  ),
                  Expanded(
                    child: Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: MyText(
                        title: '150.00 ر.س',
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
