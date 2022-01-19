// ignore_for_file: file_names

class Userr {
  final String name, imageUrl;
  final int uid;

  Userr({
    required this.uid,
    required this.name,
    required this.imageUrl,
  });
}

class Vendor {
  final String name, imageUrl, type;
  final int vid;

  Vendor({
    required this.vid,
    required this.name,
    required this.imageUrl,
    required this.type,
  });
}
