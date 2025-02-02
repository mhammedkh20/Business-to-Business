import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:b2b_app/core/components/my_contianer_shape.dart';
import 'package:b2b_app/core/components/my_text.dart';
import 'package:b2b_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ItemSettings extends StatelessWidget {
  final Function()? onTap;
  final String title;
  final String icon;

  const ItemSettings({
    super.key,
    required this.onTap,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: MyContainerShape(
        paddingHorizontal: 20,
        paddingVertical: 22,
        bgContainer: AppColors.TRANSPARENT,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset(icon),
            SizedBox(width: 12.w),
            Expanded(
              child: MyText(
                title: title,
                fontSize: 12,
                color: AppColors.GRAY3,
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 15.r,
            ),
          ],
        ),
      ),
    );
  }
}
