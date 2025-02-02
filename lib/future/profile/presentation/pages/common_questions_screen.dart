import 'package:b2b_app/core/components/my_app_bar.dart';
import 'package:b2b_app/future/home/presentation/widgets/home/item_tap.dart';
import 'package:b2b_app/future/profile/presentation/manager/cubit/profile_cubit.dart';
import 'package:b2b_app/future/profile/presentation/widgets/item_qustions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CommonQuestionsScreen extends StatelessWidget {
  const CommonQuestionsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: AppLocalizations.of(context)!.commonQuestions,
      ),
      body: Column(
        children: [
          const MyTapBarCommonQustions(),
          SizedBox(height: 16.h),
          Expanded(
            child: ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: 3,
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    const ItemQuestions(),
                    SizedBox(height: 12.h),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class MyTapBarCommonQustions extends StatelessWidget {
  const MyTapBarCommonQustions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        int indexSelected = ProfileCubit.get(context).indexTapCommon;
        return Row(
          children: [
            ItemTap(
              onTap: () {
                ProfileCubit.get(context).changeIndexTapCommon(0);
              },
              title: 'الإعلانات',
              isSelected: indexSelected == 0,
            ),
            ItemTap(
              onTap: () {
                ProfileCubit.get(context).changeIndexTapCommon(1);
              },
              title: 'الأخبار',
              isSelected: indexSelected == 1,
            ),
            ItemTap(
              onTap: () {
                ProfileCubit.get(context).changeIndexTapCommon(2);
              },
              title: 'المتجر',
              isSelected: indexSelected == 2,
            ),
            ItemTap(
              onTap: () {
                ProfileCubit.get(context).changeIndexTapCommon(3);
              },
              title: 'الشركات',
              isSelected: indexSelected == 3,
            ),
          ],
        );
      },
    );
  }
}
