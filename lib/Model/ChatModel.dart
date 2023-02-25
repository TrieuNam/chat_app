class ChatModel {
  String name;
  String? icon;
  bool? isGroup;
  String? time;
  String? currentMessage;
  String? status;

  ChatModel(this.name, this.status,
      [this.icon, this.isGroup, this.time, this.currentMessage]);
}
