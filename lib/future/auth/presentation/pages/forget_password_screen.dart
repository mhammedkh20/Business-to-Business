import 'package:b2b_app/core/components/my_elevated_button.dart';
import 'package:b2b_app/core/components/my_text_field.dart';
import 'package:b2b_app/core/utils/app_helpers.dart';
import 'package:b2b_app/future/auth/presentation/pages/account_confirmation_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:b2b_app/core/components/my_text.dart';
import 'package:b2b_app/core/utils/app_colors.dart';
import 'package:b2b_app/core/components/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const MyAppBar(
        backgroundColor: AppColors.TRANSPARENT,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        children: [
          SizedBox(height: MediaQuery.of(context).padding.top + 80.h),
          SvgPicture.asset(
            'assets/images/ic_email.svg',
            width: 120.w,
          ),
          SizedBox(height: 50.h),
          MyText(
            title: AppLocalizations.of(context)!.passwordRecovery,
            fontSize: 16,
            textAlign: TextAlign.center,
            fontWeight: FontWeight.w500,
          ),
          SizedBox(height: 8.h),
          MyText(
            title: AppLocalizations.of(context)!.enterEmailSelectSubmit,
            fontSize: 12,
            color: AppColors.BLUE_DARK,
            textAlign: TextAlign.center,
            fontWeight: FontWeight.w300,
          ),
          SizedBox(height: 40.h),
          MyText(
            textAlign: TextAlign.start,
            title: AppLocalizations.of(context)!.email,
            fontSize: 12,
          ),
          SizedBox(height: 14.h),
          MyTextField(
            textHint: AppLocalizations.of(context)!.email,
          ),
          SizedBox(height: 48.h),
          MyElevatedButton(
            title: AppLocalizations.of(context)!.recovery,
            onPressed: () {
              AppHelpers.navigationToPage(
                context,
                AccountConfirmationScreen(byForgetPasswordScreen: true),
              );
            },
          ),
        ],
      ),
    );
  }
}
