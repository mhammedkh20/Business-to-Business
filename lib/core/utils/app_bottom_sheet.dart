import 'package:b2b_app/core/components/custom_dropdown_menu2.dart';
import 'package:b2b_app/core/components/my_text_field.dart';
import 'package:b2b_app/core/components/my_toggle_button.dart';
import 'package:b2b_app/future/add_ads/presentation/pages/add_ads_screen.dart';
import 'package:b2b_app/future/profile/presentation/pages/add_news_screen.dart';
import 'package:b2b_app/future/profile/presentation/pages/add_product_screen.dart';
import 'package:b2b_app/future/profile/presentation/pages/add_service_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:b2b_app/core/components/my_contianer_shape.dart';
import 'package:b2b_app/core/components/my_elevated_button.dart';
import 'package:b2b_app/core/components/my_text.dart';
import 'package:b2b_app/core/utils/app_colors.dart';
import 'package:b2b_app/core/utils/app_helpers.dart';
import 'package:b2b_app/future/home/presentation/widgets/home/item_inform.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter_svg/svg.dart';

class AppBottomSheet {
  static listReportingBottomSheet(BuildContext context) {
    PageController? controller = PageController();
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.WHITE,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(34.r),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 10.h),
              MyContainerShape(
                bgContainer: AppColors.TEXT_LIGHT,
                borderRadius: 5,
                width: 60.w,
                height: 6.h,
              ),
              ExpandablePageView(
                controller: controller,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 4.h),
                      ListView(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          ItemInform(
                            title: 'محتوى غير ملائم',
                            onTap: () {
                              controller.animateToPage(1,
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.bounceInOut);
                            },
                          ),
                          ItemInform(
                              title: 'محتوى غير ملائم',
                              onTap: () {
                                controller.animateToPage(1,
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.bounceInOut);
                              }),
                          ItemInform(
                              title: 'محتوى غير ملائم',
                              onTap: () {
                                controller.animateToPage(1,
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.bounceInOut);
                              }),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 20.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                              controller.animateToPage(0,
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.bounceInOut);
                            },
                            icon: Icon(
                              Icons.arrow_back_ios,
                              size: 15.r,
                              color: AppColors.GRAY3,
                            ),
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(
                                'assets/images/ic_inform.svg',
                                width: 18.r,
                              ),
                              SizedBox(width: 12.w),
                              MyText(title: 'إبلاغ', fontSize: 16),
                            ],
                          ),
                          IconButton(
                            onPressed: null,
                            icon: Icon(
                              Icons.arrow_back_ios,
                              size: 15.r,
                              color: AppColors.TRANSPARENT,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16.h),
                      const Divider(
                        height: 1,
                        thickness: 1,
                        color: AppColors.DIVIDER_COLOR,
                      ),
                      SizedBox(height: 32.h),
                      MyText(
                        title: 'هل يخالف هذا معايير مجتمعنا؟',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(height: 14.h),
                      MyText(
                        title:
                            'توضح معاييرنا ما نقوم به وما لا نسمح به على B2B. ونقوم بمراجعة معاييرنا وتحديثها بصفة منتظمة، بمساعدة الخبراء.',
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: AppColors.GRAY3,
                      ),
                      SizedBox(height: 70.h),
                      Row(
                        children: [
                          Expanded(
                            child: MyElevatedButton(
                              title: 'الغاء',
                              onPressed: () {
                                AppHelpers.navigationBack(context);
                              },
                              background: AppColors.WHITE,
                              borderColor: AppColors.TRANSPARENT,
                              activeColor: AppColors.TRANSPARENT,
                              titleColor: AppColors.GRAY3,
                              borderRaduis: 40,
                            ),
                          ),
                          Expanded(
                            child: MyElevatedButton(
                              borderRaduis: 40,
                              title: 'إرسال',
                              onPressed: () {
                                AppHelpers.navigationBack(context);
                              },
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).padding.bottom + 20.h),
            ],
          ),
        );
      },
    );
  }

  static formMyDataBottomSheet(BuildContext context) {
    final TextEditingController _dateController = TextEditingController();

    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.WHITE,
      isScrollControlled: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(34.r),
        ),
      ),
      builder: (BuildContext context) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * .9,
          child: Column(
            children: [
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/images/ic_my_data.svg',
                    width: 24.r,
                  ),
                  SizedBox(width: 8.w),
                  MyText(
                    title: AppLocalizations.of(context)!.myData,
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              Divider(height: 2.h, thickness: 2, color: AppColors.WHITE6),
              SizedBox(height: 24.h),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: MyText(title: 'الاسم *'),
                        ),
                        Expanded(
                          flex: 2,
                          child: MyTextField(
                            controller:
                                TextEditingController(text: 'صلاح خطاب'),
                            textHint: '',
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            textColor: AppColors.BLACK,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      children: [
                        Expanded(
                          child: MyText(title: 'الكنية'),
                        ),
                        Expanded(
                          flex: 2,
                          child: MyTextField(
                            controller:
                                TextEditingController(text: 'مصمم جرافيك'),
                            textHint: '',
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            textColor: AppColors.BLACK,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      children: [
                        Expanded(
                          child: MyText(title: 'اللقب'),
                        ),
                        Expanded(
                          flex: 2,
                          child: CustomDropdownMenu2<String>(
                            enabledBorder: true,
                            hint: 'اختيار التصنيف',
                            listItems: const [
                              'المهندس',
                              'طبيب',
                            ],
                            onChanged: <String>(String s) {},
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      children: [
                        Expanded(
                          child: MyText(title: 'تاريخ الميلاد'),
                        ),
                        Expanded(
                          flex: 2,
                          child: MyTextField(
                            controller: _dateController,
                            textHint: '',
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            textColor: AppColors.BLACK,
                            readOnly: true,
                            onTap: () async {
                              _dateController.text =
                                  await AppHelpers.selectDate(context) ?? "";
                            },
                            suffixWidget: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SvgPicture.asset(
                                  'assets/images/ic_calender.svg',
                                  width: 20.r,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 40.h),
                    MyText(
                      title: 'محل الاقامة',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(height: 16.h),
                    Row(
                      children: [
                        Expanded(
                          child: MyText(title: 'الدولة'),
                        ),
                        Expanded(
                          flex: 2,
                          child: CustomDropdownMenu2<String>(
                            enabledBorder: true,
                            initValue: 'فلسطين',
                            notify: true,
                            listItems: const [
                              'فلسطين',
                              'العراق',
                              'سوريا',
                              'الاردن',
                            ],
                            onChanged: <String>(String s) {},
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      children: [
                        Expanded(
                          child: MyText(title: 'المدينة'),
                        ),
                        Expanded(
                          flex: 2,
                          child: CustomDropdownMenu2<String>(
                            enabledBorder: true,
                            initValue: 'دير البلح',
                            notify: true,
                            listItems: const [
                              'دير البلح',
                              'غزة',
                              'رفح',
                            ],
                            onChanged: <String>(String s) {},
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 40.h),
                    const MyToggleButton(
                      title: 'الحالة الاجتماعية',
                      values: [
                        'أعزب',
                        'متزوج',
                      ],
                    ),
                    SizedBox(height: 20.h),
                    const MyToggleButton(
                      title: 'الجنس',
                      values: [
                        'ذكر',
                        'أنثى',
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      children: [
                        Expanded(
                          child: MyText(title: 'فصيلة الدم'),
                        ),
                        Expanded(
                          flex: 2,
                          child: CustomDropdownMenu2<String>(
                            enabledBorder: true,
                            hint: 'فصيلة الدم',
                            listItems: const [
                              '+ A',
                              '+ B',
                              '+ C',
                            ],
                            onChanged: <String>(String s) {},
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 50.h),
                    Row(
                      children: [
                        Expanded(
                          child: MyElevatedButton(
                            title: AppLocalizations.of(context)!.cancel,
                            titleColor: AppColors.GRAY3,
                            onPressed: () {
                              AppHelpers.navigationBack(context);
                            },
                            enabledBorder: true,
                            background: AppColors.WHITE,
                            borderColor: AppColors.WHITE7,
                            borderRaduis: 27,
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Expanded(
                          flex: 3,
                          child: MyElevatedButton(
                            title:
                                AppLocalizations.of(context)!.saveModifications,
                            onPressed: () {
                              AppHelpers.navigationBack(context);
                            },
                            borderRaduis: 27,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).padding.bottom + 20.h),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  static stateOfHumanityBottomSheet(BuildContext context) {
    final TextEditingController _dateController = TextEditingController();

    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.WHITE,
      isScrollControlled: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(34.r)),
      ),
      builder: (BuildContext context) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * .9,
          child: Column(
            children: [
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/images/ic_humanitarian_situation.svg',
                    width: 24.r,
                  ),
                  SizedBox(width: 8.w),
                  MyText(
                    title: AppLocalizations.of(context)!.humanitarianSituation,
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              Divider(height: 2.h, thickness: 2, color: AppColors.WHITE6),
              SizedBox(height: 24.h),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  children: [
                    MyText(title: 'اسم الحالة'),
                    SizedBox(height: 10.h),
                    MyTextField(
                      controller: TextEditingController(text: ''),
                      textHint: 'يرجى ادخال اسم الحالة',
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      textColor: AppColors.BLACK,
                    ),
                    SizedBox(height: 20.h),
                    MyText(title: 'تاريخ الميلاد'),
                    SizedBox(height: 10.h),
                    MyTextField(
                      controller: _dateController,
                      textHint: 'يرجى ادخال العمر',
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      textColor: AppColors.BLACK,
                      readOnly: true,
                      onTap: () async {
                        _dateController.text =
                            await AppHelpers.selectDate(context) ?? "";
                      },
                      suffixWidget: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            'assets/images/ic_calender.svg',
                            width: 20.r,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.h),
                    MyText(title: 'فصيلة الدم'),
                    SizedBox(height: 10.h),
                    CustomDropdownMenu2<String>(
                      enabledBorder: true,
                      hint: 'يرجى اختيار فصيلة الدم',
                      listItems: const [
                        'a+',
                        'b+',
                        'c+',
                      ],
                      onChanged: <String>(String s) {},
                    ),
                    SizedBox(height: 20.h),
                    MyText(title: 'الدولة'),
                    SizedBox(height: 10.h),
                    CustomDropdownMenu2<String>(
                      enabledBorder: true,
                      hint: 'يرجى تحديد الدولة',
                      listItems: const [
                        'فلسطين',
                        'الاردن',
                        'سوريا',
                      ],
                      onChanged: <String>(String s) {},
                    ),
                    SizedBox(height: 20.h),
                    MyText(title: 'المدينة'),
                    SizedBox(height: 10.h),
                    CustomDropdownMenu2<String>(
                      enabledBorder: true,
                      hint: 'يرجى تحديدالمدينة',
                      listItems: const [
                        'غزة',
                        'رفح',
                        'خانيونس',
                      ],
                      onChanged: <String>(String s) {},
                    ),
                    SizedBox(height: 20.h),
                    MyText(title: 'اسم الحي'),
                    SizedBox(height: 10.h),
                    MyTextField(
                      controller: TextEditingController(text: ''),
                      textHint: 'يرجى اضافة اسم الحي/ المستشفى',
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      textColor: AppColors.BLACK,
                    ),
                    SizedBox(height: 20.h),
                    MyText(title: 'رقم الجوال'),
                    SizedBox(height: 10.h),
                    MyTextField(
                      controller: TextEditingController(text: ''),
                      textHint: 'يرجى اضافة رقم الجوال',
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      textColor: AppColors.BLACK,
                    ),
                    SizedBox(height: 24.h),
                    Row(
                      children: [
                        Expanded(
                          child: MyElevatedButton(
                            title: AppLocalizations.of(context)!.cancel,
                            titleColor: AppColors.GRAY3,
                            onPressed: () {
                              AppHelpers.navigationBack(context);
                            },
                            enabledBorder: true,
                            background: AppColors.WHITE,
                            borderColor: AppColors.WHITE7,
                            borderRaduis: 27,
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Expanded(
                          flex: 3,
                          child: MyElevatedButton(
                            title:
                                AppLocalizations.of(context)!.saveModifications,
                            onPressed: () {
                              AppHelpers.navigationBack(context);
                            },
                            borderRaduis: 27,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).padding.bottom + 20.h),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  static actionForProductBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.WHITE,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(34.r),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 10.h),
              MyContainerShape(
                bgContainer: AppColors.TEXT_LIGHT,
                borderRadius: 5,
                width: 60.w,
                height: 6.h,
              ),
              ListView(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  ItemInform(
                    title: AppLocalizations.of(context)!.modifyProduct,
                    onTap: () {},
                    icon: 'assets/images/ic_edit1.svg',
                  ),
                  ItemInform(
                    title: AppLocalizations.of(context)!.deleteProduct,
                    onTap: () {},
                    icon: 'assets/images/ic_delete.svg',
                  ),
                  ItemInform(
                    title: AppLocalizations.of(context)!.hideProductDisplay,
                    onTap: () {},
                    icon: 'assets/images/ic_hide.svg',
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).padding.bottom + 20.h),
            ],
          ),
        );
      },
    );
  }

  static additionOptionsBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.WHITE,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(34.r),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 10.h),
              MyContainerShape(
                bgContainer: AppColors.TEXT_LIGHT,
                borderRadius: 5,
                width: 60.w,
                height: 6.h,
              ),
              ListView(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  ItemInform(
                    title: AppLocalizations.of(context)!.addAnAd,
                    onTap: () {
                      AppHelpers.navigationBack(context);
                      AppHelpers.navigationToPage(
                          context, const AddAdsScreen());
                    },
                    icon: 'assets/images/ic_add_ad.svg',
                    iconTrealing: 'assets/images/ic_add2.svg',
                  ),
                  ItemInform(
                    title: AppLocalizations.of(context)!.addNews,
                    onTap: () {
                      AppHelpers.navigationBack(context);
                      AppHelpers.navigationToPage(
                          context, const AddNewsScreen());
                    },
                    icon: 'assets/images/ic_add_news.svg',
                    iconTrealing: 'assets/images/ic_add2.svg',
                  ),
                  ItemInform(
                    title: AppLocalizations.of(context)!.addAnProduct,
                    onTap: () {
                      AppHelpers.navigationBack(context);
                      AppHelpers.navigationToPage(
                          context, const AddProductScreen());
                    },
                    icon: 'assets/images/ic_add_product.svg',
                    iconTrealing: 'assets/images/ic_add2.svg',
                  ),
                  ItemInform(
                    title: AppLocalizations.of(context)!.addAnService,
                    onTap: () {
                      AppHelpers.navigationBack(context);
                      AppHelpers.navigationToPage(
                          context, const AddServiceScreen());
                    },
                    icon: 'assets/images/ic_add_service.svg',
                    iconTrealing: 'assets/images/ic_add2.svg',
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).padding.bottom + 20.h),
            ],
          ),
        );
      },
    );
  }
}
