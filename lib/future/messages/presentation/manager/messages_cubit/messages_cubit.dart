// ignore_for_file: prefer_const_constructors

import 'package:b2b_app/future/messages/models/conversation_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'messages_state.dart';

class MessagesCubit extends Cubit<MessagesState> {
  MessagesCubit() : super(MessagesInitial());

  static MessagesCubit get(BuildContext context) {
    return BlocProvider.of(context);
  }

  List<ConversationModel> listConversation = [
    ConversationModel(
      countMessages: 1,
      desc: 'The team will contact you within minutes',
      id: 1,
      image: null,
      selected: false,
      time: 'قبل 7 ساعات',
      title: 'محمد بن عبد الله',
    ),
    ConversationModel(
      countMessages: 3,
      desc: 'اهلا بك استاذ صلاح ، يرجى التواصل معي باقرب فرصة',
      id: 2,
      image: null,
      selected: false,
      time: 'قبل 7 ساعات',
      title: 'محمد بن عبد الله',
    ),
    ConversationModel(
      countMessages: 0,
      desc: 'اهلا بك استاذ صلاح ، يرجى التواصل معي باقرب فرصة',
      id: 3,
      image: null,
      selected: false,
      time: 'قبل 7 ساعات',
      title: 'محمد بن عبد الله',
    ),
    ConversationModel(
      countMessages: 4,
      desc: 'اهلا بك استاذ صلاح ، يرجى التواصل معي باقرب فرصة',
      id: 4,
      image: null,
      selected: false,
      time: 'قبل 7 ساعات',
      title: 'محمد بن عبد الله',
    ),
  ];

  selectedChats(int index, bool? enabled) {
    if (enabled == null) {
      listConversation[index].selected = !listConversation[index].selected;
    } else {
      listConversation[index].selected = enabled;
    }
    emit(MessagesInitial());
  }

  int getCountChatSelected() {
    int count = 0;
    for (int i = 0; i < listConversation.length; i++) {
      if (listConversation[i].selected) {
        count++;
      }
    }
    return count;
  }

  deleteConversation(int id) {
    listConversation.removeWhere((element) => element.id == id);

    emit(MessagesInitial());
  }

  bool enabledOptionChat = false;
  changeEnabledOption({bool? enabled}) {
    if (enabled == null) {
      enabledOptionChat = !enabledOptionChat;
    } else {
      enabledOptionChat = enabled;
    }
    emit(MessagesInitial());
  }

  bool selectRecordMessage = false;

  setRecordMessage(bool status) {
    selectRecordMessage = status;
    emit(MessagesInitial());
  }
}
