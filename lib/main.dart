import 'package:b2b_app/future/home/presentation/manager/language_cubit/language_cubit.dart';
import 'package:b2b_app/future/on_boarding/presentation/pages/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:b2b_app/app_config.dart';
import 'package:b2b_app/core/services/crashlytics_service.dart';
import 'package:b2b_app/core/services/navigation_service.dart';
import 'package:b2b_app/core/services/notification_service.dart';
import 'package:b2b_app/core/storage/pref/shared_pref_controller.dart';
import 'package:b2b_app/firebase_options.dart';
import 'package:b2b_app/locator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await SharedPrefController().initSharedPref();
  await NotificationService().initNotification();
  CrashlyticsService.init();
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: AppConfig.providers,
      child: ScreenUtilInit(
        designSize: const Size(390, 844),
        minTextAdapt: true,
        useInheritedMediaQuery: true,
        splitScreenMode: true,
        builder: (context, child) {
          return BlocBuilder<LanguageCubit, LanguageState>(
            builder: (context, state) {
              String lang = SharedPrefController().getLang;
              LanguageCubit.get(context).changeIndexLang(lang == 'ar'
                  ? 0
                  : lang == 'en'
                      ? 1
                      : 2);
              return MaterialApp(
                title: 'B2B app',
                theme: AppConfig.themeData(),
                debugShowCheckedModeBanner: false,
                navigatorKey: locator<NavigationService>().rootNavKey,
                localizationsDelegates: AppConfig.localization(),
                supportedLocales: AppConfig.supportedLocales(),
                locale: Locale(lang),
                home: const SplashScreen(),
              );
            },
          );
        },
      ),
    );
  }
}
