import 'package:b2b_app/core/components/my_contianer_shape.dart';
import 'package:b2b_app/core/components/my_elevated_button.dart';
import 'package:b2b_app/core/components/my_text_field.dart';
import 'package:b2b_app/core/utils/app_helpers.dart';
import 'package:b2b_app/future/auth/presentation/auth_cubit/auth_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:b2b_app/core/components/my_text.dart';
import 'package:b2b_app/core/utils/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:b2b_app/core/components/my_app_bar.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        elevation: 0,
        title: AppLocalizations.of(context)!.createAccount,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        children: [
          SizedBox(height: 16.h),
          BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              print('asdfasdfasdfa');
              int indexSelected = AuthCubit.get(context).typeUser;
              return Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        AuthCubit.get(context).changeTypeUser(0);
                      },
                      child: MyContainerShape(
                        height: 40.h,
                        topStartRaduis: 4,
                        bottomStartRaduis: 4,
                        bgContainer: indexSelected == 0
                            ? AppColors.GRAY3
                            : AppColors.WHITE6,
                        child: MyText(
                          title: AppLocalizations.of(context)!.individuals,
                          color: indexSelected == 0
                              ? AppColors.WHITE
                              : AppColors.BLACK,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        AuthCubit.get(context).changeTypeUser(1);
                      },
                      child: MyContainerShape(
                        height: 40.h,
                        topEndRaduis: 4,
                        bottomEndRaduis: 4,
                        bgContainer: indexSelected == 1
                            ? AppColors.GRAY3
                            : AppColors.WHITE6,
                        child: MyText(
                          color: indexSelected == 1
                              ? AppColors.WHITE
                              : AppColors.BLACK,
                          title: AppLocalizations.of(context)!.companies,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
          SizedBox(height: 24.h),
          MyText(
            textAlign: TextAlign.start,
            title: AppLocalizations.of(context)!.emailOrMobile,
            fontSize: 12,
          ),
          SizedBox(height: 14.h),
          MyTextField(
            textHint: AppLocalizations.of(context)!.emailOrMobile,
          ),
          SizedBox(height: 24.h),
          BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              return AuthCubit.get(context).typeUser == 1
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText(
                          textAlign: TextAlign.start,
                          title: AppLocalizations.of(context)!.companyName,
                          fontSize: 12,
                        ),
                        SizedBox(height: 14.h),
                        MyTextField(
                          textHint: AppLocalizations.of(context)!.companyName,
                        ),
                        SizedBox(height: 24.h),
                      ],
                    )
                  : const SizedBox();
            },
          ),
          MyText(
            textAlign: TextAlign.start,
            title: AppLocalizations.of(context)!.password,
            fontSize: 12,
          ),
          SizedBox(height: 14.h),
          MyTextField(
            textHint: AppLocalizations.of(context)!.password,
            obscureEnabled: true,
            maxLines: 1,
          ),
          SizedBox(height: 44.h),
          MyElevatedButton(
            title: AppLocalizations.of(context)!.createAccount,
            onPressed: () {},
          ),
          BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              return AuthCubit.get(context).typeUser == 0
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 32.h),
                        Row(
                          children: [
                            Expanded(
                              child: Divider(
                                height: 1.h,
                                color: AppColors.BORDER,
                              ),
                            ),
                            SizedBox(width: 12.w),
                            MyText(
                              title:
                                  AppLocalizations.of(context)!.orRegisterVia,
                              fontSize: 12,
                              color: AppColors.GRAY,
                            ),
                            SizedBox(width: 12.w),
                            Expanded(
                              child: Divider(
                                height: 1.h,
                                color: AppColors.BORDER,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.h),
                        Row(
                          children: [
                            Expanded(
                              child: MyElevatedButton(
                                title: 'Google',
                                onPressed: () {},
                                borderRaduis: 4,
                                fontSize: 12,
                                background: AppColors.WHITE5,
                                titleColor: AppColors.BLACK,
                                height: 46,
                                borderColor: AppColors.BORDER,
                                iconStart: false,
                                iconPath: 'assets/images/ic_google.svg',
                              ),
                            ),
                            SizedBox(width: 10.w),
                            Expanded(
                              child: MyElevatedButton(
                                borderRaduis: 4,
                                background: AppColors.WHITE5,
                                fontSize: 12,
                                borderColor: AppColors.BORDER,
                                titleColor: AppColors.BLACK,
                                title: 'Apple',
                                height: 46,
                                iconStart: false,
                                iconPath: 'assets/images/ic_apple.svg',
                                onPressed: () {},
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  : const SizedBox();
            },
          ),
          SizedBox(height: 40.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyText(
                fontWeight: FontWeight.w300,
                color: AppColors.GRAY,
                fontSize: 12,
                title: AppLocalizations.of(context)!.doHavePreviousAccount,
              ),
              GestureDetector(
                onTap: () {
                  AppHelpers.navigationBack(context);
                },
                child: MyText(
                  fontWeight: FontWeight.w500,
                  color: AppColors.BLACK,
                  fontSize: 12,
                  title: AppLocalizations.of(context)!.signIn,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
