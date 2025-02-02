import 'package:b2b_app/core/components/my_contianer_shape.dart';
import 'package:b2b_app/core/utils/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GalleryPhotos extends StatelessWidget {
  final bool withLogo;

  const GalleryPhotos({super.key, this.withLogo = true});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: withLogo ? 400.h : 247,
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              children: [
                if (withLogo) ...[
                  SvgPicture.asset(
                    'assets/images/app_icon/ic_app.svg',
                    color: AppColors.BASE_COLOR,
                    width: 85.r,
                  ),
                  SizedBox(height: 18.h),
                ],
                MyContainerShape(
                  borderRadius: 10,
                  child: Image.asset(
                    'assets/images/im_onboarding3.png',
                    fit: BoxFit.cover,
                    height: 101.h,
                    width: double.infinity,
                  ),
                ),
                SizedBox(height: 12.h),
                Expanded(
                  child: MyContainerShape(
                    borderRadius: 10,
                    child: Image.asset(
                      'assets/images/im_onboarding4.png',
                      fit: BoxFit.cover,
                      height: double.infinity,
                      width: double.infinity,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: MyContainerShape(
                    borderRadius: 10,
                    child: Image.asset(
                      'assets/images/im_onboarding1.png',
                      fit: BoxFit.cover,
                      height: double.infinity,
                      width: double.infinity,
                    ),
                  ),
                ),
                SizedBox(height: 12.h),
                Expanded(
                  child: MyContainerShape(
                    borderRadius: 10,
                    child: Image.asset(
                      'assets/images/im_onboarding2.png',
                      fit: BoxFit.cover,
                      height: double.infinity,
                      width: double.infinity,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
