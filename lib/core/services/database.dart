import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  final String? uid;
  Database({this.uid});

  final CollectionReference foodCollection =
      FirebaseFirestore.instance.collection('Foods');

  uploadUserInfo(userMap) {
    FirebaseFirestore.instance.collection("End_Users").add(userMap);
  }

  


}
