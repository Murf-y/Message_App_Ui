import 'package:message_app_ui/models/user_model.dart';

class Message {
  final String text;
  final User sender;
  final String time;

  Message({
    required this.text,
    required this.sender,
    required this.time,
  });
}
