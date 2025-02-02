// ignore_for_file: implementation_imports, depend_on_referenced_packages

import 'package:b2b_app/core/utils/app_colors.dart';
import 'package:b2b_app/future/add_ads/presentation/manager/add_ads_cubit/add_ads_cubit.dart';
import 'package:b2b_app/future/auth/domin/auth_repo.dart';
import 'package:b2b_app/future/auth/presentation/auth_cubit/auth_cubit.dart';
import 'package:b2b_app/future/home/domin/home_repo.dart';
import 'package:b2b_app/future/home/presentation/manager/language_cubit/language_cubit.dart';
import 'package:b2b_app/future/home/presentation/manager/main_cubit/main_cubit.dart';
import 'package:b2b_app/future/messages/presentation/manager/messages_cubit/messages_cubit.dart';
import 'package:b2b_app/future/profile/presentation/manager/add_news_cubit/add_news_cubit.dart';
import 'package:b2b_app/future/profile/presentation/manager/add_product_cubit/add_product_cubit.dart';
import 'package:b2b_app/future/profile/presentation/manager/add_servuce_cubit/add_service_cubit.dart';
import 'package:b2b_app/future/profile/presentation/manager/cubit/profile_cubit.dart';
import 'package:b2b_app/future/search/presentation/manager/cubit/filter_search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_bloc/src/bloc_provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:b2b_app/future/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:b2b_app/locator.dart';

class AppConfig {
  static ThemeData themeData() {
    return ThemeData(
      primarySwatch: AppColors.APP_THEME,
      useMaterial3: false,
      scaffoldBackgroundColor: AppColors.WHITE,
    );
  }

  static Iterable<LocalizationsDelegate<dynamic>> localization() {
    return [
      AppLocalizations.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ];
  }

  static Iterable<Locale> supportedLocales() {
    return const [
      Locale('en'),
      Locale('ar'),
    ];
  }

  static List<SingleChildWidget> providers = [
    BlocProvider(create: (_) => HomeCubit(locator<HomeRepo>())),
    BlocProvider(create: (_) => AuthCubit(locator<AuthRepo>())),
    BlocProvider(create: (_) => MainCubit()),
    BlocProvider(create: (_) => LanguageCubit()),
    BlocProvider(create: (_) => FilterSearchCubit()),
    BlocProvider(create: (_) => MessagesCubit()),
    BlocProvider(create: (_) => ProfileCubit()),
    BlocProvider(create: (_) => AddAdsCubit()),
    BlocProvider(create: (_) => AddNewsCubit()),
    BlocProvider(create: (_) => AddProductCubit()),
    BlocProvider(create: (_) => AddServiceCubit()),
  ];
}
