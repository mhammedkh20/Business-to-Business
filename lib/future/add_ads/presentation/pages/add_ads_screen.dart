import 'package:b2b_app/future/add_ads/presentation/manager/add_ads_cubit/add_ads_cubit.dart';
import 'package:b2b_app/future/add_ads/presentation/widgets/my_body_add_news.dart';
import 'package:b2b_app/future/add_ads/presentation/widgets/my_bottom_nav_add_news.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:b2b_app/future/add_ads/presentation/widgets/tab_add_news.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:b2b_app/core/components/my_app_bar.dart';
import 'package:flutter/material.dart';

class AddAdsScreen extends StatefulWidget {
  const AddAdsScreen({super.key});

  @override
  State<AddAdsScreen> createState() => _AddAdsScreenState();
}

class _AddAdsScreenState extends State<AddAdsScreen> {
  @override
  void deactivate() {
    AddAdsCubit.get(context).resetAllData();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: AppLocalizations.of(context)!.addAnAd,
        elevation: 0,
      ),
      body: Column(
        children: [
          const TabAddNews(),
          SizedBox(height: 20.h),
          const MyBodyAddNews(),
        ],
      ),
      bottomNavigationBar: const MyBottomNavAddNews(),
    );
  }
}
