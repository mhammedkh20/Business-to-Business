// ignore_for_file: must_be_immutable

import 'package:b2b_app/core/components/my_contianer_shape.dart';
import 'package:b2b_app/core/components/my_divider.dart';
import 'package:b2b_app/core/components/my_text_field.dart';
import 'package:b2b_app/core/utils/app_colors.dart';
import 'package:b2b_app/core/utils/app_helpers.dart';
import 'package:b2b_app/future/add_ads/presentation/manager/add_ads_cubit/add_ads_cubit.dart';
import 'package:b2b_app/future/add_ads/presentation/widgets/communication_times_widget.dart';
import 'package:b2b_app/future/add_ads/presentation/widgets/icons_add_remove_form_select_datetime.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:b2b_app/core/components/my_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CommunicationWidget extends StatelessWidget {
  CommunicationWidget({super.key});

  TextEditingController _fromDate = TextEditingController();
  TextEditingController _toDate = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        Row(
          children: [
            const MyText(title: 'أوقات التواصل'),
            SizedBox(width: 4.w),
            const MyText(
              title: '(ساعات استقبال الاتصالات)',
              fontSize: 12,
              fontWeight: FontWeight.w300,
              color: AppColors.GRAY,
            )
          ],
        ),
        SizedBox(height: 16.h),
        const CommunicationTimesWidget(),
        SizedBox(height: 24.h),
        BlocBuilder<AddAdsCubit, AddAdsState>(
          builder: (context, state) {
            int countLoop = AddAdsCubit.get(context).formCount;
            return AnimatedSize(
              duration: const Duration(milliseconds: 500),
              child: ListView.builder(
                itemCount: countLoop,
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      const CommunicationTimesWidget(),
                      SizedBox(height: 24.h),
                    ],
                  );
                },
              ),
            );
          },
        ),
        const IconsAddAndRemoveFormSelectDateTime(),
        SizedBox(height: 24.h),
        const MyDivider(padding: 0),
        SizedBox(height: 24.h),
        const MyText(title: 'مدة نشر الاعلان'),
        SizedBox(height: 10.h),
        Row(
          children: [
            const Expanded(
              flex: 1,
              child: MyText(
                title: 'من تاريخ',
                maxLines: 1,
                textOverflow: true,
              ),
            ),
            SizedBox(width: 30.w),
            Flexible(
              flex: 3,
              child: MyTextField(
                controller: _fromDate,
                textHint: 'من تاريخ',
                filledColor: true,
                readOnly: true,
                fillColor2: AppColors.WHITE,
                paddingHorizontal: 0,
                onTap: () async {
                  String? date = await AppHelpers.selectDate(context);
                  if (date != null) {
                    _fromDate.text = date;
                  }
                },
                suffixWidget: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      'assets/images/ic_calender.svg',
                      width: 20.r,
                    ),
                    SizedBox(width: 20.w)
                  ],
                ),
              ),
            )
          ],
        ),
        SizedBox(height: 10.h),
        Row(
          children: [
            const Expanded(
              flex: 1,
              child: MyText(
                title: 'الى تاريخ',
                maxLines: 1,
                textOverflow: true,
              ),
            ),
            SizedBox(width: 30.w),
            Flexible(
              flex: 3,
              child: MyTextField(
                controller: _toDate,
                textHint: 'الى تاريخ',
                filledColor: true,
                readOnly: true,
                fillColor2: AppColors.WHITE,
                paddingHorizontal: 0,
                onTap: () async {
                  String? date = await AppHelpers.selectDate(context);
                  if (date != null) {
                    _toDate.text = date;
                  }
                },
                suffixWidget: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      'assets/images/ic_calender.svg',
                      width: 20.r,
                    ),
                    SizedBox(width: 20.w)
                  ],
                ),
              ),
            )
          ],
        ),
        SizedBox(height: 24.h),
        const MyDivider(padding: 0),
        SizedBox(height: 24.h),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Expanded(
              flex: 2,
              child: MyText(
                title: 'ارقام التواصل',
                maxLines: 1,
                textOverflow: true,
              ),
            ),
            SizedBox(width: 10.w),
            Flexible(
              flex: 4,
              child: Column(
                children: [
                  MyTextField(
                    controller: _fromDate,
                    textHint: 'ارقام التواصل',
                    filledColor: true,
                    fillColor2: AppColors.WHITE,
                    paddingHorizontal: 0,
                  ),
                  SizedBox(height: 10.h),
                  AnimatedSize(
                    duration: const Duration(milliseconds: 300),
                    child: BlocBuilder<AddAdsCubit, AddAdsState>(
                      builder: (context, state) {
                        int countLoop =
                            AddAdsCubit.get(context).numberCommunication;
                        return ListView.builder(
                          itemCount: countLoop,
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                MyTextField(
                                  controller: _fromDate,
                                  textHint: 'ارقام التواصل',
                                  filledColor: true,
                                  fillColor2: AppColors.WHITE,
                                  paddingHorizontal: 0,
                                  suffixWidget: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          AddAdsCubit.get(context)
                                              .changeNumberCommunication(
                                                  countLoop - 1);
                                        },
                                        child: const Icon(
                                          Icons.delete_forever_outlined,
                                          color: AppColors.RED,
                                        ),
                                      ),
                                      SizedBox(width: 20.w)
                                    ],
                                  ),
                                ),
                                SizedBox(height: 12.h),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        SizedBox(height: 12.h),
        Align(
          alignment: AlignmentDirectional.centerEnd,
          child: Material(
            color: AppColors.WHITE5,
            borderRadius: BorderRadius.circular(8.r),
            child: InkWell(
              onTap: () {
                AddAdsCubit.get(context).changeNumberCommunication(
                    AddAdsCubit.get(context).numberCommunication + 1);
              },
              borderRadius: BorderRadius.circular(8.r),
              child: MyContainerShape(
                height: 55.r,
                width: 55.r,
                bgContainer: AppColors.TRANSPARENT,
                borderRadius: 8,
                child: SvgPicture.asset(
                  'assets/images/ic_add3.svg',
                  width: 24.r,
                  height: 24.r,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 70.h),
      ],
    );
  }
}
