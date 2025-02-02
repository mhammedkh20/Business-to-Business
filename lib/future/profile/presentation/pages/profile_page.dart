import 'package:b2b_app/core/components/my_divider.dart';
import 'package:b2b_app/core/storage/pref/shared_pref_controller.dart';
import 'package:b2b_app/core/utils/app_helpers.dart';
import 'package:b2b_app/future/auth/presentation/pages/login_screen.dart';
import 'package:b2b_app/future/home/presentation/manager/language_cubit/language_cubit.dart';
import 'package:b2b_app/future/profile/models/item_settings_model.dart';
import 'package:b2b_app/future/profile/presentation/manager/cubit/profile_cubit.dart';
import 'package:b2b_app/future/profile/presentation/pages/about_app_screen.dart';
import 'package:b2b_app/future/profile/presentation/pages/common_questions_screen.dart';
import 'package:b2b_app/future/profile/presentation/pages/profile_personly_screen.dart';
import 'package:b2b_app/future/profile/presentation/pages/settings_screen.dart';
import 'package:b2b_app/future/profile/presentation/widgets/header_profile_widget.dart';
import 'package:b2b_app/future/profile/presentation/widgets/item_settings.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HeaderProfileWidget(),
        SizedBox(height: 23.h),
        BlocBuilder<LanguageCubit, LanguageState>(
          builder: (context, state) {
            return ListView.separated(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                ItemSettingsModel model =
                    ProfileCubit.get(context).settings(context)[index];
                return ItemSettings(
                  icon: model.icon,
                  title: model.title,
                  onTap: () async {
                    switch (index) {
                      case 0:
                        AppHelpers.navigationToPage(
                            context, const ProfilePersonlyScreen());

                        break;

                      case 1:
                        AppHelpers.navigationToPage(
                            context, const AboutAppScreen());
                        break;
                      case 2:
                        AppHelpers.navigationToPage(
                            context, const CommonQuestionsScreen());

                        break;
                      case 3:
                        AppHelpers.navigationToPage(
                            context, const SettingsScreen());

                        break;
                      case 4:
                        SharedPrefController().clearAllData();
                        AppHelpers.navigationToPageAndExitAll(
                            context, LoginScreen());

                        break;
                    }
                  },
                );
              },
              separatorBuilder: (context, index) {
                return const MyDivider();
              },
              itemCount: ProfileCubit.get(context).settings(context).length,
            );
          },
        ),
      ],
    );
  }
}
