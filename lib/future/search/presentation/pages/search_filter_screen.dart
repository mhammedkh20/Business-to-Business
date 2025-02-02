import 'package:b2b_app/core/components/custom_dropdown_menu2.dart';
import 'package:b2b_app/core/components/item_radio_custom2.dart';
import 'package:b2b_app/core/components/my_elevated_button.dart';
import 'package:b2b_app/core/components/my_text.dart';
import 'package:b2b_app/core/utils/app_helpers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:b2b_app/core/components/my_app_bar.dart';
import 'package:flutter/material.dart';

class SearchFilterScreen extends StatelessWidget {
  const SearchFilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: AppLocalizations.of(context)!.searchFilter,
        elevation: 0,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        children: [
          SizedBox(height: 32.h),
          ItemRadioCustom2(
            title: AppLocalizations.of(context)!.companies,
            children: const [
              'من أي شخص',
              'الأشخاص الذين تتابعهم',
            ],
          ),
          SizedBox(height: 32.h),
          ItemRadioCustom2(
            title: AppLocalizations.of(context)!.geographicaLocation,
            children: const [
              'في أي مكان',
              'بالقرب منك',
            ],
          ),
          SizedBox(height: 32.h),
          MyText(title: AppLocalizations.of(context)!.typeCompany),
          SizedBox(height: 12.h),
          CustomDropdownMenu2<String>(
            enabledBorder: false,
            hint: AppLocalizations.of(context)!.typeCompany,
            listItems: const [
              'سيارات',
              'طائرات',
            ],
            onChanged: <String>(String s) {},
          ),
          SizedBox(height: 50.h),
          MyElevatedButton(
            title: AppLocalizations.of(context)!.search2,
            onPressed: () {
              AppHelpers.navigationBack(context);
            },
          )
        ],
      ),
    );
  }
}
