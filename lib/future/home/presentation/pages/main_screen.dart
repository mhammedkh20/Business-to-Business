import 'package:b2b_app/future/home/presentation/widgets/main/my_body_main.dart';
import 'package:b2b_app/future/home/presentation/widgets/main/my_bottom_nav.dart';
import 'package:b2b_app/future/home/presentation/widgets/main/my_floating_action_button.dart';
import 'package:flutter/material.dart';
import 'package:b2b_app/core/services/notification_service.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    NotificationService.init();
    NotificationService.requestIOSPermissions();
    NotificationService.listenNotification();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MyBodyMain(),
      bottomNavigationBar: MyBottonNav(),
      floatingActionButton: MyFoatingActionButtton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}
