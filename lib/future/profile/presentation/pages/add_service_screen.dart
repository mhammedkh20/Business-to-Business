import 'package:b2b_app/core/components/custom_dropdown_menu2.dart';
import 'package:b2b_app/core/components/my_elevated_button.dart';
import 'package:b2b_app/core/components/my_text.dart';
import 'package:b2b_app/core/components/my_text_field.dart';
import 'package:b2b_app/core/utils/app_colors.dart';
import 'package:b2b_app/core/utils/app_helpers.dart';
import 'package:b2b_app/core/components/pick_media_product_widget.dart';
import 'package:b2b_app/future/profile/presentation/manager/add_servuce_cubit/add_service_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:b2b_app/core/components/my_app_bar.dart';
import 'package:flutter/material.dart';

class AddServiceScreen extends StatelessWidget {
  const AddServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: 'اضافة خدمة',
        elevation: 0,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        children: [
          SizedBox(height: 20.h),
          MyText(title: 'اسم الخدمة'),
          SizedBox(height: 14.h),
          MyTextField(textHint: 'يرجى اضافة اسم الخدمة'),
          SizedBox(height: 24.h),
          MyText(title: 'وصف الخدمة'),
          SizedBox(height: 14.h),
          MyTextField(
            textHint: 'يرجى اضافة وصف الخدمة',
            maxLines: 8,
          ),
          SizedBox(height: 24.h),
          MyText(title: 'الباب الرئيسي'),
          SizedBox(height: 14.h),
          CustomDropdownMenu2<String>(
            hint: 'يرجى اختيار  الباب الرئيسي ',
            listItems: ['الباب الرئيسي', "الباب الرئيسي1"],
            onChanged: <String>(String s) {},
          ),
          SizedBox(height: 24.h),
          MyText(title: 'الباب الفرعي'),
          SizedBox(height: 14.h),
          CustomDropdownMenu2<String>(
            hint: 'يرجى اختيار  الباب الفرعي',
            listItems: ['الباب الرئيسي', "الباب الرئيسي1"],
            onChanged: <String>(String s) {},
          ),
          SizedBox(height: 24.h),
          MyText(title: 'الصورة الاساسية للخدمة'),
          SizedBox(height: 14.h),
          BlocBuilder<AddServiceCubit, AddServiceState>(
            builder: (context, state) {
              return PickMediaWidget(
                pickSingle: true,
                media: AddServiceCubit.get(context).media,
                onTapDelete: (int index) {
                  AddServiceCubit.get(context).deleteMedia(index);
                },
                onTapPickMedia: () {
                  AddServiceCubit.get(context).pickMedia();
                },
              );
            },
          ),
          SizedBox(height: 24.h),
          MyText(title: 'صور الخدمة الاضافية'),
          SizedBox(height: 14.h),
          BlocBuilder<AddServiceCubit, AddServiceState>(
            builder: (context, state) {
              return PickMediaWidget(
                pickSingle: false,
                media: AddServiceCubit.get(context).productImages,
                onTapDelete: (int index) {
                  AddServiceCubit.get(context).deleteProductImage(index);
                },
                onTapPickMedia: () {
                  AddServiceCubit.get(context).pickProductImage();
                },
              );
            },
          ),
          SizedBox(height: 24.h),
          MyText(title: 'سعر الخدمة'),
          SizedBox(height: 14.h),
          MyTextField(
            textHint: 'يرجى اضافة سعر الخدمة',
          ),
          SizedBox(height: 24.h),
          MyText(title: 'طريقة الخدمة'),
          SizedBox(height: 14.h),
          CustomDropdownMenu2<String>(
            hint: 'يرجى اختيار  طريقة الخدمة',
            listItems: ['طريقة الدفع2', "طريقة الدفع1"],
            onChanged: <String>(String s) {},
          ),
          SizedBox(height: 24.h),
          MyText(title: 'طريقة الدفع'),
          SizedBox(height: 14.h),
          CustomDropdownMenu2<String>(
            hint: 'يرجى اختيار  طريقة الدفع',
            listItems: ['طريقة التوصيل2', "طريقة التوصيل1"],
            onChanged: <String>(String s) {},
          ),
          SizedBox(height: 50.h),
          MyElevatedButton(
            title: 'اضافة الخدمة',
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
