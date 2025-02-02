import 'package:b2b_app/future/home/presentation/widgets/home/item_tap.dart';
import 'package:b2b_app/future/search/presentation/manager/cubit/filter_search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyTapBarSearch extends StatelessWidget {
  const MyTapBarSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterSearchCubit, FilterSearchState>(
      builder: (context, state) {
        int indexSelected = FilterSearchCubit.get(context).indexTapSearch;
        return Row(
          children: [
            ItemTap(
              onTap: () {
                FilterSearchCubit.get(context).changeIndexSearch(0);
              },
              title: AppLocalizations.of(context)!.ads,
              isSelected: indexSelected == 0,
            ),
            ItemTap(
              onTap: () {
                FilterSearchCubit.get(context).changeIndexSearch(1);
              },
              title: AppLocalizations.of(context)!.news,
              isSelected: indexSelected == 1,
            ),
            ItemTap(
              onTap: () {
                FilterSearchCubit.get(context).changeIndexSearch(2);
              },
              title: AppLocalizations.of(context)!.companies,
              isSelected: indexSelected == 2,
            ),
            ItemTap(
              onTap: () {
                FilterSearchCubit.get(context).changeIndexSearch(3);
              },
              title: AppLocalizations.of(context)!.individuals,
              isSelected: indexSelected == 3,
            ),
          ],
        );
      },
    );
  }
}
