import 'package:b2b_app/core/components/custom_dropdown_menu2.dart';
import 'package:b2b_app/core/components/my_divider.dart';
import 'package:b2b_app/core/components/my_text.dart';
import 'package:b2b_app/core/components/my_toggle_button.dart';
import 'package:b2b_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsWidget extends StatelessWidget {
  const DetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        Row(
          children: [
            const Expanded(
              flex: 1,
              child: MyText(
                title: 'نوع المركبة',
                maxLines: 1,
                textOverflow: true,
              ),
            ),
            SizedBox(width: 30.w),
            Flexible(
              flex: 3,
              child: CustomDropdownMenu2<String>(
                enabledBorder: true,
                background: AppColors.WHITE,
                borderRaduis: 4,
                hint: 'نوع المركبة',
                listItems: const [
                  'سيارات',
                  'طائرات',
                ],
                onChanged: <String>(String s) {},
              ),
            )
          ],
        ),
        SizedBox(height: 16.h),
        Row(
          children: [
            const Expanded(
              flex: 1,
              child: MyText(
                title: 'حالة المركبة',
                maxLines: 1,
                textOverflow: true,
              ),
            ),
            SizedBox(width: 30.w),
            Flexible(
              flex: 3,
              child: CustomDropdownMenu2<String>(
                enabledBorder: true,
                background: AppColors.WHITE,
                borderRaduis: 4,
                hint: 'حالة المركبة',
                listItems: const [
                  'سيارات',
                  'طائرات',
                ],
                onChanged: <String>(String s) {},
              ),
            )
          ],
        ),
        SizedBox(height: 16.h),
        const MyToggleButton(
          title: 'نوع العرض',
          values: ['عرض', 'طلب'],
          background: AppColors.WHITE,
          isBorder: true,
        ),
        SizedBox(height: 16.h),
        const MyToggleButton(
          title: 'نوع الطلب',
          values: ['ايجار', 'شراء'],
          background: AppColors.WHITE,
          isBorder: true,
        ),
        SizedBox(height: 16.h),
        Row(
          children: [
            const Expanded(
              flex: 1,
              child: MyText(
                title: 'طريقة الدفع',
                maxLines: 1,
                textOverflow: true,
              ),
            ),
            SizedBox(width: 30.w),
            Flexible(
              flex: 3,
              child: CustomDropdownMenu2<String>(
                enabledBorder: true,
                background: AppColors.WHITE,
                borderRaduis: 4,
                hint: 'طريقة الدفع',
                listItems: const [
                  'سيارات',
                  'طائرات',
                ],
                onChanged: <String>(String s) {},
              ),
            )
          ],
        ),
        SizedBox(height: 16.h),
        Row(
          children: [
            const Expanded(
              flex: 1,
              child: MyText(
                title: 'سنة الصنع',
                maxLines: 1,
                textOverflow: true,
              ),
            ),
            SizedBox(width: 30.w),
            Flexible(
              flex: 3,
              child: CustomDropdownMenu2<String>(
                enabledBorder: true,
                background: AppColors.WHITE,
                borderRaduis: 4,
                hint: 'سنة الصنع',
                listItems: const [
                  'سيارات',
                  'طائرات',
                ],
                onChanged: <String>(String s) {},
              ),
            )
          ],
        ),
        SizedBox(height: 24.h),
        const MyDivider(padding: 0),
        SizedBox(height: 24.h),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: const MyText(
                title: 'الماركة',
                maxLines: 1,
                textOverflow: true,
              ),
            ),
            SizedBox(width: 30.w),
            Flexible(
              flex: 3,
              child: CustomDropdownMenu2<String>(
                enabledBorder: true,
                background: AppColors.WHITE,
                borderRaduis: 4,
                hint: 'الماركة',
                listItems: const [
                  'سيارات',
                  'طائرات',
                ],
                onChanged: <String>(String s) {},
              ),
            )
          ],
        ),
      ],
    );
  }
}
