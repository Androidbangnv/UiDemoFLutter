import 'package:flutter/material.dart';
import 'package:ui_demo_1/model/message_model.dart';
import 'package:ui_demo_1/model/user_model.dart';

class ChatScreen extends StatefulWidget {
  final User user;

  ChatScreen(this.user);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_sharp),
          iconSize: 25,
          color: Colors.white,
          onPressed: () {},
        ),
        title: Text(
          widget.user.name,
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.more_horiz), onPressed: () {})
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                child: ListView.builder(
                  reverse: true,
                  padding: EdgeInsets.only(top: 15),
                  itemCount: messages.length,
                  itemBuilder: (BuildContext context, int index) {
                    final Message message = messages[index];
                    final bool isMe = message.sender.id == currentUser.id;
                    return _builderMessage(message, isMe);
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _builderMessage(Message message, bool isMe) {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                color: isMe ? Theme.of(context).accentColor : Color(0xFFFFEFEE),
                borderRadius: isMe
                    ? BorderRadius.only(
                        topLeft: Radius.circular(15),
                        bottomLeft: Radius.circular(15))
                    : BorderRadius.only(
                        topRight: Radius.circular(15),
                        bottomRight: Radius.circular(15))),
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
            margin: isMe
                ? EdgeInsets.only(top: 8, bottom: 8.0, right: 8, left: 80)
                : EdgeInsets.only(top: 8, bottom: 8.0, right: 8, left: 8),
            child: Column(
              crossAxisAlignment:
                  isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: [
                Text(
                  message.time,
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Text(
                  message.text,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        !isMe
            ? IconButton(
                icon: message.isLiked
                    ? Icon(Icons.favorite)
                    : Icon(Icons.favorite_border),
                color: message.isLiked
                    ? Theme.of(context).primaryColor
                    : Colors.blueGrey,
                iconSize: 25,
                onPressed: () {})
            : SizedBox.shrink()
      ],
    );
  }
}
