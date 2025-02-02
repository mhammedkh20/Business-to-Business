import 'package:b2b_app/core/components/my_elevated_button.dart';
import 'package:b2b_app/core/components/my_text_field.dart';
import 'package:b2b_app/core/utils/app_helpers.dart';
import 'package:b2b_app/core/utils/app_loader.dart';
import 'package:b2b_app/future/auth/presentation/auth_cubit/auth_cubit.dart';
import 'package:b2b_app/future/auth/presentation/pages/forget_password_screen.dart';
import 'package:b2b_app/future/auth/presentation/pages/register_screen.dart';
import 'package:b2b_app/future/home/presentation/pages/main_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:b2b_app/core/components/my_text.dart';
import 'package:b2b_app/core/utils/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:b2b_app/core/components/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        elevation: 0,
        title: AppLocalizations.of(context)!.signIn,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          children: [
            SizedBox(height: 16.h),
            SvgPicture.asset(
              'assets/images/app_icon/ic_app.svg',
              color: AppColors.APP_THEME,
              width: 100.r,
            ),
            SizedBox(height: 20.h),
            MyText(
              title: AppLocalizations.of(context)!.welcomeBack,
              textAlign: TextAlign.center,
              fontWeight: FontWeight.w300,
              color: AppColors.GRAY3,
            ),
            SizedBox(height: 48.h),
            MyText(
              textAlign: TextAlign.start,
              title: AppLocalizations.of(context)!.emailOrMobile,
              fontSize: 12,
            ),
            SizedBox(height: 14.h),
            MyTextField(
              controller: _emailController,
              textHint: AppLocalizations.of(context)!.emailOrMobile,
              validator: (String? s) => AppHelpers.checkFillData(s, context),
            ),
            SizedBox(height: 24.h),
            MyText(
              textAlign: TextAlign.start,
              title: AppLocalizations.of(context)!.password,
              fontSize: 12,
            ),
            SizedBox(height: 14.h),
            MyTextField(
              controller: _passwordController,
              textHint: AppLocalizations.of(context)!.password,
              obscureEnabled: true,
              maxLines: 1,
              validator: (String? s) => AppHelpers.checkFillData(s, context),
            ),
            SizedBox(height: 20.h),
            GestureDetector(
              onTap: () {
                AppHelpers.navigationToPage(
                    context, const ForgetPasswordScreen());
              },
              child: MyText(
                fontSize: 12,
                textAlign: TextAlign.end,
                title: AppLocalizations.of(context)!.forgotPassword,
              ),
            ),
            SizedBox(height: 44.h),
            BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is AuthLoginLoading) {
                  AppLoaderDialog.show(context);
                }
                if (state is AuthLoginSuccess) {
                  AppLoaderDialog.hide(context);
                  AppHelpers.navigationToPageAndExitAll(
                      context, const MainScreen());
                }
                if (state is AuthLoginFailuer) {
                  AppLoaderDialog.hide(context);

                  AppHelpers.showSnackBar(
                    context,
                    message: state.message,
                    error: true,
                  );
                }
              },
              builder: (context, state) {
                return MyElevatedButton(
                  fontSize: 14,
                  title: AppLocalizations.of(context)!.signIn,
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      await AuthCubit.get(context).login(
                        _passwordController.text.trim(),
                        _emailController.text.trim(),
                      );
                    }
                  },
                );
              },
            ),
            SizedBox(height: 14.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  text: TextSpan(
                    text: AppLocalizations.of(context)!.doNotHaveAccount + " ",
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      color: AppColors.GRAY,
                      fontSize: 12.sp,
                      fontFamily: 'Montserrat',
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: AppLocalizations.of(context)!.createAccount,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12.sp,
                          fontFamily: 'Montserrat',
                          color: AppColors.BLACK,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            AppHelpers.navigationToPage(
                                context, const RegisterScreen());
                          },
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: RichText(
              text: TextSpan(
                text:
                    "${AppLocalizations.of(context)!.youCanSkipRegistrationProcess} ",
                style: TextStyle(
                  color: AppColors.GRAY,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Montserrat',
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: AppLocalizations.of(context)!.signInAsVisitor,
                    style: TextStyle(
                      fontSize: 14.sp,
                      height: 1.4,
                      fontFamily: 'Montserrat',
                      color: AppColors.BLACK,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        AppHelpers.navigationToPageAndExitAll(
                            context, const MainScreen());
                      },
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 40.h),
        ],
      ),
    );
  }
}
