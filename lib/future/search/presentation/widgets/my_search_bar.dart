import 'package:b2b_app/core/components/my_text_field.dart';
import 'package:b2b_app/core/utils/app_colors.dart';
import 'package:b2b_app/core/utils/app_helpers.dart';
import 'package:b2b_app/future/search/presentation/pages/Search_filter_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MySearchBar extends StatelessWidget {
  const MySearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: SvgPicture.asset('assets/images/ic_back2.svg'),
          onPressed: () {
            AppHelpers.navigationBack(context);
          },
        ),
        Expanded(
          child: MyTextField(
            textHint: AppLocalizations.of(context)!.search,
            borderRadius: 40,
            fillColor2: AppColors.WHITE6,
            colorBorder: AppColors.TRANSPARENT,
            hintColor: AppColors.GRAY3,
            borderSide: AppColors.TRANSPARENT,
            fontSize: 14,
            prefixIcon: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(width: 16.w),
                SvgPicture.asset(
                  'assets/images/ic_search2.svg',
                  width: 20.r,
                ),
                SizedBox(width: 16.w),
              ],
            ),
          ),
        ),
        IconButton(
          icon: SvgPicture.asset('assets/images/ic_filter.svg'),
          onPressed: () {
            AppHelpers.navigationToPage(context, const SearchFilterScreen());
          },
        ),
      ],
    );
  }
}
