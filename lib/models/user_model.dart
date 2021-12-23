import 'package:message_app_ui/models/chats_model.dart';

class User {
  final String name;
  final int id;
  final String imageUrl;

  User({
    required this.name,
    required this.id,
    required this.imageUrl,
  });
}

final User currentUser =
    User(id: 0, name: "You", imageUrl: "assets/images/user1.jpg");

final User james =
    User(id: 2, name: "James", imageUrl: "assets/images/user2.jpg");
final User jason =
    User(id: 3, name: "Jason", imageUrl: "assets/images/user3.jpg");
final User marie =
    User(id: 4, name: "Marie", imageUrl: "assets/images/user7.jpg");

final User rosy =
    User(id: 5, name: "Rosy", imageUrl: "assets/images/user6.jpg");
