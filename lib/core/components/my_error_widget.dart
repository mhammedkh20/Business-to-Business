import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class MyErrorWidget extends StatelessWidget {
  const MyErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LottieBuilder.asset(
        'assets/json/ic_error.json',
        repeat: false,
      ),
    );
  }
}
