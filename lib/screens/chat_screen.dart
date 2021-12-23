import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:message_app_ui/models/chats_model.dart';
import 'package:message_app_ui/models/message_model.dart';
import 'package:message_app_ui/models/user_model.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen(
      {required this.messages,
      required this.sender,
      required this.currentChat,
      Key? key})
      : super(key: key);
  final Chat currentChat;
  final List<Message> messages;
  final User sender;
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  void sendMessage() {}
  @override
  Widget build(BuildContext context) {
    var ChatAppBar = AppBar(
      title: Text(
        widget.sender.name,
        style: const TextStyle(fontFamily: "Poppins", fontSize: 32),
      ),
      centerTitle: true,
      leading: IconButton(
        onPressed: () => {Navigator.pop(context)},
        icon: const Icon(Icons.arrow_back_ios_rounded),
      ),
    );

    return Scaffold(
      appBar: ChatAppBar,
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: widget.messages.length,
              itemBuilder: (BuildContext context, int index) {
                return MessageCard(
                  text: widget.messages[index].text,
                  sender: widget.messages[index].sender,
                  time: widget.messages[index].time,
                );
              }),
          MessageInput(
              receiver: widget.sender, currentChat: widget.currentChat),
        ],
      ),
    );
  }
}

class MessageInput extends StatefulWidget {
  const MessageInput(
      {required this.receiver, required this.currentChat, Key? key})
      : super(key: key);
  final User receiver;
  final Chat currentChat;
  @override
  _MessageInputState createState() => _MessageInputState();
}

class _MessageInputState extends State<MessageInput> {
  final TextEditingController _textController = TextEditingController();

  void sendMessage() {
    if (_textController.text.isNotEmpty) {
      var message = Message(
          text: _textController.text,
          sender: currentUser,
          time: DateTime.now().toString());
      setState(() {
        widget.currentChat.messages.add(message);
        _textController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _textController,
              decoration: const InputDecoration(
                focusColor: Colors.blue,
                hintText: "Type a message",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send, color: Colors.blue),
            onPressed: () => {sendMessage()},
          )
        ],
      ),
    );
  }
}

class MessageCard extends StatelessWidget {
  const MessageCard(
      {required this.text, required this.sender, required this.time, Key? key})
      : super(key: key);
  final String text;
  final User sender;
  final String time;
  @override
  Widget build(BuildContext context) {
    // return bublle like message card
    return Column(
      children: <Widget>[
        Container(
          height: 50,
          width: MediaQuery.of(context).size.width * 0.9,
          color: sender.name == "You" ? Colors.blue[200] : Colors.blue,
          child: Material(
            borderRadius: sender.name == "You"
                ? const BorderRadius.only(bottomRight: Radius.circular(50 / 2))
                : const BorderRadius.only(bottomLeft: Radius.circular(50 / 2)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                SizedBox(
                  width: sender.name == "You"
                      ? MediaQuery.of(context).size.width * 0.77
                      : 0,
                ),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: ExactAssetImage(sender.imageUrl),
                      fit: BoxFit.fill,
                    ),
                    border: Border.all(
                      color: Colors.white,
                      width: 4.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 50,
          width: MediaQuery.of(context).size.width * 0.9,
          child: Material(
            color: sender.name == "You" ? Colors.blue[200] : Colors.blue,
            borderRadius: sender.name == "You"
                ? const BorderRadius.only(
                    bottomLeft: Radius.circular(50 / 3),
                    bottomRight: Radius.circular(50 / 3),
                    topLeft: Radius.circular(50 / 3))
                : const BorderRadius.only(
                    bottomLeft: Radius.circular(50 / 3),
                    bottomRight: Radius.circular(50 / 3),
                    topRight: Radius.circular(50 / 3)),
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        text,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              time
                                  .split(" ")[1]
                                  .split(".")[0]
                                  .split(":")
                                  .sublist(0, 2)
                                  .join(":"),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Text(sender.name,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  )),
                            )
                          ]),
                    ]),
              ),
            ),
          ),
        )
      ],
    );
  }
}
