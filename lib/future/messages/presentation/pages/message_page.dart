import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:b2b_app/core/components/my_text.dart';
import 'package:b2b_app/core/utils/app_helpers.dart';
import 'package:b2b_app/future/messages/models/conversation_model.dart';
import 'package:b2b_app/future/messages/presentation/manager/messages_cubit/messages_cubit.dart';
import 'package:b2b_app/future/messages/presentation/pages/chat_screen.dart';
import 'package:b2b_app/future/messages/presentation/widgets/item_conversation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<MessagesCubit, MessagesState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              Padding(
                padding: EdgeInsetsDirectional.only(start: 16.w),
                child: MyText(
                  fontSize: 20,
                  title: AppLocalizations.of(context)!.messages,
                ),
              ),
              SizedBox(height: 8.h),
              Expanded(
                child: BlocBuilder<MessagesCubit, MessagesState>(
                  builder: (context, state) {
                    List<ConversationModel> listData =
                        MessagesCubit.get(context).listConversation;
                    return ListView.builder(
                      itemCount: listData.length,
                      itemBuilder: (context, index) {
                        return ItemConversation(
                          index: index,
                          conversation: listData[index],
                          onChangedSelected: (bool? enabled) {
                            if (enabled != null) {
                              MessagesCubit.get(context)
                                  .selectedChats(index, enabled);
                            }
                          },
                          onTap: () {
                            AppHelpers.navigationToPage(
                              context,
                              ChatScreen(
                                title: listData[index].title,
                              ),
                            );
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
