import 'package:b2b_app/core/components/my_contianer_shape.dart';
import 'package:b2b_app/core/components/my_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/app_colors.dart';

class ItemQuestions extends StatefulWidget {
  const ItemQuestions({super.key});

  @override
  State<ItemQuestions> createState() => _ItemQuestionsState();
}

class _ItemQuestionsState extends State<ItemQuestions> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return MyContainerShape(
        borderRadius: 10,
        paddingHorizontal: 12,
        enableBorder: isExpanded,
        enableShadow: false,
        colorBorder: AppColors.BASE_COLOR,
        paddingVertical: 12,
        bgContainer: AppColors.WHITE5,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyText(
                  title: 'كيف أحصل على أفضل سعر؟',
                  fontSize: 12,
                  fontWeight: isExpanded ? FontWeight.bold : FontWeight.w400,
                  color: isExpanded ? AppColors.BASE_COLOR : AppColors.BLACK,
                ),
                IconButton(
                  padding: EdgeInsets.symmetric(horizontal: 4.r, vertical: 4.r),
                  onPressed: () {
                    setState(() {
                      isExpanded = !isExpanded;
                    });
                  },
                  constraints: const BoxConstraints(),
                  icon: Icon(
                    isExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                    color: AppColors.BLACK,
                  ),
                ),
              ],
            ),
            AnimatedSize(
              duration: const Duration(milliseconds: 300),
              child: SizedBox(
                height: isExpanded ? null : 0,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 12.h),
                    MyText(
                      textAlign: TextAlign.start,
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                      color: AppColors.GRAY3,
                      height: 1.8,
                      title:
                          'غالباً ما يحتاج العثور على المنتج الذي ترغب في شراءه مجهوداً كبيراً إذا قمت بالتسوق من المتاجر التقليدية الموجودة بمراكز التسوق، ولكن إذا قررت التسوق أون لاين فإن عملية البحث والعثور على المنتج ستكون أكثر سهولة من خلال تصفح بعض قنوات التسوق الإلكترونية للحصول على أفضل منتج.',
                    ),
                    SizedBox(height: 10.h),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
