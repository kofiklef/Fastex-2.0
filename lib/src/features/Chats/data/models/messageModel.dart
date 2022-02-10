// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';

import 'user_Model.dart';

class Message {
  final Userr sender;
  final String time, text;
  final bool isLiked, unread;

  Message({
    @required this.sender,
    @required this.time,
    @required this.text,
    @required this.isLiked,
    @required this.unread,
  });
}

class Group {
  final Userr sender;
  final String time, text;
  final bool unRead;

  Group({
    @required this.sender,
    @required this.time,
    @required this.text,
    @required this.unRead,
  });
}

// Current User
final Userr currentUser = Userr(
  uid: 0,
  name: "Current User",
  imageUrl: 'assets/images/user.jpg',
);

final Userr currentUserr = Userr(
  uid: 0,
  name: "Current Group",
  imageUrl: 'assets/images/user.jpg',
);

// Other users
final Userr user = Userr(
  uid: 1,
  name: "Prince",
  imageUrl: 'assets/images/0.jpg',
);

final Userr user1 = Userr(
  uid: 2,
  name: "David",
  imageUrl: 'assets/images/1.jpg',
);

final Userr user2 = Userr(
  uid: 3,
  name: "Michael",
  imageUrl: 'assets/images/2.jpg',
);

final Userr user3 = Userr(
  uid: 4,
  name: "Samuel",
  imageUrl: 'assets/images/3.jpg',
);

final Userr user4 = Userr(
  uid: 5,
  name: "Benjamin",
  imageUrl: 'assets/images/4.jpg',
);

final Userr user5 = Userr(
  uid: 6,
  name: "Adwowa",
  imageUrl: 'assets/images/5.jpg',
);

final Userr user6 = Userr(
  uid: 7,
  name: "Esther",
  imageUrl: 'assets/images/4.jpg',
);

final Userr user7 = Userr(
  uid: 8,
  name: "John",
  imageUrl: 'assets/images/7.jpg',
);

final Userr user8 = Userr(
  uid: 9,
  name: "Derrick",
  imageUrl: 'assets/images/8.jpg',
);

final Userr user9 = Userr(
  uid: 10,
  name: "Steve",
  imageUrl: 'assets/images/9.jpg',
);

// Favorite contacts
List<Userr> fav = [user5, user6, user3, user, user9];

// Favorite Groups
List<Userr> fav_group = [userr, userr2, userr4, userr1, userr3];

List<Message> chats = [
  Message(
    sender: user2,
    time: "12:35 PM",
    text: "Heyyy",
    isLiked: false,
    unread: false,
  ),
  Message(
    sender: user5,
    time: "11:40 AM",
    text: "Sleep",
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: user9,
    time: "11:37 AM",
    text: "Documents received...",
    isLiked: true,
    unread: false,
  ),
  Message(
    sender: user,
    time: "11:35 AM",
    text: "What dey pap",
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: user6,
    time: "11:05 AM",
    text: "Heyyy, I got your message! Meet me at the scheduled time!",
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: user7,
    time: "10:45 AM",
    text: "Heyyy",
    isLiked: true,
    unread: false,
  ),
  Message(
    sender: user3,
    time: "10:38 AM",
    text: "Be sure to improve on the UX in the upcoming release",
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: user8,
    time: "10:35 AM",
    text: "Send me a copy ASAP...",
    isLiked: true,
    unread: false,
  ),
];

// Example messages in chat screen
List<Message> messages = [
  Message(
    sender: user5,
    time: "5:30 PM",
    text: "How are you doing",
    unread: true,
    isLiked: true,
  ),
  Message(
    sender: currentUser,
    time: "4:30 PM",
    text: "I'm good, yourself",
    unread: false,
    isLiked: true,
  ),
  Message(
    sender: user5,
    time: "3:45 PM",
    text: "I'm also great... \nHow are we suppossed to go about this",
    unread: true,
    isLiked: true,
  ),
  Message(
    sender: currentUser,
    time: "3:15 PM",
    text: "How are we suppossed to go about this \n ASK THE BOSS",
    unread: true,
    isLiked: true,
  ),
  Message(
    sender: user5,
    time: "2:30 PM",
    text: "How am I suppossed to ask him if I don't even see him at work",
    unread: false,
    isLiked: true,
  ),
  Message(
    sender: user5,
    time: "2:00 PM",
    text: "hmmm...",
    unread: false,
    isLiked: true,
  ),
  Message(
    sender: currentUser,
    time: "12:30 PM",
    text: "3y3 asem ooo...",
    unread: true,
    isLiked: true,
  ),
];

// Group Messages
List<Group> groupsMessage = [
  Group(
    sender: currentUser,
    time: "5:25 PM",
    text: "Hello, I'm new here!",
    unRead: true,
  ),
  Group(
    sender: user,
    time: "5:20 PM",
    text: "Hello, I'm also new here!",
    unRead: true,
  ),
  Group(
    sender: currentUser,
    time: "5:15 PM",
    text: "Hello, I'm new here!",
    unRead: true,
  ),
];

List<Group> groupChat = [
  Group(
    sender: userr2,
    time: "12:35 PM",
    text: "Guys, I'm kinda stuck. More info on the repo on GitHub",
    // isLiked: false,
    unRead: false,
  ),
  Group(
    sender: userr,
    time: "11:35 AM",
    text: "What dey pap",
    // isLiked: false,
    unRead: true,
  ),
  Group(
    sender: userr6,
    time: "11:05 AM",
    text:
        "Heyyy, I got your message! Meet me at the scheduled time so we go to the court together!",
    // isLiked: false,
    unRead: true,
  ),
  Group(
    sender: userr5,
    time: "10:45 AM",
    text: "Gooallll!!! Bayern Munich",
    // isLiked: true,
    unRead: false,
  ),
  Group(
    sender: userr3,
    time: "10:38 AM",
    text: "Be sure to improve on the UX in the upcoming release",
    // isLiked: false,
    unRead: true,
  ),
  Group(
    sender: userr2,
    time: "10:35 AM",
    text: "Send me a copy ASAP...",
    // isLiked: true,
    unRead: false,
  ),
];

// Group Names
final Userr userr = Userr(
  uid: 1,
  name: "Casantay Global",
  imageUrl: 'assets/images/0.jpg',
);

final Userr userr1 = Userr(
  uid: 2,
  name: "Our Family - 1",
  imageUrl: 'assets/images/1.jpg',
);

final Userr userr2 = Userr(
  uid: 3,
  name: "All Devs",
  imageUrl: 'assets/images/2.jpg',
);

final Userr userr3 = Userr(
  uid: 4,
  name: "StackOverflow",
  imageUrl: 'assets/images/3.jpg',
);

final Userr userr4 = Userr(
  uid: 5,
  name: "Youth Ministry",
  imageUrl: 'assets/images/4.jpg',
);

final Userr userr5 = Userr(
  uid: 6,
  name: "Footbal Fans",
  imageUrl: 'assets/images/5.jpg',
);

final Userr userr6 = Userr(
  uid: 7,
  name: "Basketball Lovers",
  imageUrl: 'assets/images/4.jpg',
);
