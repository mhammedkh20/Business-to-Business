import 'package:b2b_app/future/profile/presentation/widgets/item_product_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:b2b_app/core/components/my_divider.dart';
import 'package:b2b_app/future/home/presentation/widgets/home/post_widget.dart';
import 'package:b2b_app/future/profile/presentation/manager/cubit/profile_cubit.dart';
import 'package:b2b_app/future/profile/presentation/widgets/my_data_user_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyBodyPersonalProfile extends StatelessWidget {
  const MyBodyPersonalProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        int indexPage = ProfileCubit.get(context).indexTap;
        switch (indexPage) {
          case 0:
            return const MyDataUserWidget();

          case 1:
            return ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 20,
              padding: EdgeInsets.symmetric(vertical: 20.h),
              itemBuilder: (context, index) {
                return const PostWidget();
              },
              separatorBuilder: (context, index) {
                return Column(
                  children: [
                    SizedBox(height: 20.h),
                    const MyDivider(padding: 0),
                    SizedBox(height: 16.h),
                  ],
                );
              },
            );

          case 2:
            return ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 20,
              padding: EdgeInsets.symmetric(vertical: 20.h),
              itemBuilder: (context, index) {
                return const PostWidget();
              },
              separatorBuilder: (context, index) {
                return Column(
                  children: [
                    SizedBox(height: 20.h),
                    const MyDivider(padding: 0),
                    SizedBox(height: 16.h),
                  ],
                );
              },
            );

          case 3:
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 175.w / 280.h,
                  crossAxisSpacing: 10.w,
                  mainAxisSpacing: 10.h),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 20,
              padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 16.w),
              itemBuilder: (context, index) {
                return const ItemProductWidget();
              },
            );

          case 4:
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 175.w / 280.h,
                  crossAxisSpacing: 10.w,
                  mainAxisSpacing: 10.h),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 20,
              padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 16.w),
              itemBuilder: (context, index) {
                return const ItemProductWidget();
              },
            );

          default:
            return Container();
        }
      },
    );
  }
}
