import 'package:b2b_app/future/add_ads/presentation/manager/add_ads_cubit/add_ads_cubit.dart';
import 'package:b2b_app/future/add_ads/presentation/widgets/item_tap_add_news.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TabAddNews extends StatelessWidget {
  const TabAddNews({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddAdsCubit, AddAdsState>(
      builder: (context, state) {
        int indexSelected = AddAdsCubit.get(context).indexTab;
        AddAdsCubit instance = AddAdsCubit.get(context);
        return Row(
          children: [
            ItemTapAddNews(
              onTap: () {
                instance.changeIndexTap(0);
              },
              title: AppLocalizations.of(context)!.category,
              isSelected: indexSelected == 0,
              index: 0,
              indexSelected: indexSelected,
            ),
            ItemTapAddNews(
              onTap: () {
                instance.changeIndexTap(1);
              },
              title: AppLocalizations.of(context)!.theDetails,
              isSelected: indexSelected == 1,
              index: 1,
              indexSelected: indexSelected,
            ),
            ItemTapAddNews(
              onTap: () {
                instance.changeIndexTap(2);
              },
              title: AppLocalizations.of(context)!.description,
              isSelected: indexSelected == 2,
              index: 2,
              indexSelected: indexSelected,
            ),
            ItemTapAddNews(
              onTap: () {
                instance.changeIndexTap(3);
              },
              title: AppLocalizations.of(context)!.communication,
              isSelected: indexSelected == 3,
              index: 3,
              indexSelected: indexSelected,
            ),
          ],
        );
      },
    );
  }
}
