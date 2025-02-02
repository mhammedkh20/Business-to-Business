import 'package:b2b_app/core/components/custom_dropdown_menu2.dart';
import 'package:b2b_app/core/utils/app_colors.dart';
import 'package:b2b_app/future/add_ads/presentation/widgets/select_time.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:b2b_app/core/components/my_text.dart';
import 'package:flutter/material.dart';

class CommunicationTimesWidget extends StatelessWidget {
  const CommunicationTimesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Expanded(
              flex: 1,
              child: MyText(
                title: 'اليوم',
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
                hint: 'اختيار اليوم',
                listItems: const [
                  'السبت',
                  'الاحد',
                  'الاتنين',
                  'الثلاثاء',
                  'الاربعاء',
                  'الخميس',
                ],
                onChanged: <String>(String s) {},
              ),
            )
          ],
        ),
        SizedBox(height: 16.h),
        const SelectTime(title: 'من الساعة'),
        SizedBox(height: 16.h),
        const SelectTime(title: 'الى الساعة'),
      ],
    );
  }
}
