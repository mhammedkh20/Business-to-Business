// ignore_for_file: use_build_context_synchronously
import 'package:b2b_app/core/utils/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'dart:io';
import 'package:b2b_app/core/components/full_screen_widget.dart';
import 'package:b2b_app/core/components/my_app_bar.dart';
import 'package:b2b_app/core/components/my_contianer_shape.dart';
import 'package:b2b_app/core/utils/app_helpers.dart';
import 'package:b2b_app/future/messages/models/message_model.dart';
import 'package:b2b_app/future/messages/presentation/manager/messages_cubit/messages_cubit.dart';
import 'package:b2b_app/future/messages/presentation/widgets/item_message.dart';
import 'package:b2b_app/future/messages/presentation/widgets/my_text_field_chat.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatScreen extends StatefulWidget {
  final String title;

  const ChatScreen({super.key, required this.title});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<MessageModel> list = [
    MessageModel(0, '', true, TypeMessage.PERSON),
    MessageModel(1, 'السلام عليكم، كيف الحال', false, TypeMessage.TEXT),
    MessageModel(2, 'الحمد لله بالف خير وانتا كيفك', true, TypeMessage.TEXT),
    MessageModel(3, 'شلون الشغل عندك؟', true, TypeMessage.TEXT),
  ];

  void scrollToBottom({int height = 80}) {
    scrollController.animateTo(
      scrollController.position.maxScrollExtent + height,
      duration: const Duration(milliseconds: 1000),
      curve: Curves.easeInOut,
    );
  }

  late TextEditingController textMessage;

  late FocusNode focusNode;

  late ScrollController scrollController;

  @override
  void initState() {
    textMessage = TextEditingController();
    scrollController = ScrollController();
    focusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    textMessage.dispose();
    scrollController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  void deactivate() {
    if (MessagesCubit.get(context).enabledOptionChat) {
      MessagesCubit.get(context).changeEnabledOption(enabled: false);
    }

    super.deactivate();
  }

  bool block = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: MyAppBar(
        title: AppLocalizations.of(context)!.messagesDetails,
      ),
      body: Column(
        children: [
          Expanded(
            child: MyContainerShape(
              child: GestureDetector(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                  },
                  child: ListView(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                    controller: scrollController,
                    physics: const AlwaysScrollableScrollPhysics(),
                    children: list.map((e) {
                      return ItemMessage(
                        item: e,
                      );
                    }).toList(),
                  )),
            ),
          ),
          SizedBox(height: 10.h),
          MyTextFieldChat(
            onTap: () {},
            controller: textMessage,
            focusNode: focusNode,
            onPressedVoiceMessage: () {
              MessagesCubit.get(context).setRecordMessage(true);
            },
            onPressedSelectImage: () async {
              final ImagePicker _picker = ImagePicker();
              final XFile? image =
                  await _picker.pickImage(source: ImageSource.gallery);
              if (image != null) {
                AppHelpers.navigationToPage(
                  context,
                  FullScreenPage(
                    image: File(image.path),
                    heroTag: 0,
                    onSend: () {
                      list.add(
                        MessageModel(
                          list.length,
                          textMessage.text,
                          false,
                          TypeMessage.PHOTO,
                          image: File(image.path),
                        ),
                      );
                      scrollToBottom(height: 100);
                      textMessage.text = '';
                      setState(() {});
                      Navigator.pop(context);
                    },
                  ),
                );
              }
            },
            onPressedPickImage: () async {
              final ImagePicker _picker = ImagePicker();
              final XFile? image =
                  await _picker.pickImage(source: ImageSource.camera);
              if (image != null) {
                list.add(MessageModel(
                  list.length,
                  textMessage.text,
                  false,
                  TypeMessage.PHOTO,
                  image: File(image.path),
                ));
                scrollToBottom(height: 100);

                textMessage.text = '';
                setState(() {});
              }
            },
            onPressedSendMessage: () {
              if (textMessage.text.trim().isNotEmpty) {
                list.add(MessageModel(
                    list.length, textMessage.text, false, TypeMessage.TEXT));
                scrollToBottom();
                textMessage.text = '';
                setState(() {});
              }
            },
            handleRecord: (path, cnaceled) {
              if (!cnaceled && path != null) {
                textMessage.text = '';

                path = path.replaceAll('file://', '');
                list.add(
                  // 0,
                  MessageModel(
                    list.length,
                    textMessage.text,
                    false,
                    TypeMessage.VOICE,
                    voicePath: path,
                  ),
                );
                scrollToBottom();
                setState(() {});
              }
            },
          ),
          Container(
              color: AppColors.TRANSPARENT,
              height: MediaQuery.of(context).padding.bottom + 10.h),
        ],
      ),
    );
  }
}
