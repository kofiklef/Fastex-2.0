// import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:encrypt/encrypt.dart';

class EncryptionsDecryption {
  static final key = Key.fromLength(32);
  static final iv = IV.fromLength(16);
  static final encrypter = Encrypter(AES(key));

  static encryptAES(String text) {
    final passwordHash = encrypter.encrypt(text, iv: iv);
    // print(passwordHash.bytes);
    print(passwordHash.base16);
    print(passwordHash.base64);
    print("NOW YOU SEE ME!");
    return passwordHash;
  }

  static decryptAES(text) {
    return encrypter.decrypt(text, iv: iv);
  }
}
