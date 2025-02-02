import 'package:b2b_app/core/components/my_contianer_shape.dart';
import 'package:b2b_app/core/components/my_text.dart';
import 'package:b2b_app/core/utils/app_colors.dart';
import 'package:b2b_app/future/on_boarding/presentation/widgets/gallery_photos.dart';
import 'package:b2b_app/future/profile/presentation/widgets/custom_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:b2b_app/core/components/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AboutAppScreen extends StatefulWidget {
  const AboutAppScreen({super.key});

  @override
  State<AboutAppScreen> createState() => _AboutAppScreenState();
}

class _AboutAppScreenState extends State<AboutAppScreen> {
  bool animateTitle = false;
  bool animateDesc1 = false;
  bool animateDesc2 = false;
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
        animateTitle = true;
      });
    });
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        animateDesc1 = true;
      });
    });
    Future.delayed(const Duration(milliseconds: 1000), () {
      setState(() {
        animateDesc2 = true;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: MyAppBar(
        elevation: 0,
        title: AppLocalizations.of(context)!.aboutApplication,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        children: [
          const GalleryPhotos(withLogo: false),
          SizedBox(height: 32.h),
          SizedBox(
            height: 70.h,
            child: Stack(
              children: [
                AnimatedPositionedDirectional(
                  curve: Curves.easeOutCubic,
                  end: 0,
                  start: animateTitle ? 0 : -300,
                  duration: const Duration(milliseconds: 500, seconds: 1),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyContainerShape(
                        height: 70.h,
                        width: 3,
                        borderRadius: 4,
                        bgContainer: AppColors.BASE_COLOR,
                      ),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.only(end: 80.w),
                          child: MyText(
                            title: AppLocalizations.of(context)!.descAboutApp,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16.h),
          SizedBox(
            height: 150.h,
            width: double.infinity,
            child: Stack(
              children: [
                AnimatedPositionedDirectional(
                  curve: Curves.easeOutCubic,
                  end: animateDesc1 ? 0 : widthScreen,
                  start: animateDesc1 ? 0 : -widthScreen,
                  duration: const Duration(milliseconds: 500, seconds: 1),
                  child: Padding(
                    padding: EdgeInsetsDirectional.only(start: 15.w),
                    child: MyText(
                      title: AppLocalizations.of(context)!.descAboutApp2,
                      color: AppColors.GRAY3,
                      height: 1.6,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 32.h),
          SizedBox(
            height: 140.h,
            width: double.infinity,
            child: Stack(
              children: [
                AnimatedPositionedDirectional(
                  curve: Curves.easeOutCubic,
                  end: animateDesc2 ? 0 : widthScreen,
                  start: animateDesc2 ? 0 : -widthScreen,
                  duration: const Duration(milliseconds: 500, seconds: 1),
                  child: Padding(
                    padding: EdgeInsetsDirectional.only(start: 15.w),
                    child: MyText(
                      title: AppLocalizations.of(context)!.descAboutApp3,
                      color: AppColors.GRAY3,
                      height: 1.6,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 40.h),
          SvgPicture.asset(
            'assets/images/ic_advantages.svg',
            width: 50.r,
            height: 50.r,
          ),
          SizedBox(height: 10.h),
          MyText(
            title: AppLocalizations.of(context)!.descAboutApp4,
            fontWeight: FontWeight.bold,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 32.h),
          CustomCard(
            title: AppLocalizations.of(context)!.titleAboutApp1,
            desc: AppLocalizations.of(context)!.descAboutApp5,
            icon: 'assets/images/ic_filterr.svg',
            backgroundBaseColor: true,
          ),
          SizedBox(height: 24.h),
          CustomCard(
            title: AppLocalizations.of(context)!.titleAboutApp2,
            desc: AppLocalizations.of(context)!.descAboutApp6,
            icon: 'assets/images/ic_contact.svg',
            backgroundBaseColor: false,
          ),
          SizedBox(height: 24.h),
          CustomCard(
            title: AppLocalizations.of(context)!.titleAboutApp4,
            desc: AppLocalizations.of(context)!.descAboutApp8,
            icon: 'assets/images/ic_contact.svg',
            backgroundBaseColor: true,
          ),
          SizedBox(height: 24.h),
          CustomCard(
            title: AppLocalizations.of(context)!.titleAboutApp3,
            desc: AppLocalizations.of(context)!.descAboutApp7,
            icon: 'assets/images/ic_contact.svg',
            backgroundBaseColor: false,
          ),
          SizedBox(height: 70.h),
        ],
      ),
    );
  }
}
