import 'package:b2b_app/future/home/presentation/manager/main_cubit/main_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class MyFoatingActionButtton extends StatelessWidget {
  const MyFoatingActionButtton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      builder: (context, state) {
        int indexPage = MainCubit.get(context).indexPage;
        return indexPage == 0
            ? FloatingActionButton(
                onPressed: () {},
                child: SvgPicture.asset('assets/images/ic_add.svg'),
              )
            : const SizedBox();
      },
    );
  }
}
