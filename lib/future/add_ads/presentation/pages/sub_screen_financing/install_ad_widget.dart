import 'package:b2b_app/core/components/custom_dropdown_menu2.dart';
import 'package:b2b_app/core/components/my_contianer_shape.dart';
import 'package:b2b_app/core/components/my_text_field.dart';
import 'package:b2b_app/core/components/my_toggle_button.dart';
import 'package:b2b_app/core/utils/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:b2b_app/core/components/my_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class InstallAdWidget extends StatelessWidget {
  const InstallAdWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        const MyText(title: 'وجه الإعلان جغرافيا'),
        SizedBox(height: 12.h),
        CustomDropdownMenu2<String>(
          enabledBorder: true,
          background: AppColors.WHITE,
          borderRaduis: 4,
          hintFontSize: 12,
          hint: 'يرجى اختيار االدول/ المدن المراد تمويل اليها الاعلان',
          listItems: const [
            'سيارات',
            'طائرات',
          ],
          onChanged: <String>(String s) {},
        ),
        SizedBox(height: 16.h),
        const MyText(title: 'وجه الإعلان جغرافيا'),
        SizedBox(height: 12.h),
        const MyToggleButton(
          title: null,
          background: AppColors.WHITE,
          isBorder: true,
          tapWidth: 120,
          fontSize: 12,
          values: ['الصفحة الرئيسية', 'الباب الرئيسية', 'نتائج البحث'],
        ),
        SizedBox(height: 16.h),
        const MyText(title: 'مدة الإعلان'),
        SizedBox(height: 12.h),
        const MyToggleButton(
          title: null,
          background: AppColors.WHITE,
          isBorder: true,
          tapWidth: 120,
          fontSize: 12,
          values: ['باليوم', 'بالساعة'],
        ),
        SizedBox(height: 16.h),
        const MyText(title: 'عدد ساعات الإعلان'),
        SizedBox(height: 12.h),
        MyTextField(
          textHint: 'يرجى ادخال عدد الساعات لعرض الإعلان',
          filledColor: true,
          fillColor2: AppColors.WHITE,
          isBorder: true,
        ),
        SizedBox(height: 20.h),
        MyContainerShape(
          borderRadius: 4,
          bgContainer: AppColors.WHITE4,
          paddingHorizontal: 22,
          paddingVertical: 18,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                'assets/images/ic_pay.svg',
                width: 30.r,
                height: 30.r,
              ),
              SizedBox(width: 8.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const MyText(title: 'تكلفة الإعلان'),
                    SizedBox(height: 20.h),
                    Row(
                      children: [
                        const MyText(
                          title: '155.00',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(width: 6.w),
                        const MyText(
                          title: 'ريال سعودي',
                          fontSize: 12,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 12.h),
        Row(
          children: [
            SvgPicture.asset(
              'assets/images/ic_waring.svg',
              width: 20.r,
              color: AppColors.GRAY,
            ),
            SizedBox(width: 6.w),
            const MyText(
              title: 'تختلف تكلفة الإعلان حسب التفاصيل المدخلة',
              color: AppColors.GRAY,
            )
          ],
        )
      ],
    );
  }
}
