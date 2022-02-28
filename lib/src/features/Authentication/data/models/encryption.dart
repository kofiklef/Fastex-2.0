// import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:encrypt/encrypt.dart';

class EncryptionsDecryption {
  static final key = Key.fromLength(32);
  static final iv = IV.fromLength(12);
  static final encrypter = Encrypter(AES(key));

  static encryptAES(String text) {
    return encrypter.encrypt(text, iv: iv);
  }

  static decryptAES(Encrypted text) {
    return encrypter.decrypt(text, iv: iv);
  }
}
