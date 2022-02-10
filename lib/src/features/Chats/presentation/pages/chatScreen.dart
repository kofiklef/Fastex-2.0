// ignore_for_file: file_names, unrelated_type_equality_checks

import 'package:fastex/core/constants/constants.dart';
import 'package:fastex/core/constants/widgetFunction.dart';
import 'package:fastex/src/features/Chats/data/models/messageModel.dart';
import 'package:fastex/src/features/Chats/data/models/user_Model.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key key, @required this.user}) : super(key: key);
  final Userr user;

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  _buildMessage(Message message, bool isMe) {
    final Container msg = Container(
      width: MediaQuery.of(context).size.width * 0.85,
      margin: isMe?
           const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 80.0)
          : const EdgeInsets.only(top: 8.0, bottom: 8.0),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15.0),
      decoration: message.sender.uid != 0 ?
           BoxDecoration(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(30.0),
                bottomRight: Radius.circular(30.0),
              ),
              color: isMe ?
                   Theme.of(context).colorScheme.secondary
                  : const Color(0xFFFFEFEE),
            )
          : null,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            message.time,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.blueGrey,
            ),
          ),
          addVertical(5.0),
          Text(
            message.text,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
    if (isMe) {
      return msg;
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        msg,
        message.sender.uid != 0 ? 
             IconButton(
                icon: message.isLiked ?
                     const Icon(Icons.favorite_border)
                    : const Icon(Icons.favorite),
                color: message.isLiked ?
                     Theme.of(context).primaryColor
                    : Colors.black,
                onPressed: () {},
                iconSize: 30.0,
              )
            : const SizedBox.shrink(),
      ],
    );
  }

  _buildMessageComponent() {
    final ThemeData themeData = Theme.of(context);
    String messageInfo = "";
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      height: 70.0,
      color: Colors.white,
      child: Row(
        children: <Widget>[
          IconButton(
            icon: const Icon(Icons.photo),
            color: Theme.of(context).primaryColor,
            onPressed: () {},
            iconSize: 25.0,
          ),
          Expanded(
            child: TextField(
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration.collapsed(
                hintText: 'Type a message...',
                hintStyle: themeData.textTheme.headline2
                    .copyWith(fontSize: 17.0, color: ocean),
              ),
              onChanged: (value) {
                setState(() => value = messageInfo);
              },
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send),
            color: Theme.of(context).primaryColor,
            onPressed: () {},
            iconSize: 25.0,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const bool online = true;
    final ThemeData themeData = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                child: Text(
                  "SOS",
                  style: themeData.textTheme.headline5.copyWith(
                    color: white,
                    letterSpacing: 1.25,
                    fontWeight: FontWeight.bold,
                    fontSize: 26.0,
                  ),
                ),
                style: ElevatedButton.styleFrom(elevation: 0.0, primary: red),
                onPressed: () {},
                onLongPress: () {
                  // Add function to call or send alert to relevant authorities
                },
              ),
              addHorizontal(5),
              if (online) const Icon(Icons.circle, color: Colors.green),
              addHorizontal(5),
              ElevatedButton(
                style: ElevatedButton.styleFrom(elevation: 0.0, primary: ocean),
                child: Text(
                  "Medical Alert",
                  style: themeData.textTheme.headline5.copyWith(
                    color: white,
                    letterSpacing: 0.5,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
                onPressed: () {},
                onLongPress: () async {
                  // Add function to call or send alert to relevant authorities
                },
              ),
            ],
          ),
          elevation: 0.0,
          // actions: <Widget>[
          //   Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       if (online) const Icon(Icons.circle, color: Colors.green),
          //       OutlinedButton(
          //         child: Text(
          //           "Medical Alert",
          //           style:
          //               themeData.textTheme.headline5.copyWith(color: white),
          //         ),
          //         onPressed: () {},
          //       ),
          //     ],
          //   ),
          // ],
        ),
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                    ),
                    child: ListView.builder(
                      reverse: true,
                      padding: const EdgeInsets.only(top: 15.0),
                      physics: const BouncingScrollPhysics(),
                      itemCount: messages.length,
                      itemBuilder: (BuildContext context, int index) {
                        final Message message = messages[index];
                        final bool isMe = message.sender.uid == currentUser;
                        return _buildMessage(message, isMe);
                      },
                    ),
                  ),
                ),
              ),
              _buildMessageComponent(),
            ],
          ),
        ),
      ),
    );
  }
}
