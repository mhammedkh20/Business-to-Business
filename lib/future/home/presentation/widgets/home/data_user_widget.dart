import 'package:b2b_app/core/utils/app_colors.dart';
import 'package:b2b_app/future/home/presentation/widgets/home/user_home_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DataUserWidget extends StatelessWidget {
  const DataUserWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const UserHomeWidget(),
          SvgPicture.asset(
            'assets/images/app_icon/ic_app.svg',
            color: AppColors.BASE_COLOR,
            width: 57.r,
            height: 55.r,
          ),
          const UserHomeWidget(display: false),
        ],
      ),
    );
  }
}
