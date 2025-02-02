class ConversationModel {
  final int id;
  final String title;
  final String desc;
  final String time;
  final String? image;
  final int countMessages;
  bool selected;

  ConversationModel({
    required this.countMessages,
    required this.desc,
    required this.id,
    required this.image,
    required this.selected,
    required this.time,
    required this.title,
  });
}
