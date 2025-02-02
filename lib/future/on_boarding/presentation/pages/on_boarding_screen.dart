import 'package:b2b_app/core/components/my_contianer_shape.dart';
import 'package:b2b_app/core/components/my_elevated_button.dart';
import 'package:b2b_app/core/utils/app_colors.dart';
import 'package:b2b_app/core/utils/app_helpers.dart';
import 'package:b2b_app/future/auth/presentation/pages/login_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:b2b_app/core/components/my_text.dart';
import 'package:b2b_app/future/on_boarding/presentation/widgets/gallery_photos.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          children: [
            SizedBox(height: 55.h),
            const GalleryPhotos(),
            SizedBox(height: 50.h),
            Padding(
              padding: EdgeInsetsDirectional.only(end: 70.w),
              child: MyText(
                title: AppLocalizations.of(context)!.descOnBoarding,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.h),
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: MyContainerShape(
                borderRadius: 4,
                bgContainer: AppColors.BASE_COLOR,
                height: 4.h,
                width: 52.w,
              ),
            ),
            SizedBox(height: 24.h),
            MyText(
              title: AppLocalizations.of(context)!.descOnBoarding2,
              color: AppColors.GRAY3,
              fontWeight: FontWeight.w300,
            ),
            SizedBox(height: 30.h),
            Row(
              children: [
                Expanded(
                  child: MyElevatedButton(
                    title: AppLocalizations.of(context)!.signIn,
                    onPressed: () {
                      AppHelpers.navigationToPageAndExitAll(
                          context, LoginScreen());
                    },
                  ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: MyElevatedButton(
                    title: AppLocalizations.of(context)!.signInAsVisitor,
                    onPressed: () {},
                    background: AppColors.TRANSPARENT,
                    borderColor: AppColors.BASE_COLOR,
                    titleColor: AppColors.BASE_COLOR,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
