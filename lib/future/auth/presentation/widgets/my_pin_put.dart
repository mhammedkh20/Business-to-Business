import 'package:b2b_app/core/utils/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyPinput extends StatelessWidget {
  final TextEditingController? textEditingController;
  const MyPinput({super.key, this.textEditingController});

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 60.r,
      height: 60.r,
      textStyle: const TextStyle(
        fontSize: 20,
        fontFamily: 'Montserrat',
        color: Color.fromRGBO(30, 60, 87, 1),
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        color: AppColors.WHITE2,
        border: Border.all(color: AppColors.BORDER, width: 2),
        borderRadius: BorderRadius.circular(10.r),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      color: AppColors.BASE_COLOR.withOpacity(.05),
      border: Border.all(color: AppColors.BASE_COLOR),
      borderRadius: BorderRadius.circular(10.r),
    );

    final submittedPinTheme = defaultPinTheme.copyWith();

    return Pinput(
      controller: textEditingController,
      pinAnimationType: PinAnimationType.fade,
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: focusedPinTheme,
      submittedPinTheme: submittedPinTheme,
      validator: (s) {
        if (s == null || s.isEmpty) {
          return AppLocalizations.of(context)!.enterTheCode;
        }
        if (s.length != 4) {
          return AppLocalizations.of(context)!.enterTheCode;
        }
        return null;
      },
      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
      showCursor: true,
      onCompleted: (pin) => print(pin),
    );
  }
}
