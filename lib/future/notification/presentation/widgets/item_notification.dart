import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:b2b_app/core/components/my_contianer_shape.dart';
import 'package:b2b_app/core/components/my_text.dart';
import 'package:b2b_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class ItemNotification extends StatelessWidget {
  const ItemNotification({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MyContainerShape(
      paddingHorizontal: 16.r,
      paddingVertical: 16.r,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyContainerShape(
            height: 35.r,
            width: 35.r,
            borderRadius: 50,
            bgContainer: AppColors.BASE_COLOR,
            child: const Icon(Icons.person, color: AppColors.WHITE),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText(
                      title: 'محمد بن عبد الله',
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                    MyText(
                      title: 'قبل 3 ساعات',
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                      color: AppColors.GRAY3,
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                MyText(
                  title:
                      'قام بارسال رسالة: اهلا بك استاذ صلاح ، يرجى التواصل ..',
                  fontSize: 12,
                  textAlign: TextAlign.start,
                  fontWeight: FontWeight.w300,
                  color: AppColors.GRAY3,
                  maxLines: 1,
                  textOverflow: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
