// ignore_for_file: no_logic_in_create_state

import 'dart:math';
import 'dart:ui';

import 'package:fastex/core/constants/constants.dart';
import 'package:fastex/core/constants/helperFunctions.dart';
import 'package:fastex/core/constants/widgetFunction.dart';
import 'package:fastex/core/shared/fastexAPI.dart';
import 'package:fastex/core/shared/loading.dart';
import 'package:fastex/src/features/Authentication/data/models/encryption.dart';
import 'package:fastex/src/features/landingPage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  const Register({Key key, @required this.toggleView}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState(toggleView);
}

Random rand = Random();
int number = rand.nextInt(3000);
int customID = number;

class _RegisterState extends State<Register> {
  _RegisterState(Function toggleView);
  double screenWidth = window.physicalSize.width;
  final phoneController = TextEditingController();
  final userController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final FastexAPI _api = FastexAPI();
  // final Database _database = Database();
  bool loading = false;
  String error = "";

  setID() {}

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ocean,
        title: Text(
          "Registeration Page",
          style: themeData.textTheme.headline5,
        ),
        actions: [
          TextButton(
            onPressed: () {
              widget.toggleView;
            },
            child: const Text("Login"),
          ),
        ],
      ),
      body: loading
          ? const Loading()
          : ClipRRect(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                child: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    newForm(context),
                  ],
                ),
              ),
            ),
    );
  }

  Expanded newForm(BuildContext context) {
    return Expanded(
      child: Form(
        key: _formKey,
        child: Theme(
          data: ThemeData(
            brightness: Brightness.dark,
            primarySwatch: Colors.blue,
            inputDecorationTheme: const InputDecorationTheme(
              labelStyle: TextStyle(
                color: dBlue,
                fontSize: 20.0,
              ),
            ),
            textTheme: screenWidth < 500 ? smallScreen : bigScreen,
          ),
          child: Column(
            children: <Widget>[
              Text(
                "Register To\n FastEx Deliveries",
                style: GoogleFonts.mcLaren(
                  textStyle: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: lightB,
                    letterSpacing: 1.75,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),
              addVertical(10),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    buildTextFormField(
                      "Enter Username",
                      "UserName",
                      false,
                      true,
                      false,
                      const Icon(Icons.person),
                      userController,
                    ),
                    addVertical(10),
                    buildTextFormField(
                      "Enter Phone Number",
                      "Phone",
                      false,
                      false,
                      true,
                      const Icon(Icons.phone),
                      phoneController,
                    ),
                    addVertical(10),
                    buildTextFormField(
                      "Enter a valid email",
                      "Email",
                      false,
                      false,
                      false,
                      const Icon(Icons.email),
                      emailController,
                    ),
                    addVertical(10),
                    buildTextFormField(
                      "Enter your password",
                      "Password",
                      true,
                      false,
                      false,
                      const Icon(Icons.lock),
                      passwordController,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 15.0),
                    ),
                    addVertical(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        registerButton(context),
                      ],
                    ),
                    addVertical(15),
                    Text(
                      error,
                      style: GoogleFonts.mcLaren(
                        textStyle: TextStyle(
                          color: Colors.red[500],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ElevatedButton registerButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
      child: Text(
        'Register',
        style: GoogleFonts.mcLaren(
          textStyle: const TextStyle(
            letterSpacing: 2.2,
            color: Colors.black,
          ),
        ),
      ),
      onPressed: () async {
        if (_formKey.currentState.validate()) {
          setState(() {
            loading = true;
          });
          var plainText, passwordHash;
          plainText = passwordController.text.trim();
          passwordHash = EncryptionsDecryption.encryptAES(plainText);

          await registerMe(
            customID,
            userController.text,
            emailController.text,
            passwordHash.toString(),
            phoneController.text,
          );
        }
      },
    );
  }

  TextFormField buildTextFormField(
    String hint,
    label,
    bool pwd,
    userName,
    isPhone,
    Icon icon,
    TextEditingController controller,
  ) {
    return TextFormField(
      validator: (val) => val.isEmpty
          ? 'Create an account using a registered email address'
          : null,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(
          color: white,
          fontWeight: FontWeight.bold,
        ),
        labelText: label,
        labelStyle: const TextStyle(
          color: white,
          fontWeight: FontWeight.bold,
        ),
        border: InputBorder.none,
        prefixIcon: icon,
        fillColor: ocean,
        filled: true,
        focusColor: dBlue,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(color: dBlue),
        ),
        enabledBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(color: dBlue),
        ),
      ),
      obscureText: pwd ? true : false,
      keyboardType: pwd
          ? TextInputType.text
          : isPhone
              ? TextInputType.phone
              : TextInputType.emailAddress,
      autofillHints: const [AutofillHints.email],
      onChanged: userName
          ? (val) {
              userController.text = val;
            }
          : (isPhone
              ? (val) {
                  phoneController.text = val;
                }
              : (pwd
                  ? (val) {
                      passwordController.text = val;
                    }
                  : (val) {
                      emailController.text = val;
                    })),
    );
  }

  registerMe(int id, String email, password, userName, phoneNumber) async {
    var plainText, passwordHash;
    // var authority = _api.authority;
    plainText = passwordController.text;
    passwordHash = EncryptionsDecryption.encryptAES(plainText);
    Map<dynamic, dynamic> _mappedData = {
      "id": setID,
      "email": emailController.text,
      "userName": userController.text,
      "passwordHash": passwordHash,
      "phoneNumber": phoneController.text,
      "isVendor": false,
      "agreedTOC": false,
    };
    try {
      setState(() {
        loading = true;
        HelperFunctions.saveEncryptedPassword(passwordHash);
        // HelperFunctions.save
      });
      try {
        _api
            .registerUser(
          setID(),
          userName,
          email,
          passwordHash,
          phoneNumber,
        )
            .then((response) {
          setState(() {
            loading = false;
          });
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const LandingPage(),
            ),
          );
          // if (response.statusCode == 200) {
          //   Navigator.pushReplacement(
          //     context,
          //     MaterialPageRoute(
          //       builder: (context) => const LandingPage(),
          //     ),
          //   );
          // } else {
          //   print(response.statusCode);
          // }
        });
      } catch (e) {
        return null;
      }
    } catch (err) {
      return err.toString();
    }
  }
}
