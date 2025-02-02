// ignore_for_file: must_be_immutable

import 'package:b2b_app/core/components/my_app_bar.dart';
import 'package:b2b_app/core/components/my_elevated_button.dart';
import 'package:b2b_app/core/components/my_text.dart';
import 'package:b2b_app/core/components/my_text_field.dart';
import 'package:b2b_app/core/utils/app_colors.dart';
import 'package:b2b_app/core/utils/app_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';

class ChangePasswordScreen extends StatelessWidget {
  var _keyForm = GlobalKey<FormState>();
  TextEditingController _currentPasswordController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: AppLocalizations.of(context)!.changePassword,
      ),
      body: Padding(
        padding: EdgeInsetsDirectional.symmetric(horizontal: 16.w),
        child: Form(
          key: _keyForm,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20.h),
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: MyText(
                    title: AppLocalizations.of(context)!.changePassword,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
                SizedBox(height: 12.h),
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: MyText(
                    title: AppLocalizations.of(context)!.descChangePass,
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                    color: AppColors.GRAY3,
                    height: 1.4,
                  ),
                ),
                SizedBox(height: 30.h),
                MyTextField(
                  controller: _currentPasswordController,
                  labelText: AppLocalizations.of(context)!.currentPassword,
                  textHint: '',
                  filledColor: true,
                  isBorder: true,
                  prefixIcon: Padding(
                    padding: EdgeInsetsDirectional.only(start: 9.w, end: 5.w),
                    child: SvgPicture.asset(
                      'assets/images/ic_key.svg',
                      width: 16.w,
                      height: 16.h,
                    ),
                  ),
                  validator: (String? s) =>
                      AppHelpers.checkFillData(s, context),
                ),
                SizedBox(height: 16.h),
                MyTextField(
                  controller: _passwordController,
                  labelText: AppLocalizations.of(context)!.newPassword,
                  textHint: '',
                  obscureEnabled: true,
                  filledColor: true,
                  maxLines: 1,
                  isBorder: true,
                  prefixIcon: Padding(
                    padding: EdgeInsetsDirectional.only(start: 9.w, end: 5.w),
                    child: SvgPicture.asset(
                      'assets/images/ic_lock.svg',
                      width: 16.w,
                      height: 16.h,
                    ),
                  ),
                  validator: (String? s) =>
                      AppHelpers.checkFillData(s, context),
                ),
                SizedBox(height: 16.h),
                MyTextField(
                  controller: _confirmPasswordController,
                  maxLines: 1,
                  textHint: '',
                  labelText: AppLocalizations.of(context)!.confirmPassword,
                  filledColor: true,
                  obscureEnabled: true,
                  isBorder: true,
                  prefixIcon: Padding(
                    padding: EdgeInsetsDirectional.only(start: 9.w, end: 5.w),
                    child: SvgPicture.asset(
                      'assets/images/ic_lock.svg',
                      width: 16.w,
                      height: 16.h,
                    ),
                  ),
                  validator: (String? s) =>
                      AppHelpers.checkFillDataWithMatchPaawords(
                          s, _passwordController.text, context),
                ),
                SizedBox(height: 43.h),
                MyElevatedButton(
                  title: AppLocalizations.of(context)!.confirm,
                  onPressed: () {
                    if (_keyForm.currentState!.validate()) {}
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
