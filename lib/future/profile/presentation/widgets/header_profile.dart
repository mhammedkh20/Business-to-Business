import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:io';

import 'package:b2b_app/core/components/my_contianer_shape.dart';
import 'package:b2b_app/core/components/my_text.dart';
import 'package:b2b_app/core/utils/app_colors.dart';
import 'package:b2b_app/core/utils/app_helpers.dart';
import 'package:b2b_app/future/profile/presentation/manager/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HeaderProfile extends StatelessWidget {
  final PageController pageController = PageController();

  HeaderProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220.h,
      child: Stack(
        children: [
          SizedBox(
            height: 180.h,
            child: Stack(
              children: [
                SizedBox(
                  height: 230.h,
                  child: BlocBuilder<ProfileCubit, ProfileState>(
                    builder: (context, state) {
                      return ProfileCubit.get(context).images.length == 0
                          ? Container(color: AppColors.BLACK)
                          : PageView.builder(
                              controller: pageController,
                              onPageChanged: (int index) {
                                ProfileCubit.get(context)
                                    .changeIndexIndecator(index);
                              },
                              itemCount:
                                  ProfileCubit.get(context).images.length,
                              itemBuilder: (context, index) {
                                return Image.file(
                                  File(ProfileCubit.get(context).images[index]),
                                  height: 230.h,
                                  fit: BoxFit.cover,
                                );
                              },
                            );
                    },
                  ),
                ),
                Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).padding.top),
                    Row(
                      children: [
                        SizedBox(width: 6.w),
                        Material(
                          color: AppColors.BASE_COLOR.withOpacity(.5),
                          clipBehavior: Clip.antiAlias,
                          borderRadius: BorderRadius.circular(10),
                          child: IconButton(
                            icon: Icon(
                              Icons.arrow_back_ios,
                              size: 16.r,
                              color: AppColors.WHITE,
                            ),
                            onPressed: () {
                              AppHelpers.navigationBack(context);
                            },
                          ),
                        ),
                        const Spacer(),
                        PopupMenuButton<String>(
                          onSelected: (String value) {
                            if ('modifyCoverPhoto' == value) {
                              ProfileCubit.get(context).pickImage();
                            }
                          },
                          itemBuilder: (context) => [
                            PopupMenuItem<String>(
                              value: 'modifyCoverPhoto',
                              child: MyText(
                                title: AppLocalizations.of(context)!
                                    .modifyCoverPhoto,
                              ),
                            ),
                            PopupMenuItem<String>(
                              value: '1',
                              child: MyText(
                                title: AppLocalizations.of(context)!
                                    .editWithFilters,
                              ),
                            ),
                          ],
                          child: Material(
                            color: AppColors.BASE_COLOR.withOpacity(.5),
                            clipBehavior: Clip.antiAlias,
                            borderRadius: BorderRadius.circular(10),
                            child: IconButton(
                              icon: Icon(
                                Icons.more_vert,
                                size: 16.r,
                                color: AppColors.WHITE,
                              ),
                              onPressed: null,
                            ),
                          ),
                        ),
                        SizedBox(width: 6.w),
                      ],
                    ),
                    SizedBox(height: 10.h),
                  ],
                ),
                PositionedDirectional(
                  end: 16.w,
                  bottom: 10.h,
                  child: BlocBuilder<ProfileCubit, ProfileState>(
                    builder: (context, state) {
                      return MyContainerShape(
                        paddingHorizontal: 4,
                        paddingVertical: 4,
                        borderRadius: 10,
                        bgContainer: AppColors.BASE_COLOR.withOpacity(.3),
                        child: Row(
                          children: indecators(context,
                              ProfileCubit.get(context).indexPageImage),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          PositionedDirectional(
            bottom: 0,
            start: 0,
            end: 0,
            child: Align(
              child: SizedBox(
                height: 85.r,
                width: 85.r,
                child: Stack(
                  children: [
                    BlocBuilder<ProfileCubit, ProfileState>(
                      builder: (context, state) {
                        String? image = ProfileCubit.get(context).photo;
                        return GestureDetector(
                          onTap: () {
                            ProfileCubit.get(context).pickImageUser();
                          },
                          child: MyContainerShape(
                            height: 85.r,
                            borderRadius: 100,
                            width: 85.r,
                            child: MyContainerShape(
                              height: 80.r,
                              width: 80.r,
                              borderRadius: 100,
                              bgContainer: AppColors.BASE_COLOR,
                              child: image == null
                                  ? Icon(
                                      Icons.person,
                                      size: 40.r,
                                      color: AppColors.WHITE,
                                    )
                                  : Image.file(
                                      File(image),
                                      height: 80.r,
                                      width: 80.r,
                                      fit: BoxFit.cover,
                                    ),
                            ),
                          ),
                        );
                      },
                    ),
                    PositionedDirectional(
                      bottom: 0,
                      start: 0,
                      child: MyContainerShape(
                        bgContainer: AppColors.WHITE3,
                        borderRadius: 30,
                        width: 32.r,
                        height: 32.r,
                        child: Icon(
                          Icons.add_a_photo_outlined,
                          color: AppColors.BLACK,
                          size: 18.r,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> indecators(BuildContext context, int indexSelected) {
    List<Widget> indecator = [];

    for (int i = 0; i < ProfileCubit.get(context).images.length; i++) {
      indecator.add(
        MyContainerShape(
          height: 5.r,
          width: i == indexSelected ? 20.r : 5.r,
          borderRadius: 10,
          bgContainer: i == indexSelected
              ? AppColors.WHITE
              : AppColors.WHITE.withOpacity(.6),
        ),
      );
      indecator.add(SizedBox(width: 4.w));
    }

    return indecator;
  }
}
