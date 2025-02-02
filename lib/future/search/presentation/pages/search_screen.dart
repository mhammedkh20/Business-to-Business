import 'package:b2b_app/future/search/presentation/widgets/my_body_searsh.dart';
import 'package:b2b_app/future/search/presentation/widgets/my_search_bar.dart';
import 'package:b2b_app/future/search/presentation/widgets/my_tapbar_search.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class SearchAndFilterScreen extends StatelessWidget {
  const SearchAndFilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 15.h),
            const MySearchBar(),
            SizedBox(height: 10.h),
            const MyTapBarSearch(),
            const MyBodySearch(),
          ],
        ),
      ),
    );
  }
}
