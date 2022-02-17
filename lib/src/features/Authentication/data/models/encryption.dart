import 'package:encrypt/encrypt.dart' as encrypt;

class EncryptionsDecryption {
  static final key = encrypt.Key.fromLength(32);
  static final iv = encrypt.IV.fromLength(16);
  static final encrypter = encrypt.Encrypter(encrypt.AES(key));

  static encryptAES(text) {
    final passwordHash = encrypter.encrypt(text, iv: iv);
    print(passwordHash.bytes);
    print(passwordHash.base16);
    print(passwordHash.base64);
    return passwordHash;
  }

  static decryptAES(text) {
    return encrypter.decrypt(text, iv: iv);

  }
}
