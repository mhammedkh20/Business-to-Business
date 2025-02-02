import 'package:b2b_app/core/components/my_divider.dart';
import 'package:b2b_app/core/components/my_elevated_button.dart';
import 'package:b2b_app/core/components/my_text_field.dart';
import 'package:b2b_app/core/utils/app_bottom_sheet.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:b2b_app/core/components/my_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:b2b_app/core/components/my_contianer_shape.dart';
import 'package:b2b_app/core/utils/app_colors.dart';
import 'package:b2b_app/future/profile/presentation/manager/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MyDataUserWidget extends StatelessWidget {
  const MyDataUserWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController _bdController =
        TextEditingController(text: '1997/05/01');
    TextEditingController _residenceController =
        TextEditingController(text: 'المدينة - شارع الملك');
    TextEditingController _maritalStatusController =
        TextEditingController(text: 'متزوج');
    TextEditingController _genderController =
        TextEditingController(text: 'ذكر');
    TextEditingController _bloodTypeController =
        TextEditingController(text: '+A');
    TextEditingController _phoneController =
        TextEditingController(text: '0591234567 - 00966');
    TextEditingController _locationController =
        TextEditingController(text: 'فلسطين - غزة');
    TextEditingController _start_end_dateCon =
        TextEditingController(text: '2010/05/01 - 2011/05/01');

    TextEditingController _majorController =
        TextEditingController(text: 'مصمم جرافيك');
    TextEditingController _major3Controller =
        TextEditingController(text: 'بكالوريوس');

    TextEditingController _addressController =
        TextEditingController(text: 'المدينة/ شارع فهد -98');
    TextEditingController _major2Controller =
        TextEditingController(text: 'كاتب محتوى');
    TextEditingController _emailController =
        TextEditingController(text: 'salah@example,com');

    TextEditingController _urlFaceController =
        TextEditingController(text: ProfileCubit.get(context).urlFace);
    TextEditingController _urlInstegramController =
        TextEditingController(text: ProfileCubit.get(context).urlInstagram);
    TextEditingController _urlWhatsController =
        TextEditingController(text: ProfileCubit.get(context).urlWhatsApp);
    TextEditingController _urltwitterController =
        TextEditingController(text: ProfileCubit.get(context).urlTwitter);

    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        bool editConnection = ProfileCubit.get(context).editConnectionData;
        bool editWork = ProfileCubit.get(context).editWorkData;
        bool editEducation = ProfileCubit.get(context).editEducationData;
        bool editAddress = ProfileCubit.get(context).editAddressData;
        ProfileCubit instance = ProfileCubit.get(context);
        return ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          children: [
            Column(
              children: [
                MyContainerShape(
                  bgContainer: AppColors.WHITE5,
                  borderRadius: 4,
                  paddingHorizontal: 12,
                  paddingVertical: 16,
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/images/ic_my_data.svg',
                        width: 24.r,
                      ),
                      SizedBox(width: 8.w),
                      MyText(
                        title: AppLocalizations.of(context)!.myData,
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          AppBottomSheet.formMyDataBottomSheet(context);
                        },
                        child: SvgPicture.asset(
                          'assets/images/ic_edit.svg',
                          width: 20.r,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    SizedBox(width: 16.w),
                    Expanded(
                      flex: 2,
                      child: MyText(
                        title: 'تاريخ الميلاد',
                        fontWeight: FontWeight.w300,
                        color: AppColors.GRAY3,
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: MyTextField(
                        controller: _bdController,
                        textHint: '',
                        fontWeight: FontWeight.w400,
                        isBorder: false,
                        filledColor: false,
                        readOnly: true,
                        fontSize: 14,
                        textColor: AppColors.BLACK,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                const MyDivider(),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    SizedBox(width: 16.w),
                    Expanded(
                      flex: 2,
                      child: MyText(
                        title: AppLocalizations.of(context)!.residence,
                        fontWeight: FontWeight.w300,
                        color: AppColors.GRAY3,
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: MyTextField(
                        controller: _residenceController,
                        textHint: '',
                        fontWeight: FontWeight.w400,
                        isBorder: false,
                        filledColor: false,
                        readOnly: true,
                        fontSize: 14,
                        textColor: AppColors.BLACK,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                const MyDivider(),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    SizedBox(width: 16.w),
                    Expanded(
                      flex: 2,
                      child: MyText(
                        title: 'الحالة الاجتماعية',
                        fontWeight: FontWeight.w300,
                        color: AppColors.GRAY3,
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: MyTextField(
                        controller: _maritalStatusController,
                        textHint: '',
                        fontWeight: FontWeight.w400,
                        isBorder: false,
                        filledColor: false,
                        readOnly: true,
                        fontSize: 14,
                        textColor: AppColors.BLACK,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                const MyDivider(),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    SizedBox(width: 16.w),
                    Expanded(
                      flex: 2,
                      child: MyText(
                        title: 'الجنس',
                        fontWeight: FontWeight.w300,
                        color: AppColors.GRAY3,
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: MyTextField(
                        controller: _genderController,
                        textHint: '',
                        fontWeight: FontWeight.w400,
                        isBorder: false,
                        filledColor: false,
                        readOnly: true,
                        fontSize: 14,
                        textColor: AppColors.BLACK,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                const MyDivider(),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    SizedBox(width: 16.w),
                    Expanded(
                      flex: 2,
                      child: MyText(
                        title: 'فصيلة الدم',
                        fontWeight: FontWeight.w300,
                        color: AppColors.GRAY3,
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: MyTextField(
                        controller: _bloodTypeController,
                        textHint: '',
                        fontWeight: FontWeight.w400,
                        isBorder: false,
                        filledColor: false,
                        readOnly: true,
                        fontSize: 14,
                        textColor: AppColors.BLACK,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Column(
              children: [
                MyContainerShape(
                  bgContainer: AppColors.WHITE5,
                  borderRadius: 4,
                  paddingHorizontal: 12,
                  paddingVertical: 16,
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/images/ic_connection.svg',
                        width: 24.r,
                      ),
                      SizedBox(width: 8.w),
                      MyText(
                        title: AppLocalizations.of(context)!.connection,
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          instance.changeEditConnection(true);
                          instance.fillSocial(
                            urlFace: _urlFaceController.text.trim(),
                            urlInstagram: _urlInstegramController.text.trim(),
                            urlTwitter: _urltwitterController.text.trim(),
                            urlWhatsApp: _urlWhatsController.text.trim(),
                          );
                        },
                        child: editConnection
                            ? MyElevatedButton(
                                title: AppLocalizations.of(context)!.update,
                                onPressed: () {
                                  instance.changeEditConnection(false);
                                },
                                width: 80,
                                height: 30,
                              )
                            : SvgPicture.asset(
                                'assets/images/ic_edit.svg',
                                width: 20.r,
                              ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    SizedBox(width: 16.w),
                    Expanded(
                      flex: 2,
                      child: MyText(
                        title: 'رقم الجوال',
                        fontWeight: FontWeight.w300,
                        color: AppColors.GRAY3,
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: MyTextField(
                        controller: _phoneController,
                        textHint: '',
                        fontWeight: FontWeight.w400,
                        isBorder: editConnection,
                        filledColor: editConnection,
                        readOnly: !editConnection,
                        fontSize: 14,
                        textColor: AppColors.BLACK,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                const MyDivider(),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    SizedBox(width: 16.w),
                    Expanded(
                      flex: 2,
                      child: MyText(
                        title: 'البريد الالكتروني',
                        fontWeight: FontWeight.w300,
                        color: AppColors.GRAY3,
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: MyTextField(
                        controller: _emailController,
                        textHint: '',
                        fontWeight: FontWeight.w400,
                        isBorder: editConnection,
                        filledColor: editConnection,
                        readOnly: !editConnection,
                        fontSize: 14,
                        textColor: AppColors.BLACK,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                const MyDivider(),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    if (!editConnection) ...[
                      SizedBox(width: 16.w),
                      Expanded(
                        flex: 2,
                        child: MyText(
                          title: 'التواصل الاجتماعي',
                          fontWeight: FontWeight.w300,
                          color: AppColors.GRAY3,
                        ),
                      ),
                    ],
                    Expanded(
                      flex: 3,
                      child: editConnection
                          ? Column(
                              children: [
                                SizedBox(height: 10.h),
                                Row(
                                  children: [
                                    SizedBox(width: 16.w),
                                    Expanded(
                                      flex: 2,
                                      child: MyText(
                                        title: 'رابط فيسبوك',
                                        fontWeight: FontWeight.w300,
                                        color: AppColors.GRAY3,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: MyTextField(
                                        controller: _urlFaceController,
                                        textHint: '',
                                        fontWeight: FontWeight.w400,
                                        isBorder: editConnection,
                                        filledColor: editConnection,
                                        readOnly: !editConnection,
                                        fontSize: 14,
                                        textColor: AppColors.BLACK,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10.h),
                                const MyDivider(),
                                SizedBox(height: 10.h),
                                Row(
                                  children: [
                                    SizedBox(width: 16.w),
                                    Expanded(
                                      flex: 2,
                                      child: MyText(
                                        title: 'رابط انستقرام',
                                        fontWeight: FontWeight.w300,
                                        color: AppColors.GRAY3,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: MyTextField(
                                        controller: _urlInstegramController,
                                        textHint: '',
                                        fontWeight: FontWeight.w400,
                                        isBorder: editConnection,
                                        filledColor: editConnection,
                                        readOnly: !editConnection,
                                        fontSize: 14,
                                        textColor: AppColors.BLACK,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10.h),
                                const MyDivider(),
                                SizedBox(height: 10.h),
                                Row(
                                  children: [
                                    SizedBox(width: 16.w),
                                    Expanded(
                                      flex: 2,
                                      child: MyText(
                                        title: 'رابط تويتر',
                                        fontWeight: FontWeight.w300,
                                        color: AppColors.GRAY3,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: MyTextField(
                                        controller: _urltwitterController,
                                        textHint: '',
                                        fontWeight: FontWeight.w400,
                                        isBorder: editConnection,
                                        filledColor: editConnection,
                                        readOnly: !editConnection,
                                        fontSize: 14,
                                        textColor: AppColors.BLACK,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10.h),
                                const MyDivider(),
                                SizedBox(height: 10.h),
                                Row(
                                  children: [
                                    SizedBox(width: 16.w),
                                    Expanded(
                                      flex: 2,
                                      child: MyText(
                                        title: 'رابط واتس',
                                        fontWeight: FontWeight.w300,
                                        color: AppColors.GRAY3,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: MyTextField(
                                        controller: _urlWhatsController,
                                        textHint: '',
                                        fontWeight: FontWeight.w400,
                                        isBorder: editConnection,
                                        filledColor: editConnection,
                                        readOnly: !editConnection,
                                        fontSize: 14,
                                        textColor: AppColors.BLACK,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10.h),
                              ],
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                if (_urlFaceController.text
                                    .trim()
                                    .isNotEmpty) ...[
                                  SvgPicture.asset(
                                    'assets/images/ic_facebook.svg',
                                  ),
                                ],
                                if (_urlInstegramController.text
                                    .trim()
                                    .isNotEmpty) ...[
                                  SizedBox(width: 8.w),
                                  SvgPicture.asset(
                                    'assets/images/ic_instgram.svg',
                                  ),
                                ],
                                if (_urltwitterController.text
                                    .trim()
                                    .isNotEmpty) ...[
                                  SizedBox(width: 8.w),
                                  SvgPicture.asset(
                                    'assets/images/ic_twiter.svg',
                                  ),
                                ],
                                if (_urlWhatsController.text
                                    .trim()
                                    .isNotEmpty) ...[
                                  SizedBox(width: 8.w),
                                  SvgPicture.asset(
                                    'assets/images/ic_whatsapp.svg',
                                  ),
                                ]
                              ],
                            ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
              ],
            ),
            SizedBox(height: 20.h),
            Column(
              children: [
                MyContainerShape(
                  bgContainer: AppColors.WHITE5,
                  borderRadius: 4,
                  paddingHorizontal: 12,
                  paddingVertical: 16,
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/images/ic_work.svg',
                        width: 24.r,
                      ),
                      SizedBox(width: 8.w),
                      MyText(
                        title: AppLocalizations.of(context)!.theJob,
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          instance.changeEditWork(true);
                        },
                        child: editWork
                            ? MyElevatedButton(
                                title: AppLocalizations.of(context)!.update,
                                onPressed: () {
                                  instance.changeEditWork(false);
                                },
                                width: 80,
                                height: 30,
                              )
                            : SvgPicture.asset(
                                'assets/images/ic_edit.svg',
                                width: 20.r,
                              ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    SizedBox(width: 16.w),
                    Expanded(
                      flex: 2,
                      child: MyText(
                        title: 'شركة كيان',
                        fontWeight: FontWeight.w300,
                        color: AppColors.GRAY3,
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Column(
                        children: [
                          MyTextField(
                            controller: _majorController,
                            textHint: '',
                            fontWeight: FontWeight.w400,
                            isBorder: editWork,
                            filledColor: editWork,
                            readOnly: !editWork,
                            fontSize: 14,
                            textColor: AppColors.BLACK,
                          ),
                          MyTextField(
                            controller: _locationController,
                            textHint: '',
                            fontWeight: FontWeight.w400,
                            isBorder: editWork,
                            filledColor: editWork,
                            readOnly: !editWork,
                            fontSize: 14,
                            textColor: AppColors.BLACK,
                          ),
                          MyTextField(
                            controller: _start_end_dateCon,
                            textHint: '',
                            fontWeight: FontWeight.w400,
                            isBorder: editWork,
                            filledColor: editWork,
                            readOnly: !editWork,
                            fontSize: 14,
                            textColor: AppColors.BLACK,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                const MyDivider(),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    SizedBox(width: 16.w),
                    Expanded(
                      flex: 2,
                      child: MyText(
                        title: 'جامعة الاقصى',
                        fontWeight: FontWeight.w300,
                        color: AppColors.GRAY3,
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Column(
                        children: [
                          MyTextField(
                            controller: _major2Controller,
                            textHint: '',
                            fontWeight: FontWeight.w400,
                            isBorder: editWork,
                            filledColor: editWork,
                            readOnly: !editWork,
                            fontSize: 14,
                            textColor: AppColors.BLACK,
                          ),
                          MyTextField(
                            controller: _locationController,
                            textHint: '',
                            fontWeight: FontWeight.w400,
                            isBorder: editWork,
                            filledColor: editWork,
                            readOnly: !editWork,
                            fontSize: 14,
                            textColor: AppColors.BLACK,
                          ),
                          MyTextField(
                            controller: _start_end_dateCon,
                            textHint: '',
                            fontWeight: FontWeight.w400,
                            isBorder: editWork,
                            filledColor: editWork,
                            readOnly: !editWork,
                            fontSize: 14,
                            textColor: AppColors.BLACK,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                const MyDivider(),
                SizedBox(height: 10.h),
              ],
            ),
            SizedBox(height: 10.h),
            Column(
              children: [
                MyContainerShape(
                  bgContainer: AppColors.WHITE5,
                  borderRadius: 4,
                  paddingHorizontal: 12,
                  paddingVertical: 16,
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/images/ic_education.svg',
                        width: 24.r,
                      ),
                      SizedBox(width: 8.w),
                      MyText(
                        title: AppLocalizations.of(context)!.education,
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          instance.changeEditEducation(true);
                        },
                        child: editEducation
                            ? MyElevatedButton(
                                title: AppLocalizations.of(context)!.update,
                                onPressed: () {
                                  instance.changeEditEducation(false);
                                },
                                width: 80,
                                height: 30,
                              )
                            : SvgPicture.asset(
                                'assets/images/ic_edit.svg',
                                width: 20.r,
                              ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    SizedBox(width: 16.w),
                    Expanded(
                      flex: 2,
                      child: MyText(
                        title: 'جامعة الامة',
                        fontWeight: FontWeight.w300,
                        color: AppColors.GRAY3,
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Column(
                        children: [
                          MyTextField(
                            controller: _major3Controller,
                            textHint: '',
                            fontWeight: FontWeight.w400,
                            isBorder: editEducation,
                            filledColor: editEducation,
                            readOnly: !editEducation,
                            fontSize: 14,
                            textColor: AppColors.BLACK,
                          ),
                          MyTextField(
                            controller: _locationController,
                            textHint: '',
                            fontWeight: FontWeight.w400,
                            isBorder: editEducation,
                            filledColor: editEducation,
                            readOnly: !editEducation,
                            fontSize: 14,
                            textColor: AppColors.BLACK,
                          ),
                          MyTextField(
                            controller: _start_end_dateCon,
                            textHint: '',
                            fontWeight: FontWeight.w400,
                            isBorder: editEducation,
                            filledColor: editEducation,
                            readOnly: !editEducation,
                            fontSize: 14,
                            textColor: AppColors.BLACK,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                const MyDivider(),
                SizedBox(height: 10.h),
              ],
            ),
            SizedBox(height: 10.h),
            Column(
              children: [
                MyContainerShape(
                  bgContainer: AppColors.WHITE5,
                  borderRadius: 4,
                  paddingHorizontal: 12,
                  paddingVertical: 16,
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/images/ic_locations1.svg',
                        width: 24.r,
                      ),
                      SizedBox(width: 8.w),
                      MyText(
                        title: AppLocalizations.of(context)!.address,
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          instance.changeEditAddress(true);
                        },
                        child: editAddress
                            ? MyElevatedButton(
                                title: AppLocalizations.of(context)!.update,
                                onPressed: () {
                                  instance.changeEditAddress(false);
                                },
                                width: 80,
                                height: 30,
                              )
                            : SvgPicture.asset(
                                'assets/images/ic_edit.svg',
                                width: 20.r,
                              ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    SizedBox(width: 16.w),
                    Expanded(
                      flex: 2,
                      child: MyText(
                        title: 'السكن الحالي',
                        fontWeight: FontWeight.w300,
                        color: AppColors.GRAY3,
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: MyTextField(
                        controller: _addressController,
                        textHint: '',
                        fontWeight: FontWeight.w400,
                        isBorder: editAddress,
                        filledColor: editAddress,
                        readOnly: !editAddress,
                        fontSize: 14,
                        textColor: AppColors.BLACK,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                const MyDivider(),
                SizedBox(height: 10.h),
              ],
            ),
          ],
        );
      },
    );
  }
}
