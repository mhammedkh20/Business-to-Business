import 'package:b2b_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AppLoaderDialog {
  static show(BuildContext context, {bool barrierDismissible = false}) {
    AlertDialog alert = AlertDialog(
      backgroundColor: AppColors.TRANSPARENT,
      contentPadding: EdgeInsets.zero,
      titlePadding: EdgeInsets.zero,
      buttonPadding: EdgeInsets.zero,
      iconPadding: EdgeInsets.zero,
      elevation: 0,
      insetPadding: EdgeInsets.zero,
      actionsPadding: EdgeInsets.zero,
      content: LottieBuilder.asset(
        'assets/json/animation_ljscae7v.json',
      ),
    );

    showDialog(
      barrierDismissible: barrierDismissible,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  static hide(BuildContext context) {
    Navigator.of(context).pop();
  }
}
