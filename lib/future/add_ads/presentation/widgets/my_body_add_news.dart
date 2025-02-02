import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:b2b_app/future/add_ads/presentation/manager/add_ads_cubit/add_ads_cubit.dart';
import 'package:b2b_app/future/add_ads/presentation/pages/sub_screens/category_widget.dart';
import 'package:b2b_app/future/add_ads/presentation/pages/sub_screens/comunication_widget.dart';
import 'package:b2b_app/future/add_ads/presentation/pages/sub_screens/desc_widget.dart';
import 'package:b2b_app/future/add_ads/presentation/pages/sub_screens/details_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyBodyAddNews extends StatelessWidget {
  const MyBodyAddNews({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddAdsCubit, AddAdsState>(
      builder: (context, state) {
        int indexSelected = AddAdsCubit.get(context).indexTab;
        Widget widgetView;
        switch (indexSelected) {
          case 0:
            widgetView = const CategoryWidget();
            break;
          case 1:
            widgetView = const DetailsWidget();
            break;
          case 2:
            widgetView = const DescWidget();
            break;

          default:
            widgetView = CommunicationWidget();
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
