import 'package:b2b_app/core/components/my_contianer_shape.dart';
import 'package:b2b_app/core/components/my_text_field.dart';
import 'package:b2b_app/core/utils/app_colors.dart';
import 'package:b2b_app/future/add_ads/presentation/manager/add_ads_cubit/add_ads_cubit.dart';
import 'package:b2b_app/future/add_ads/presentation/widgets/pick_media_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:b2b_app/core/components/my_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DescWidget extends StatelessWidget {
  const DescWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Row(
          children: [
            MyText(
              title: AppLocalizations.of(context)!.advertisingMedia,
            ),
            SizedBox(width: 6.w),
            MyText(
              title: AppLocalizations.of(context)!.photosVideo,
              fontSize: 12,
              color: AppColors.GRAY,
            ),
          ],
        ),
        SizedBox(height: 10.h),
        const PickMediaWidget(),
        SizedBox(height: 24.h),
        MyText(title: AppLocalizations.of(context)!.adTitle),
        SizedBox(height: 14.h),
        MyTextField(textHint: AppLocalizations.of(context)!.pleaseAddTitleToAd),
        SizedBox(height: 24.h),
        MyText(title: AppLocalizations.of(context)!.adTitle),
        SizedBox(height: 14.h),
        MyTextField(textHint: AppLocalizations.of(context)!.pleaseAddTitleToAd),
        SizedBox(height: 24.h),
        MyText(title: AppLocalizations.of(context)!.adDescription),
        SizedBox(height: 14.h),
        MyTextField(
          textHint: AppLocalizations.of(context)!.pleaseDescriptionAd,
          maxLines: 8,
        ),
        SizedBox(height: 24.h),
        Row(
          children: [
            Expanded(
              child: MyTextField(
                textHint: 'يرجى اضافة هشتاق “ ترند”',
              ),
            ),
            SizedBox(width: 10.w),
            Material(
              color: AppColors.WHITE5,
              borderRadius: BorderRadius.circular(8.r),
              child: InkWell(
                onTap: () {
                  AddAdsCubit.get(context).addHashtag("");
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
            )
          ],
        ),
        SizedBox(height: 12.h),
        AnimatedSize(
          duration: const Duration(milliseconds: 300),
          child: BlocBuilder<AddAdsCubit, AddAdsState>(
            builder: (context, state) {
              List<String> hashtag = AddAdsCubit.get(context).hashtag;
              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: hashtag.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: MyTextField(
                              textHint: 'يرجى اضافة هشتاق “ ترند”',
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Material(
                            color: AppColors.WHITE5,
                            borderRadius: BorderRadius.circular(8.r),
                            child: InkWell(
                              onTap: () {
                                AddAdsCubit.get(context).deleteHashtag(index);
                              },
                              borderRadius: BorderRadius.circular(8.r),
                              child: MyContainerShape(
                                height: 55.r,
                                width: 55.r,
                                bgContainer: AppColors.TRANSPARENT,
                                borderRadius: 8,
                                child: const Icon(
                                  Icons.delete_forever_outlined,
                                  color: AppColors.RED,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 10.h),
                    ],
                  );
                },
              );
            },
          ),
        ),
        SizedBox(height: 100.h),
      ],
    );
  }
}
