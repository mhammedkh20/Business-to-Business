import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MyIconButton extends StatelessWidget {
  final String? svgPath;
  final IconData? iconData;
  final Function() onPressed;
  final double padding;
  final Color? colorIcon;

  const MyIconButton({
    Key? key,
    required this.onPressed,
    this.iconData,
    this.colorIcon,
    this.svgPath,
    this.padding = 4,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      constraints: const BoxConstraints(),
      padding: EdgeInsets.symmetric(horizontal: padding, vertical: padding),
      onPressed: onPressed,
      icon: iconData != null
          ? Icon(iconData)
          : SvgPicture.asset(
              svgPath!,
              width: 40,
            ),
      color: colorIcon,
    );
  }
}
