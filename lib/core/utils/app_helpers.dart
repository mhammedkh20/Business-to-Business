import 'package:b2b_app/core/storage/pref/shared_pref_controller.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:b2b_app/core/components/my_text.dart';
import 'package:b2b_app/core/services/navigation_service.dart';
import 'package:b2b_app/core/utils/app_colors.dart';
import 'package:b2b_app/locator.dart';

class AppHelpers {
  static Map<String, String> getHeader() {
    return SharedPrefController().getToken != null
        ? {
            "Accept": "application/json",
            "Content-Type": "application/json",
            'Authorization': 'Bearer ${SharedPrefController().getToken}',
          }
        : {
            "Accept": "application/json",
            "Content-Type": "application/json",
          };
  }

  static void navigationReplacementToPage(BuildContext context, Widget screen) {
    locator<NavigationService>().nav.pushReplacement(
          MaterialPageRoute(
            builder: (context) => screen,
          ),
        );
  }

  static void navigationToPageAndExitAll(BuildContext context, Widget screen) {
    locator<NavigationService>().nav.pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => screen),
        (Route<dynamic> route) => false);
  }

  static void navigationToPageAndExitAllWithoutFirst(BuildContext context) {
    locator<NavigationService>().nav.popUntil((route) => route.isFirst);
  }

  static void navigationBack(BuildContext context) {
    locator<NavigationService>().nav.pop();
  }

  static Future navigationToPage(BuildContext context, Widget screen) {
    return locator<NavigationService>().nav.push(
          MaterialPageRoute(
            builder: (context) => screen,
          ),
        );
  }

  static showSnackBar(
    BuildContext context, {
    required String message,
    Color? textColor,
    Color? background,
    bool error = false,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: MyText(
          title: message,
          fontSize: 14,
          color: textColor ?? AppColors.WHITE,
        ),
        behavior: SnackBarBehavior.floating,
        elevation: 0,
        backgroundColor: error
            ? const Color.fromARGB(255, 132, 33, 13)
            : const Color.fromARGB(255, 16, 98, 16),
      ),
    );
  }

  static Future<String?> selectTime(BuildContext context) async {
    TimeOfDay? selectedDate;
    final TimeOfDay? picked = await showTimePicker(
        context: context, initialTime: TimeOfDay(hour: 00, minute: 00));
    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      return "${selectedDate.hour}:${selectedDate.minute}";
    }
    return null;
  }

  static Future<String?> selectDate(BuildContext context) async {
    DateTime selectedDate = DateTime.now();
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      print(selectedDate);
      selectedDate = picked;
      return "${selectedDate.toLocal()}".split(' ')[0];
    }
    return null;
  }

  static Widget getNumber(String number) {
    String start = number.substring(0, number.length - 4);
    String end = number.substring(number.length - 4, number.length);
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: start,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontFamily: 'Poppins',
              fontSize: 16.sp,
              color: AppColors.BLACK,
            ),
          ),
          TextSpan(
            text: end,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16.sp,
              color: AppColors.BASE_COLOR,
              fontFamily: 'Poppins',
            ),
          ),
        ],
      ),
    );
  }

  static String? checkFillData(String? s, BuildContext context) {
    if (s == null || s.isEmpty) {
      return AppLocalizations.of(context)!.pleaseEnterDataInField;
    }

    return null;
  }

  static String? checkFillDataWithMatchPaawords(
      String? s, String? s1, BuildContext context) {
    if (s == null || s.isEmpty) {
      return AppLocalizations.of(context)!.pleaseEnterDataInField;
    }

    if (s != s1) {
      return AppLocalizations.of(context)!.sureTwoPasswordsSame;
    }

    return null;
  }
}
