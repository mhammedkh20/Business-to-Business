import 'package:b2b_app/future/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:b2b_app/future/home/presentation/widgets/home/item_tap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyTapBarHomePage extends StatelessWidget {
  const MyTapBarHomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        int indexSelected = HomeCubit.get(context).indexAdsNews;
        return Row(
          children: [
            ItemTap(
              onTap: () {
                HomeCubit.get(context).changeAdsNews(0);
              },
              title: AppLocalizations.of(context)!.ads,
              isSelected: indexSelected == 0,
            ),
            ItemTap(
              onTap: () {
                HomeCubit.get(context).changeAdsNews(1);
              },
              title: AppLocalizations.of(context)!.news,
              isSelected: indexSelected == 1,
            ),
          ],
        );
      },
    );
  }
}
