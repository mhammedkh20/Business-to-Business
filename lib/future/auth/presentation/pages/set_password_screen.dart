import 'package:b2b_app/core/components/my_app_bar.dart';
import 'package:b2b_app/core/components/my_elevated_button.dart';
import 'package:b2b_app/core/components/my_text.dart';
import 'package:b2b_app/core/components/my_text_field.dart';
import 'package:b2b_app/core/utils/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class SetPasswordScreen extends StatelessWidget {
  final String input;

  SetPasswordScreen({
    super.key,
    required this.input,
  });

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmationController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.WHITE,
      appBar: MyAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 16.h,
                  width: double.infinity,
                ),
                MyText(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  title: AppLocalizations.of(context)!.passwordReset,
                ),
                SizedBox(height: 16.h),
                MyText(
                  fontWeight: FontWeight.w300,
                  fontSize: 12,
                  color: AppColors.BLUE_DARK,
                  title: AppLocalizations.of(context)!.enterNewPassword,
                ),
                SizedBox(height: 40.h),
                MyText(
                  title: AppLocalizations.of(context)!.newPassword,
                  fontSize: 12,
                ),
                SizedBox(height: 14.h),
                MyTextField(
                  controller: _passwordController,
                  textHint: AppLocalizations.of(context)!.pleaseAddNewPassword,
                  isBorder: true,
                  colorBorder: AppColors.TRANSPARENT,
                  obscureEnabled: true,
                  maxLines: 1,
                ),
                SizedBox(height: 24.h),
                MyText(
                  title: AppLocalizations.of(context)!.confirmNewPassword,
                  fontSize: 12,
                ),
                SizedBox(height: 14.h),
                MyTextField(
                  controller: _passwordConfirmationController,
                  textHint: AppLocalizations.of(context)!
                      .pleaseAddNewPasswordConfirmation,
                  isBorder: true,
                  colorBorder: AppColors.TRANSPARENT,
                  maxLines: 1,
                  obscureEnabled: true,
                ),
                SizedBox(height: 48.h),
                Row(
                  children: [
                    Expanded(
                      child: MyElevatedButton(
                        title: AppLocalizations.of(context)!.reset,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {}
                        },
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: MyElevatedButton(
                        title: AppLocalizations.of(context)!.cancel,
                        background: AppColors.WHITE6,
                        titleColor: AppColors.GRAY3,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {}
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
