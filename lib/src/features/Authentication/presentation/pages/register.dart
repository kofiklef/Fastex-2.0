import 'dart:ui';

import 'package:fastex/core/constants/constants.dart';
import 'package:fastex/core/constants/widgetFunction.dart';
import 'package:fastex/core/services/database.dart';
import 'package:fastex/core/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/services/authService.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  const Register({Key? key, required this.toggleView}) : super(key: key);

  get tokenId => AuthService();

  @override
  _RegisterState createState() => _RegisterState(toggleView);
}

class _RegisterState extends State<Register> {
  final _formkey = GlobalKey<FormState>();
  final AuthService _auth = AuthService();
  final Database _database = Database();
  bool loading = false;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final userNameController = TextEditingController();
  String error = "";

  _RegisterState(Function toggleView);

  @override
  void initState() {
    super.initState();
    //setupInteractedMessage();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = window.physicalSize.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: lightB,
          title: const Text(
            'Registration Page',
            style: TextStyle(
              fontSize: 20,
              letterSpacing: 1.25,
              color: white,
              fontFamily: "Montserrat",
            ),
          ),
          actions: <Widget>[
            TextButton.icon(
              icon: const Icon(
                Icons.person_outlined,
                color: white,
              ),
              label: const Text(
                'Login',
                style: TextStyle(
                  fontSize: 18,
                  letterSpacing: .75,
                  color: white,
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.w700,
                  //decoration: new InputDecoration( screenWidth < 500 ? TEXT_THEME_SMALL : TEXT_THEME_DEFAULT),
                ),
              ),
              onPressed: () {
                widget.toggleView();
              },
            ),
          ],
        ),
        body: loading
            ? const Loading()
            : Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                child: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Form(
                            key: _formkey,
                            child: Theme(
                              data: ThemeData(
                                brightness: Brightness.dark,
                                primarySwatch: Colors.blue,
                                inputDecorationTheme:
                                    const InputDecorationTheme(
                                  labelStyle: TextStyle(
                                    color: dBlue,
                                    fontSize: 20.0,
                                  ),
                                ),
                                textTheme:
                                    screenWidth < 500 ? smallScreen : bigScreen,
                              ),
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    "Welcome To\n FastEx Deliveries!",
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
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 50.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        buildTextFormField(
                                            "Enter a valid username",
                                            "Username",
                                            false,
                                            true),
                                        addVertical(10),
                                        buildTextFormField(
                                            "Enter a valid email",
                                            "Email",
                                            false,
                                            false),
                                        addVertical(10),
                                        buildTextFormField(
                                            "Enter your password",
                                            "Password",
                                            true,
                                            false),
                                        const Padding(
                                          padding: EdgeInsets.only(top: 20.0),
                                        ),
                                        addVertical(10),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            //! Signup button
                                            ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(25),
                                                ),
                                              ),
                                              child: Text(
                                                'Login',
                                                style: GoogleFonts.mcLaren(
                                                  textStyle: const TextStyle(
                                                    letterSpacing: 2.2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                              onPressed: () {
                                                widget.toggleView();
                                              },
                                            ),
                                            //! Login button
                                            ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(25),
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
                                                if (_formkey.currentState!
                                                    .validate()) {
                                                  setState(
                                                      () => loading = true);
                                                  dynamic result =
                                                      await _auth.signup(
                                                          emailController.text,
                                                          passwordController
                                                              .text);
                                                  Map<String, String> userMap =
                                                      {
                                                    'userName':
                                                        userNameController.text,
                                                    'email':
                                                        emailController.text,
                                                    'password':
                                                        passwordController.text,
                                                  };

                                                  _database
                                                      .uploadUserInfo(userMap);
                                                  if (result == null) {
                                                    loading = false;
                                                    error =
                                                        "An unknown error ...  Please login";
                                                  } else {
                                                    // Toast
                                                  }
                                                }
                                              },
                                            ),
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
                        ],
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  TextFormField buildTextFormField(
      String hint, String label, bool pwd, bool userName) {
    // ignore: unnecessary_new
    return TextFormField(
        validator: (val) => val!.isEmpty
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
          prefixIcon: const Icon(Icons.mail_outline_rounded),
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
        keyboardType: pwd ? TextInputType.text : TextInputType.emailAddress,
        autofillHints: const [AutofillHints.email],
        onChanged: pwd
            ? (val) {
                passwordController.text = val;
              }
            : userName
                ? (value) {
                    userNameController.text = value;
                  }
                : (val) {
                    emailController.text = val;
                  });
  }
}
