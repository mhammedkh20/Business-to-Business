import 'dart:io';

enum TypeMessage { TEXT, PHOTO, VOICE, PERSON }

class MessageModel {
  int id;
  String message;
  TypeMessage typeMessage;
  bool sender;
  String? voicePath;
  File? image;

  MessageModel(
    this.id,
    this.message,
    this.sender,
    this.typeMessage, {
    this.image,
    this.voicePath,
  });
}
