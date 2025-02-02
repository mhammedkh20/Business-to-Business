import 'package:b2b_app/future/add_ads/presentation/manager/add_ads_cubit/add_ads_cubit.dart';
import 'package:b2b_app/future/add_ads/presentation/widgets/item_tap_add_news.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TabAddFinancing extends StatelessWidget {
  const TabAddFinancing({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddAdsCubit, AddAdsState>(
      builder: (context, state) {
        int indexSelected = AddAdsCubit.get(context).indexTabFinancing;
        AddAdsCubit instance = AddAdsCubit.get(context);
        return Row(
          children: [
            ItemTapAddNews(
              onTap: () {
                instance.changeIndexTapFinancing(0);
              },
              title: AppLocalizations.of(context)!.adInstallation,
              isSelected: indexSelected == 0,
              index: null,
              indexSelected: indexSelected,
            ),
            ItemTapAddNews(
              onTap: () {
                instance.changeIndexTapFinancing(1);
              },
              title: AppLocalizations.of(context)!.advertisingPromotion,
              isSelected: indexSelected == 1,
              index: null,
              indexSelected: indexSelected,
            ),
          ],
        );
      },
    );
  }
}
