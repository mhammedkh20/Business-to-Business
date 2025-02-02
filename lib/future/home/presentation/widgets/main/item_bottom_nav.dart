import 'package:b2b_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ItemBottomNav extends StatelessWidget {
  final Function() onTap;
  final bool isSelected;
  final String icon;
  final double width;
  final double height;

  const ItemBottomNav({
    super.key,
    required this.icon,
    required this.onTap,
    required this.height,
    required this.width,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: AppColors.TRANSPARENT,
        child: InkWell(
          onTap: onTap,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(height: 10),
              SvgPicture.asset(
                icon,
                width: width,
                height: height,
                color: isSelected
                    ? AppColors.BLACK
                    : AppColors.ICON_COLOR_BOTTOM_NAV,
              ),
              SizedBox(height: MediaQuery.of(context).padding.bottom),
            ],
          ),
        ),
      ),
    );
  }
}
