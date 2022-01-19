// ignore_for_file: file_names, avoid_unnecessary_containers

import 'dart:ui';

import 'package:fastex/core/constants/widgetFunction.dart';
import 'package:fastex/src/features/Chats/data/models/messageModel.dart';
import 'package:fastex/src/features/Chats/presentation/pages/chatScreen.dart';
import 'package:flutter/material.dart';

class RecentChats extends StatelessWidget {
  const RecentChats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Expanded(
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
        child: Container(
          // width: MediaQuery.of(context).size.width * 0.95,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
          ),
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: chats.length,
            itemBuilder: (BuildContext context, int index) {
              final Message chat = chats[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ChatScreen(
                        user: chat.sender,
                      ),
                    ),
                  );
                },
                child: Container(
                  width: window.physicalSize.width * 0.5,
                  margin:
                      const EdgeInsets.only(top: 5.0, bottom: 5.0, right: 20),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 7.5),
                  decoration: BoxDecoration(
                    color: chat.unread ? const Color(0xFFFFEFEE) : Colors.white,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(25.0),
                      bottomRight: Radius.circular(25.0),
                    ),
                  ),
                  child: Row(
                    // mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 35.0,
                            backgroundImage: AssetImage(chat.sender.imageUrl),
                          ),
                          addHorizontal(10.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                chat.sender.name,
                                style: themeData.textTheme.headline4,
                              ),
                              addVertical(5.0),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.45,
                                child: Text(
                                  chat.text,
                                  style: chat.unread
                                      ? themeData.textTheme.bodyText2?.copyWith(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15.0)
                                      : themeData.textTheme.bodyText2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            chat.time,
                            style: themeData.textTheme.subtitle2,
                            // const TextStyle(
                            //   color: Colors.grey,
                            //   fontSize: 15.0,
                            //   fontWeight: FontWeight.w600,
                            // ),
                          ),
                          addVertical(5.0),
                          chat.unread
                              ? Container(
                                  width: 40,
                                  height: 20,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColor,
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  child: const Text(
                                    "New",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  alignment: Alignment.center,
                                )
                              : const SizedBox.shrink(),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
