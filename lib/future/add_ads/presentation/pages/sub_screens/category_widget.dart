import 'package:b2b_app/core/components/custom_dropdown_menu2.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:b2b_app/core/components/my_divider.dart';
import 'package:b2b_app/core/components/my_text.dart';
import 'package:b2b_app/core/utils/app_colors.dart';
import 'package:b2b_app/future/add_ads/presentation/manager/add_ads_cubit/add_ads_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:b2b_app/core/components/my_contianer_shape.dart';
import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        BlocBuilder<AddAdsCubit, AddAdsState>(
          builder: (context, state) {
            int indexSelected = AddAdsCubit.get(context).categorySelected;
            return GridView.builder(
              itemCount: 10,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.r,
                childAspectRatio: 175.r / 60.r,
                mainAxisSpacing: 10.r,
              ),
              itemBuilder: (context, index) {
                return Material(
                  borderRadius: BorderRadius.circular(4.r),
                  color: indexSelected == index
                      ? AppColors.GRAY3
                      : AppColors.WHITE,
                  child: InkWell(
                    onTap: () {
                      AddAdsCubit.get(context).changeCategorySelected(index);
                    },
                    borderRadius: BorderRadius.circular(4.r),
                    child: MyContainerShape(
                      borderRadius: 4,
                      bgContainer: AppColors.TRANSPARENT,
                      enableBorder: true,
                      child: MyText(
                        title: 'المركبات',
                        color: indexSelected == index
                            ? AppColors.WHITE
                            : AppColors.BLACK,
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
        SizedBox(height: 40.h),
        const MyDivider(padding: 0),
        SizedBox(height: 30.h),
        Row(
          children: [
            MyText(
              title: AppLocalizations.of(context)!.subclassification,
              maxLines: 1,
              textOverflow: true,
            ),
            SizedBox(width: 30.w),
            Flexible(
              child: CustomDropdownMenu2<String>(
                enabledBorder: true,
                background: AppColors.WHITE,
                borderRaduis: 4,
                hint: 'اختيار التصنيف',
                listItems: const [
                  'سيارات',
                  'طائرات',
                ],
                onChanged: <String>(String s) {},
              ),
            )
          ],
        ),
      ],
    );
  }
}
