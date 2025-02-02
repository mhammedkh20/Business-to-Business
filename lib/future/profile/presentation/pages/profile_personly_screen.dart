import 'package:b2b_app/core/components/my_contianer_shape.dart';
import 'package:b2b_app/core/components/my_switch.dart';
import 'package:b2b_app/core/components/my_text.dart';
import 'package:b2b_app/core/utils/app_bottom_sheet.dart';
import 'package:b2b_app/core/utils/app_colors.dart';
import 'package:b2b_app/future/home/presentation/widgets/home/item_tap.dart';
import 'package:b2b_app/future/profile/presentation/manager/cubit/profile_cubit.dart';
import 'package:b2b_app/future/profile/presentation/widgets/header_profile.dart';
import 'package:b2b_app/future/profile/presentation/widgets/my_body_personal_profile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:b2b_app/core/components/my_elevated_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfilePersonlyScreen extends StatelessWidget {
  const ProfilePersonlyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Column(
            children: [
              HeaderProfile(),
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    text: const TextSpan(
                      text: 'المهندس:صلاح خطاب ',
                      style: TextStyle(
                        color: AppColors.BLACK,
                        fontFamily: 'Montserrat',
                        fontSize: 14,
                      ),
                      children: [
                        TextSpan(
                          text: '(مصمم جرافيك)',
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.GRAY3,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 6.w),
                  SvgPicture.asset(
                    'assets/images/ic_documented.svg',
                    width: 16.r,
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(
                                'assets/images/ic_location.svg',
                                width: 20.r,
                              ),
                              SizedBox(width: 5.w),
                              MyText(
                                title: 'المملكة العربية السعودية',
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                                color: AppColors.GRAY3,
                              ),
                            ],
                          ),
                          SizedBox(height: 4.h),
                          Row(
                            children: [
                              SvgPicture.asset(
                                'assets/images/ic_link.svg',
                                width: 20.r,
                              ),
                              SizedBox(width: 5.w),
                              MyText(
                                title: 'SA.gov.sa',
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                                color: AppColors.BASE_COLOR,
                              ),
                            ],
                          ),
                          SizedBox(height: 4.h),
                          Row(
                            children: [
                              SizedBox(
                                width: 20.r,
                                child: SvgPicture.asset(
                                  'assets/images/ic_calender.svg',
                                ),
                              ),
                              SizedBox(width: 5.w),
                              MyText(
                                title: 'انضم في سبتمبر 2013',
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                                color: AppColors.GRAY3,
                              ),
                            ],
                          ),
                          SizedBox(height: 16.h),
                          Row(
                            children: [
                              MyText(
                                title: '273',
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                              SizedBox(width: 5.w),
                              MyText(
                                title: AppLocalizations.of(context)!.followers,
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                                color: AppColors.GRAY3,
                              ),
                              SizedBox(width: 32.w),
                              MyText(
                                title: '273',
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                              SizedBox(width: 5.w),
                              MyText(
                                title: AppLocalizations.of(context)!.follows,
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                                color: AppColors.GRAY3,
                              ),
                            ],
                          ),
                          SizedBox(height: 16.h),
                        ],
                      ),
                    ),
                    MyElevatedButton(
                      title:
                          AppLocalizations.of(context)!.humanitarianSituation,
                      onPressed: () {
                        AppBottomSheet.stateOfHumanityBottomSheet(context);
                      },
                      width: 135,
                      background: AppColors.TRANSPARENT,
                      titleColor: AppColors.BLACK,
                      borderColor: AppColors.BLACK,
                      borderRaduis: 30,
                      height: 35,
                      fontWeight: FontWeight.w300,
                      iconStart: true,
                      iconPath: 'assets/images/ic_humanitarian_situation.svg',
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Row(
                  children: [
                    Expanded(
                      child: MyContainerShape(
                        bgContainer: AppColors.WHITE5,
                        borderRadius: 40,
                        paddingHorizontal: 10,
                        paddingVertical: 8,
                        child: Row(
                          children: [
                            Expanded(
                              child: MyText(
                                title: AppLocalizations.of(context)!
                                    .iamLookingAJob,
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            MySwitch(onChanged: (bool e) {}),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: MyContainerShape(
                        bgContainer: AppColors.WHITE5,
                        borderRadius: 40,
                        paddingHorizontal: 10,
                        paddingVertical: 8,
                        child: Row(
                          children: [
                            Expanded(
                              child: MyText(
                                title: AppLocalizations.of(context)!
                                    .iWouldLikeToDonateBlood,
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            MySwitch(onChanged: (bool e) {}),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              int indexSelected = ProfileCubit.get(context).indexTap;

              return Column(
                children: [
                  SizedBox(
                      height: ProfileCubit.get(context).isExpanded
                          ? 12.h
                          : 10 + MediaQuery.of(context).padding.top),
                  Row(
                    children: [
                      ItemTap(
                        onTap: () {
                          ProfileCubit.get(context).changeIndexTap(0);
                        },
                        title: AppLocalizations.of(context)!.myData,
                        isSelected: indexSelected == 0,
                      ),
                      ItemTap(
                        onTap: () {
                          ProfileCubit.get(context).changeIndexTap(1);
                        },
                        title: AppLocalizations.of(context)!.myAds,
                        isSelected: indexSelected == 1,
                      ),
                      ItemTap(
                        onTap: () {
                          ProfileCubit.get(context).changeIndexTap(2);
                        },
                        title: AppLocalizations.of(context)!.myNews,
                        isSelected: indexSelected == 2,
                      ),
                      ItemTap(
                        onTap: () {
                          ProfileCubit.get(context).changeIndexTap(3);
                        },
                        title: AppLocalizations.of(context)!.myShop,
                        isSelected: indexSelected == 3,
                      ),
                      ItemTap(
                        onTap: () {
                          ProfileCubit.get(context).changeIndexTap(4);
                        },
                        title: AppLocalizations.of(context)!.myServices,
                        isSelected: indexSelected == 4,
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
          const MyBodyPersonalProfile(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AppBottomSheet.additionOptionsBottomSheet(context);
        },
        child: SvgPicture.asset('assets/images/ic_add.svg'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}
