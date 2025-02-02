import 'package:b2b_app/core/components/my_text.dart';
import 'package:b2b_app/future/messages/presentation/manager/messages_cubit/messages_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyAppBarMessages extends StatelessWidget {
  const MyAppBarMessages({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MessagesCubit, MessagesState>(
      builder: (context, state) {
        return SizedBox(
          height: 70.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyText(
                title: AppLocalizations.of(context)!.messages,
                fontSize: 18,
              ),
            ],
          ),
        );
      },
    );
  }
}
