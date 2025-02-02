import 'package:b2b_app/core/components/my_app_bar.dart';
import 'package:b2b_app/core/components/my_contianer_shape.dart';
import 'package:b2b_app/core/components/my_text.dart';
import 'package:b2b_app/core/utils/app_colors.dart';
import 'package:b2b_app/core/utils/app_helpers.dart';
import 'package:b2b_app/future/auth/presentation/pages/set_password_screen.dart';
import 'package:b2b_app/future/auth/presentation/widgets/my_pin_put.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class AccountConfirmationScreen extends StatefulWidget {
  final bool byForgetPasswordScreen;
  final String? input;
  const AccountConfirmationScreen({
    super.key,
    required this.byForgetPasswordScreen,
    this.input,
  });

  @override
  State<AccountConfirmationScreen> createState() =>
      _AccountConfirmationScreenState();
}

class _AccountConfirmationScreenState extends State<AccountConfirmationScreen> {
  late final StopWatchTimer _stopWatchTimer;
  final TextEditingController _codeController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _stopWatchTimer = StopWatchTimer(mode: StopWatchMode.countDown);
    _stopWatchTimer.setPresetMinuteTime(1);
    _stopWatchTimer.setPresetSecondTime(12);

    _stopWatchTimer.onStartTimer();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const MyAppBar(
        backgroundColor: AppColors.TRANSPARENT,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        children: [
          SizedBox(height: MediaQuery.of(context).padding.top + 80.h),
          SvgPicture.asset(
            'assets/images/ic_email2.svg',
            width: 128.w,
          ),
          SizedBox(height: 50.h),
          MyText(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            textAlign: TextAlign.center,
            title: AppLocalizations.of(context)!.checkIncomingEmails,
          ),
          SizedBox(height: 16.h),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text:
                      '${AppLocalizations.of(context)!.digitCodeBeenSentEmail} ',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 12.sp,
                    color: AppColors.BLUE_DARK,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                TextSpan(
                  text: widget.input ?? 'mhammedkhaled96@gmail.com',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 14.sp,
                    height: 1.5,
                    color: AppColors.BLACK,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 40.h),
          Align(
            alignment: AlignmentDirectional.center,
            child: Form(
              key: _formKey,
              child: MyPinput(textEditingController: _codeController),
            ),
          ),
          SizedBox(height: 32.h),
          Align(
            alignment: AlignmentDirectional.center,
            child: Material(
              borderRadius: BorderRadius.circular(50),
              color: AppColors.BASE_COLOR,
              child: InkWell(
                borderRadius: BorderRadius.circular(50),
                onTap: () {
                  // if (_formKey.currentState!.validate()) {}
                  AppHelpers.navigationToPage(
                    context,
                    SetPasswordScreen(input: 'mhammedkhaled96@gmail.com'),
                  );
                },
                child: MyContainerShape(
                  paddingHorizontal: 23,
                  paddingVertical: 10,
                  width: 140.w,
                  borderRadius: 50,
                  bgContainer: AppColors.TRANSPARENT,
                  alignment: AlignmentDirectional.center,
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/images/ic_arrow.svg'),
                      SizedBox(width: 6.w),
                      MyText(
                        title: AppLocalizations.of(context)!.codeConfirmation,
                        color: AppColors.WHITE,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/images/ic_clock.svg',
                width: 14.r,
                height: 14.r,
              ),
              SizedBox(width: 10.w),
              StreamBuilder<int>(
                stream: _stopWatchTimer.rawTime,
                initialData: 0,
                builder: (context, snap) {
                  final value = snap.data;
                  final displayTime = value == null
                      ? ''
                      : StopWatchTimer.getDisplayTime(
                          value,
                          milliSecond: false,
                          hours: false,
                        );
                  return MyText(
                    title: displayTime,
                    color: AppColors.BLUE_LIGHT,
                  );
                },
              ),
            ],
          ),
          SizedBox(height: 25.h),
          GestureDetector(
            onTap: () {
              _stopWatchTimer.onResetTimer();
              _stopWatchTimer.onStartTimer();
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyText(
                  title: AppLocalizations.of(context)!
                      .didNotReceiveConfirmationCodePhone,
                  fontWeight: FontWeight.w300,
                  fontSize: 12,
                  color: AppColors.BLUE_LIGHT,
                ),
                SizedBox(width: 10.w),
                SvgPicture.asset(
                  'assets/images/ic_ref.svg',
                  width: 20.r,
                  height: 20.r,
                ),
                SizedBox(width: 4.w),
                MyText(
                  title: AppLocalizations.of(context)!.resend,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppColors.BLUE_DARK,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
