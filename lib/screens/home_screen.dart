import 'package:flutter/material.dart';
import 'package:message_app_ui/models/chats_model.dart';
import 'package:message_app_ui/models/message_model.dart';
import 'package:message_app_ui/models/user_model.dart';
import 'package:message_app_ui/screens/chat_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    AppBar ChatAppBar = AppBar(
      title: const Text(
        "Sup Chat",
        style: TextStyle(fontFamily: "Poppins", fontSize: 32),
      ),
      centerTitle: true,
      leading: const Padding(
          padding: EdgeInsets.all(5.0), child: Icon(Icons.menu, size: 32)),
    );

    return Scaffold(
        appBar: ChatAppBar,
        body: Chats(
          chats: currentUserChats,
        ));
  }
}

class Chats extends StatefulWidget {
  const Chats({required this.chats, Key? key}) : super(key: key);
  final List<Chat> chats;
  @override
  _ChatsState createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.chats.length,
        itemBuilder: (BuildContext context, int index) {
          return ChatCard(
              messages: widget.chats[index].messages,
              user: widget.chats[index].receiver,
              time: widget.chats[index]
                  .messages[widget.chats[index].messages.length - 1].time,
              currentChat: widget.chats[index]);
        });
  }
}

class ChatCard extends StatefulWidget {
  const ChatCard(
      {Key? key,
      required this.messages,
      required this.user,
      required this.time,
      required this.currentChat})
      : super(key: key);
  final List<Message> messages;
  final User user;
  final String time;
  final Chat currentChat;

  @override
  _ChatCardState createState() => _ChatCardState();
}

class _ChatCardState extends State<ChatCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        child: Card(
          color: Colors.blue[50],
          child: ListTile(
            title: Text(
              widget.user.name,
              style: const TextStyle(fontSize: 18),
            ),
            minLeadingWidth: 50,
            minVerticalPadding: 20,
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              children: [
                const Icon(
                  Icons.message_outlined,
                  size: 32,
                ),
                Text(
                  widget.time.split(" ")[0],
                  style: const TextStyle(
                      fontWeight: FontWeight.w100, color: Colors.black54),
                ),
              ],
            ),
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: Image.asset(
                widget.user.imageUrl,
                fit: BoxFit.fill,
              ).image,
            ),
            subtitle: Text(widget.messages[widget.messages.length - 1].text
                        .split(" ")
                        .length >
                    1
                ? widget.messages[widget.messages.length - 1].text
                        .split(" ")[0] +
                    " . . . "
                : widget.messages[widget.messages.length - 1].text),
          ),
        ),
      ),
      onTap: () => {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ChatScreen(
                    messages: widget.messages,
                    sender: widget.user,
                    currentChat: widget.currentChat)))
      },
    );
  }
}
