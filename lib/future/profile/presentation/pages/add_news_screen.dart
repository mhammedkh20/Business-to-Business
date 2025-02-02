import 'package:b2b_app/core/components/my_contianer_shape.dart';
import 'package:b2b_app/core/components/my_elevated_button.dart';
import 'package:b2b_app/core/components/my_text.dart';
import 'package:b2b_app/core/components/my_text_field.dart';
import 'package:b2b_app/core/utils/app_colors.dart';
import 'package:b2b_app/core/utils/app_helpers.dart';
import 'package:b2b_app/future/profile/presentation/manager/add_news_cubit/add_news_cubit.dart';
import 'package:b2b_app/future/profile/presentation/widgets/pick_media_news_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:b2b_app/core/components/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AddNewsScreen extends StatelessWidget {
  const AddNewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: AppLocalizations.of(context)!.addNews,
        elevation: 0,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        children: [
          SizedBox(height: 20.h),
          Row(
            children: [
              MyText(
                title: AppLocalizations.of(context)!.newsMedia,
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
          const PickMediaNewsWidget(),
          SizedBox(height: 24.h),
          MyText(title: AppLocalizations.of(context)!.newsTitle),
          SizedBox(height: 14.h),
          MyTextField(
              textHint: AppLocalizations.of(context)!.pleaseAddTitleNews),
          SizedBox(height: 24.h),
          MyText(title: AppLocalizations.of(context)!.descriptionNews),
          SizedBox(height: 14.h),
          MyTextField(
            textHint: AppLocalizations.of(context)!.pleaseAddDescriptionNews,
            maxLines: 8,
          ),
          SizedBox(height: 24.h),
          MyText(title: AppLocalizations.of(context)!.addHashtag),
          SizedBox(height: 14.h),
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
                    AddNewsCubit.get(context).addHashtag("");
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
            child: BlocBuilder<AddNewsCubit, AddNewsState>(
              builder: (context, state) {
                List<String> hashtag = AddNewsCubit.get(context).hashtag;
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
                                  AddNewsCubit.get(context)
                                      .deleteHashtag(index);
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
          SizedBox(height: 40.h),
          MyElevatedButton(
            title: AppLocalizations.of(context)!.publishNews,
            onPressed: () {
              AppHelpers.navigationBack(context);
            },
            iconPath: 'assets/images/ic_add1.svg',
            iconColor: AppColors.WHITE,
          ),
          SizedBox(height: 100.h),
        ],
      ),
    );
  }
}
