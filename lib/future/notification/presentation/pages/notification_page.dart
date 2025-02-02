import 'package:b2b_app/future/notification/presentation/widgets/item_notification.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:b2b_app/core/components/my_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: MyText(
              title: AppLocalizations.of(context)!.notifications,
              fontSize: 20,
            ),
          ),
          SizedBox(height: 16.r),
          Expanded(
            child: ListView.separated(
              itemCount: 20,
              padding: EdgeInsets.zero,
              itemBuilder: (BuildContext context, int index) {
                return const ItemNotification();
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider(height: 1.h, thickness: 1);
              },
            ),
          ),
        ],
      ),
    );
  }
}
