import 'package:b2b_app/core/storage/pref/shared_pref_controller.dart';
import 'package:b2b_app/core/utils/app_helpers.dart';
import 'package:b2b_app/future/home/presentation/pages/main_screen.dart';
import 'package:b2b_app/future/on_boarding/presentation/pages/on_boarding_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:b2b_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      if (SharedPrefController().getToken != null) {
        AppHelpers.navigationToPageAndExitAll(context, const MainScreen());
      } else {
        AppHelpers.navigationToPageAndExitAll(
            context, const OnBoardingScreen());
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.BASE_COLOR,
      body: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Lottie.asset(
              'assets/json/animation_ljscae7v.json',
              width: 200.r,
              height: 200.r,
              repeat: false,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
