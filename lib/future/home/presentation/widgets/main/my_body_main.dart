import 'package:b2b_app/future/home/presentation/manager/main_cubit/main_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyBodyMain extends StatelessWidget {
  const MyBodyMain({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      builder: (context, state) {
        int indexPage = MainCubit.get(context).indexPage;
        return MainCubit.get(context).pages[indexPage];
      },
    );
  }
}
