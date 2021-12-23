import 'package:message_app_ui/models/message_model.dart';
import 'package:message_app_ui/models/user_model.dart';

class Chat {
  final List<Message> messages;
  final User receiver;

  Chat({required this.messages, required this.receiver});
}

Chat jamesChat = Chat(messages: [
  Message(text: "hi 1", sender: currentUser, time: DateTime.now().toString()),
  Message(text: "hi 2", sender: james, time: DateTime.now().toString()),
  Message(text: "test lol", sender: james, time: DateTime.now().toString()),
  Message(
      text: "yes good test lol",
      sender: currentUser,
      time: DateTime.now().toString())
], receiver: james);

Chat jasonChat = Chat(messages: [
  Message(
      text: "brrr no", sender: currentUser, time: DateTime.now().toString()),
  Message(text: "eyy wsup", sender: jason, time: DateTime.now().toString()),
  Message(text: "beep boop", sender: jason, time: DateTime.now().toString()),
  Message(
      text: "brooo wsuppp",
      sender: currentUser,
      time: DateTime.now().toString())
], receiver: jason);

Chat marieChat = Chat(messages: [
  Message(text: "heyyyy", sender: currentUser, time: DateTime.now().toString()),
  Message(text: "brr wsup", sender: marie, time: DateTime.now().toString()),
  Message(text: "ntg new ", sender: marie, time: DateTime.now().toString()),
  Message(
      text: "eyy cool", sender: currentUser, time: DateTime.now().toString())
], receiver: marie);

Chat rosyChat = Chat(messages: [
  Message(text: "heyyyy", sender: currentUser, time: DateTime.now().toString()),
  Message(text: "brr wsup", sender: rosy, time: DateTime.now().toString()),
  Message(text: "ntg new ", sender: rosy, time: DateTime.now().toString()),
  Message(
      text: "eyy cool", sender: currentUser, time: DateTime.now().toString())
], receiver: rosy);
List<Chat> currentUserChats = [jamesChat, rosyChat, jasonChat, marieChat];
