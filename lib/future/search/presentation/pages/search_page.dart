import 'package:b2b_app/core/components/custom_dropdown_menu2.dart';
import 'package:b2b_app/core/components/my_elevated_button.dart';
import 'package:b2b_app/core/components/my_text.dart';
import 'package:b2b_app/core/components/my_text_field.dart';
import 'package:b2b_app/core/components/my_toggle_button.dart';
import 'package:b2b_app/core/utils/app_colors.dart';
import 'package:b2b_app/core/utils/app_helpers.dart';
import 'package:b2b_app/future/search/presentation/pages/search_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        children: [
          SizedBox(height: 15.h),
          MyTextField(
            textHint: AppLocalizations.of(context)!.search,
            readOnly: true,
            onTap: () {
              AppHelpers.navigationToPage(
                  context, const SearchAndFilterScreen());
            },
            borderRadius: 40,
            fillColor2: AppColors.WHITE6,
            colorBorder: AppColors.TRANSPARENT,
            hintColor: AppColors.GRAY3,
            borderSide: AppColors.TRANSPARENT,
            fontSize: 14,
            prefixIcon: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(width: 16.w),
                SvgPicture.asset(
                  'assets/images/ic_search2.svg',
                  width: 20.r,
                ),
                SizedBox(width: 16.w),
              ],
            ),
          ),
          SizedBox(height: 50.h),
          Row(
            children: [
              SvgPicture.asset(
                'assets/images/ic_filter.svg',
                width: 18.r,
              ),
              SizedBox(width: 14.w),
              MyText(
                fontSize: 16,
                title: AppLocalizations.of(context)!.searchFiltering,
              ),
            ],
          ),
          SizedBox(height: 14.h),
          CustomDropdownMenu2<String>(
            enabledBorder: false,
            hint: 'اختيار التصنيف',
            listItems: const [
              'سيارات',
              'طائرات',
            ],
            onChanged: <String>(String s) {},
          ),
          SizedBox(height: 14.h),
          CustomDropdownMenu2<String>(
            enabledBorder: false,
            hint: 'نوع المركبة',
            listItems: const [
              'BMW',
              'Bugatti Chiron',
              'Koenigsegg Jesko',
              'Ferrari LaFerrari',
              'Lamborghini Aventador SVJ',
              'McLaren Senna',
              'Porsche 911 GT2 RS',
            ],
            onChanged: <String>(String s) {},
          ),
          SizedBox(height: 14.h),
          const MyToggleButton(
            title: 'نوع العرض',
            values: [
              'عرض',
              'طلب',
            ],
          ),
          SizedBox(height: 14.h),
          const MyToggleButton(
            title: 'نوع الطلب',
            values: [
              'شراء',
              'ايجار',
            ],
          ),
          SizedBox(height: 14.h),
          CustomDropdownMenu2<String>(
            enabledBorder: false,
            hint: 'حالة المركبة',
            listItems: const [
              'ممتازة',
              'متوسطة',
              'سيئة',
            ],
            onChanged: <String>(String s) {},
          ),
          SizedBox(height: 14.h),
          CustomDropdownMenu2<String>(
            enabledBorder: false,
            hint: 'طريقة الدفع',
            listItems: const [
              'بوابة الدفع',
              'تحويل بنكي',
              'دفع يدوي',
            ],
            onChanged: <String>(String s) {},
          ),
          SizedBox(height: 14.h),
          CustomDropdownMenu2<String>(
            enabledBorder: false,
            hint: 'طريقة الدفع',
            listItems: const [
              'بوابة الدفع',
              'تحويل بنكي',
              'دفع يدوي',
            ],
            onChanged: <String>(String s) {},
          ),
          SizedBox(height: 14.h),
          CustomDropdownMenu2<String>(
            enabledBorder: false,
            hint: 'طريقة الدفع',
            listItems: const [
              'بوابة الدفع',
              'تحويل بنكي',
              'دفع يدوي',
            ],
            onChanged: <String>(String s) {},
          ),
          SizedBox(height: 14.h),
          CustomDropdownMenu2<String>(
            enabledBorder: false,
            hint: 'طريقة الدفع',
            listItems: const [
              'بوابة الدفع',
              'تحويل بنكي',
              'دفع يدوي',
            ],
            onChanged: <String>(String s) {},
          ),
          SizedBox(height: 14.h),
          CustomDropdownMenu2<String>(
            enabledBorder: false,
            hint: 'طريقة الدفع',
            listItems: const [
              'بوابة الدفع',
              'تحويل بنكي',
              'دفع يدوي',
            ],
            onChanged: <String>(String s) {},
          ),
          SizedBox(height: 14.h),
          CustomDropdownMenu2<String>(
            enabledBorder: false,
            hint: 'طريقة الدفع',
            listItems: const [
              'بوابة الدفع',
              'تحويل بنكي',
              'دفع يدوي',
            ],
            onChanged: <String>(String s) {},
          ),
          SizedBox(height: 32.h),
          MyElevatedButton(
            title: AppLocalizations.of(context)!.search2,
            onPressed: () {},
          ),
          SizedBox(height: 32.h),
        ],
      ),
    );
  }
}
