import 'package:b2b_app/core/components/my_text.dart';
import 'package:b2b_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemRadioCustom2 extends StatefulWidget {
  final String title;
  final List<String> children;

  const ItemRadioCustom2({
    super.key,
    required this.children,
    required this.title,
  });

  @override
  State<ItemRadioCustom2> createState() => _ItemRadioCustom2State();
}

class _ItemRadioCustom2State extends State<ItemRadioCustom2> {
  int indexSelected = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText(
          title: widget.title,
          fontWeight: FontWeight.bold,
        ),
        SizedBox(height: 14.h),
        ListView.builder(
          itemCount: widget.children.length,
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: MyText(
                        title: widget.children[index],
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                        color: AppColors.GRAY3,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          indexSelected = index;
                        });
                      },
                      child: SvgPicture.asset(
                        indexSelected == index
                            ? 'assets/images/ic_radio_selected.svg'
                            : 'assets/images/ic_radio_unselected.svg',
                        width: 20.r,
                      ),
                    )
                  ],
                ),
                if (widget.children.length - 1 != index) SizedBox(height: 14.h),
              ],
            );
          },
        )
      ],
    );
  }
}
