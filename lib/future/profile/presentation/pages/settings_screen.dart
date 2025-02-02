import 'package:b2b_app/core/components/custom_dropdown_menu.dart';
import 'package:b2b_app/core/components/my_app_bar.dart';
import 'package:b2b_app/core/components/my_contianer_shape.dart';
import 'package:b2b_app/core/components/my_divider.dart';
import 'package:b2b_app/core/components/my_switch.dart';
import 'package:b2b_app/core/components/my_text.dart';
import 'package:b2b_app/core/storage/pref/shared_pref_controller.dart';
import 'package:b2b_app/core/utils/app_colors.dart';
import 'package:b2b_app/core/utils/app_helpers.dart';
import 'package:b2b_app/future/home/presentation/manager/language_cubit/language_cubit.dart';
import 'package:b2b_app/future/profile/presentation/pages/change_password_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: AppLocalizations.of(context)!.settings,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 16.h),
        children: [
          MyContainerShape(
            height: 60.h,
            paddingHorizontal: 18,
            child: Row(
              children: [
                SvgPicture.asset(
                  'assets/images/ic_language.svg',
                  width: 15.r,
                ),
                SizedBox(width: 14.w),
                MyText(
                  title: AppLocalizations.of(context)!.language,
                  fontSize: 12,
                ),
                const Spacer(),
                CustomDropdownMenu(
                  paddingHorizontal: 10,
                  height: 40.h,
                  initValue: SharedPrefController().getLang,
                  listItems: const [
                    'ar',
                    'en',
                  ],
                  onChanged: (String? lang) {
                    LanguageCubit.get(context)
                        .changeLanguage('ar' == lang ? 0 : 1);
                  },
                ),
              ],
            ),
          ),
          const MyDivider(),
          MyContainerShape(
            height: 60.h,
            paddingHorizontal: 18,
            child: Row(
              children: [
                SvgPicture.asset(
                  'assets/images/ic_norification2.svg',
                  width: 15.r,
                ),
                SizedBox(width: 14.w),
                MyText(
                  title: AppLocalizations.of(context)!.activateNotifications,
                  fontSize: 12,
                ),
                const Spacer(),
                MySwitch(
                  activeColor: AppColors.BASE_COLOR,
                  onChanged: (bool enabled) {},
                ),
              ],
            ),
          ),
          const MyDivider(),
          GestureDetector(
            onTap: () {
              AppHelpers.navigationToPage(context, ChangePasswordScreen());
            },
            child: MyContainerShape(
              height: 60.h,
              paddingHorizontal: 18,
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/images/ic_lock.svg',
                    width: 15.r,
                  ),
                  SizedBox(width: 14.w),
                  MyText(
                    title: AppLocalizations.of(context)!.changePassword,
                    fontSize: 12,
                  ),
                  const Spacer(),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 18.r,
                    color: AppColors.GRAY3,
                  ),
                ],
              ),
            ),
          ),
          const MyDivider(),
        ],
      ),
    );
  }
}
