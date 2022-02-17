// ignore_for_file: no_logic_in_create_state

// import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:ui';

import 'package:fastex/core/constants/constants.dart';
// import 'package:fastex/core/constants/helperFunctions.dart';
import 'package:fastex/core/constants/widgetFunction.dart';
import 'package:fastex/core/shared/fastexAPI.dart';
import 'package:fastex/core/shared/loading.dart';
import 'package:fastex/src/features/Authentication/data/models/encryption.dart';
import 'package:fastex/src/features/landingPage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class Register extends StatefulWidget {
  final Function toggleView;
  const Register({Key key, @required this.toggleView}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState(toggleView);
}

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
  int id;

  void setID() {
    Random rand = Random();
    int number = rand.nextInt(3000);
    if (Platform.isAndroid) {
      setState(() {
        id = id;
      });
    } else {
      setState(() {
        id = id;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ocean,
        title: Text(
          "Register",
          style: themeData.textTheme.headline5,
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              widget.toggleView();
            },
            child: const Text("Register"),
          ),
        ],
      ),
      body: loading
          ? const Loading()
          : Container(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  newForm(context),
                ],
              ),
            ),
    );
  }

  Expanded newForm(BuildContext context) {
    return Expanded(
      child: Column(
        verticalDirection: VerticalDirection.down,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Form(
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
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Text(
                      "Register To\n FastEx Deliveries",
                      style: GoogleFonts.mcLaren(
                        textStyle: const TextStyle(
                          fontSize: 28,
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
                          ),
                          addVertical(10),
                          buildTextFormField(
                            "Enter Phone Number",
                            "Phone",
                            false,
                            true,
                            true,
                            const Icon(Icons.phone),
                          ),
                          addVertical(10),
                          buildTextFormField(
                            "Enter a valid email",
                            "Email",
                            false,
                            false,
                            false,
                            const Icon(Icons.email),
                          ),
                          addVertical(10),
                          buildTextFormField(
                            "Enter your password",
                            "Password",
                            true,
                            false,
                            false,
                            const Icon(Icons.lock),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 20.0),
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
          ),
        ],
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
            // Password Encryyption
            var plainText, passwordHash;
            plainText = passwordController.text;
            setState(() {
              passwordHash = EncryptionsDecryption.encryptAES(plainText); 
            });

            _api
                .registerUser(
                  id,
                  userController.text,
                  emailController.text,
                  passwordHash,
                  phoneController.text,
                )
                .then(
                  (value) => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LandingPage(),
                    ),
                  ),
                );
          });
        }
      },
    );
  }

  TextFormField buildTextFormField(String hint, String label, bool pwd,
      bool userName, bool isPhone, Icon icon) {
    // ignore: unnecessary_new
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
        onChanged: pwd
            ? (val) {
                passwordController.text = val;
              }
            : !userName
                ? (val) {
                    emailController.text = val;
                  }
                : !isPhone
                    ? (val) {
                        userController.text = val;
                      }
                    : (val) {
                        phoneController.text = val;
                      });
  }

  registerMe(String email, password, userName, phoneNumber) async {
    var authority = _api.authority;
    var response = await http.post(Uri.https(
      authority,
      "api/Users/AddUser",
    ));
    Map<String, dynamic> _mapedData = {
      "email": email,
      "password": password,
      "userName": userName,
      "phoneNumber": phoneNumber
    };
    try {
      if (response.statusCode == 200) {
        setState(() {
          loading = false;
        });
        _api
            .registerUser(
              id,
              userName,
              email,
              password,
              phoneNumber,
            )
            .then(
              (value) => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LandingPage(),
                ),
              ),
            );
      }
    } catch (error) {
      throw Exception("BAD REQUEST!");
    }
  }
}
