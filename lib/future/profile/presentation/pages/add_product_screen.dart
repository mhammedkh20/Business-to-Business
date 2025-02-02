import 'package:b2b_app/core/components/custom_dropdown_menu2.dart';
import 'package:b2b_app/core/components/my_elevated_button.dart';
import 'package:b2b_app/core/components/my_text.dart';
import 'package:b2b_app/core/components/my_text_field.dart';
import 'package:b2b_app/core/utils/app_colors.dart';
import 'package:b2b_app/core/utils/app_helpers.dart';
import 'package:b2b_app/future/profile/presentation/manager/add_product_cubit/add_product_cubit.dart';
import 'package:b2b_app/core/components/pick_media_product_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:b2b_app/core/components/my_app_bar.dart';
import 'package:flutter/material.dart';

class AddProductScreen extends StatelessWidget {
  const AddProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: AppLocalizations.of(context)!.addProduct,
        elevation: 0,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        children: [
          SizedBox(height: 20.h),
          MyText(title: AppLocalizations.of(context)!.productName),
          SizedBox(height: 14.h),
          MyTextField(
              textHint: AppLocalizations.of(context)!.pleaseProductName),
          SizedBox(height: 24.h),
          MyText(title: 'وصف المنتج'),
          SizedBox(height: 14.h),
          MyTextField(
            textHint: 'يرجى اضافة وصف المنتج',
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
            listItems: const ['الباب الرئيسي', "الباب الرئيسي1"],
            onChanged: <String>(String s) {},
          ),
          SizedBox(height: 24.h),
          const MyText(title: 'الصورة الاساسية للمنتج'),
          SizedBox(height: 14.h),
          BlocBuilder<AddProductCubit, AddProductState>(
            builder: (context, state) {
              return PickMediaWidget(
                pickSingle: true,
                media: AddProductCubit.get(context).media,
                onTapDelete: (int index) {
                  AddProductCubit.get(context).deleteMedia(index);
                },
                onTapPickMedia: () {
                  AddProductCubit.get(context).pickMedia();
                },
              );
            },
          ),
          SizedBox(height: 24.h),
          MyText(title: 'صور المنتج الاضافية'),
          SizedBox(height: 14.h),
          BlocBuilder<AddProductCubit, AddProductState>(
            builder: (context, state) {
              return PickMediaWidget(
                pickSingle: false,
                media: AddProductCubit.get(context).productImages,
                onTapDelete: (int index) {
                  AddProductCubit.get(context).deleteProductImage(index);
                },
                onTapPickMedia: () {
                  AddProductCubit.get(context).pickProductImage();
                },
              );
            },
          ),
          SizedBox(height: 24.h),
          MyText(title: 'سعر البيع'),
          SizedBox(height: 14.h),
          MyTextField(
            textHint: 'يرجى اضافة سعر البيع',
          ),
          SizedBox(height: 24.h),
          MyText(title: 'الكمية المتوفرة'),
          SizedBox(height: 14.h),
          MyTextField(
            textHint: 'يرجى اضافة الكمية المتوفر',
          ),
          SizedBox(height: 24.h),
          MyText(title: 'طريقة التوصيل'),
          SizedBox(height: 14.h),
          CustomDropdownMenu2<String>(
            hint: 'يرجى اختيار  طريقة التوصيل',
            listItems: ['طريقة التوصيل2', "طريقة التوصيل1"],
            onChanged: <String>(String s) {},
          ),
          SizedBox(height: 24.h),
          MyText(title: 'طريقة الدفع'),
          SizedBox(height: 14.h),
          CustomDropdownMenu2<String>(
            hint: 'يرجى اختيار  طريقة الدفع',
            listItems: ['طريقة الدفع2', "طريقة الدفع1"],
            onChanged: <String>(String s) {},
          ),
          SizedBox(height: 50.h),
          MyElevatedButton(
            title: 'اضافة المنتج',
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
