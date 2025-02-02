import 'package:b2b_app/future/add_ads/presentation/manager/add_ads_cubit/add_ads_cubit.dart';
import 'package:b2b_app/future/add_ads/presentation/pages/sub_screen_financing/advertising_promotion_widget.dart';
import 'package:b2b_app/future/add_ads/presentation/pages/sub_screen_financing/install_ad_widget.dart';
import 'package:b2b_app/future/add_ads/presentation/widgets/my_bottom_nav_add_financing.dart';
import 'package:b2b_app/future/add_ads/presentation/widgets/tab_add_financing.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:b2b_app/core/components/my_app_bar.dart';
import 'package:flutter/material.dart';

class AddFinancingScreen extends StatefulWidget {
  const AddFinancingScreen({super.key});

  @override
  State<AddFinancingScreen> createState() => _AddFinancingScreenState();
}

class _AddFinancingScreenState extends State<AddFinancingScreen> {
  @override
  void deactivate() {
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
          const TabAddFinancing(),
          SizedBox(height: 20.h),
          const MyBodyFinancing(),
        ],
      ),
      bottomNavigationBar: const MyBottomNavAddFinancing(),
    );
  }
}

class MyBodyFinancing extends StatelessWidget {
  const MyBodyFinancing({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddAdsCubit, AddAdsState>(
      builder: (context, state) {
        int indexPage = AddAdsCubit.get(context).indexTabFinancing;
        Widget widgetView;
        switch (indexPage) {
          case 0:
            widgetView = const InstallAdWidget();
            break;
          case 1:
            widgetView = const AdvertisingPromotionWidget();
            break;
          default:
            widgetView = const InstallAdWidget();
            break;
        }
        return Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: widgetView,
          ),
        );
      },
    );
  }
}
