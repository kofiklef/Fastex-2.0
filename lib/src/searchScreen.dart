// ignore_for_file: unnecessary_null_comparison

import 'package:fastex/core/constants/constants.dart';
import 'package:fastex/core/constants/helperFunctions.dart';
import 'package:fastex/core/constants/widgetFunction.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key key}) : super(key: key);
  // final String userName;

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

// String _myName;

class _SearchScreenState extends State<SearchScreen> {
  // final Database _database = Database();
  final TextEditingController searchUsernameController =
      TextEditingController();

  Widget searchTile({
    String foodName,
    DateTime day,
    @required BuildContext context,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                foodName,
                style: const TextStyle(overflow: TextOverflow.ellipsis),
              ),
              addVertical(6.5),
              SizedBox(
                width: 250,
                child: Text(
                  day.toString(),
                  style: const TextStyle(overflow: TextOverflow.ellipsis),
                ),
              ),
            ],
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: () {
              // createChatRoom(userName: userName);
            },
            child: const Text("Message"),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              primary: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    // initiateSearch();
    getUserInfo();
    searchUsernameController.addListener(() {
      final String message = searchUsernameController.text;
      searchUsernameController.value = searchUsernameController.value.copyWith(
        text: message,
        selection: TextSelection(
          baseOffset: message.length,
          extentOffset: message.length,
        ),
        composing: TextRange.empty,
      );
    });
  }

  @override
  void dispose() {
    searchUsernameController.dispose();
    // initiateSearch();
    super.dispose();
  }

  // QuerySnapshot searchSnapshot = FirebaseFirestore.instance
  //     .collection("Food")
  //     .where("foodName") as QuerySnapshot<Object>;

  // }

  Widget searchList() {
    return searchUsernameController.text == null
        ? ListView.builder(
            // itemCount: searchSnapshot.docs.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return searchTile(
                // day: searchSnapshot.docs[index].get("email"),
                // foodName: searchSnapshot.docs[index].get("name"),
                context: context,
              );
            },
          )
        : Container(
            child: const Center(
              child: Text(
                "No result...",
                style: TextStyle(color: black),
              ),
            ),
          );
  }

  getUserInfo() async {
    await HelperFunctions.getUserName();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () async {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_outlined,
            size: 23,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.wb_sunny_rounded),
            onPressed: () {},
          ),
        ],
        title: Text(
          "Search...",
          style: GoogleFonts.lato(
              fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: white.withAlpha(150),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    ClipRRect(
                      child: SizedBox(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 9,
                            // vertical: 10,
                          ),
                          child: GestureDetector(
                            onTap: () {
                              FocusScope.of(context).unfocus();
                            },
                            child: Container(
                              height: 44,
                              margin: const EdgeInsets.all(9),
                              padding: const EdgeInsets.only(left: 5),
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ), // set rounded corner radius
                              ),
                              child: Center(
                                child: TextField(
                                  controller: searchUsernameController,
                                  onChanged: (val) {
                                    setState(() {
                                      searchUsernameController.text = val;
                                      if (kDebugMode) {
                                        print(val);
                                      }
                                    });
                                  },
                                  style: const TextStyle(color: Colors.black54),
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                          color: Colors.black87, width: 0.0),
                                    ),
                                    focusedBorder: const OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      borderSide: BorderSide(
                                          color: Colors.blueAccent, width: 0.7),
                                    ),
                                    hintText: 'Search Username...',
                                    hintStyle: const TextStyle(
                                        fontSize: 17, color: Colors.black54),
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        // initiateSearch();
                                      },
                                      icon: const Icon(Icons.search),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    searchList(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

getChatRoomId(String a, String b) {
  if (a.substring(0, 1).codeUnitAt(0) > b.substring(0, 1).codeUnitAt(0)) {
    return "$a\_$b";
  } else {
    return "$b\_$a";
  }
}
