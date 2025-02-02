import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:b2b_app/future/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:b2b_app/future/home/presentation/widgets/home/data_user_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HeaderHomePage extends StatelessWidget {
  const HeaderHomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: const Duration(milliseconds: 500),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return SizedBox(
            height: HomeCubit.get(context).isExpanded ? null : 0,
            child: Column(
              children: [
                SizedBox(height: 10.h),
                const DataUserWidget(),
                SizedBox(height: 12.h),
              ],
            ),
          );
        },
      ),
    );
  }
}
