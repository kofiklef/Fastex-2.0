import 'dart:ui';

import 'package:fastex/core/constants/constants.dart';
import 'package:fastex/core/constants/widgetFunction.dart';
import 'package:fastex/core/services/authService.dart';
import 'package:fastex/core/services/database.dart';
import 'package:fastex/core/shared/loading.dart';
import 'package:fastex/src/features/landingPage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  final Function toggleView;
  const Login({Key? key, required this.toggleView}) : super(key: key);

  @override
  _LoginState createState() => _LoginState(toggleView);
}

class _LoginState extends State<Login> {
  _LoginState(Function toggleView);
  double screenWidth = window.physicalSize.width;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final AuthService _auth = AuthService();
  final Database _database = Database();
  bool loading = false;
  String error = "";

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ocean,
        title: Text(
          "Login",
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
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
              child: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Expanded(
                    child: Column(
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
                              textTheme:
                                  screenWidth < 500 ? smallScreen : bigScreen,
                            ),
                            child: Column(
                              children: <Widget>[
                                Text(
                                  "Login To\n FastEx Deliveries!",
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
                                        "Enter a valid email",
                                        "Email",
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
                                        const Icon(Icons.lock),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(top: 20.0),
                                      ),
                                      addVertical(10),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
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
                                            onPressed: () {
                                              widget.toggleView();
                                            },
                                          ),
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
                                            onPressed: () async {
                                              if (_formKey.currentState!
                                                  .validate()) {
                                                setState(() {
                                                  loading = true;
                                                });
                                                dynamic result = await _auth
                                                    .login(
                                                  emailController.text,
                                                  passwordController.text,
                                                  context: context,
                                                )
                                                    .then((value) {
                                                  if (value != null) {
                                                    // HelperFunctions.saveUserLoggedInState(true);
                                                    Navigator.pushReplacement(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            const LandingPage(),
                                                      ),
                                                    );
                                                  }
                                                });
                                              } else {
                                                return;
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
    );
  }

  TextFormField buildTextFormField(
      String hint, String label, bool pwd, bool userName, Icon icon) {
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
        keyboardType: pwd ? TextInputType.text : TextInputType.emailAddress,
        autofillHints: const [AutofillHints.email],
        onChanged: pwd
            ? (val) {
                passwordController.text = val;
              }
            : (val) {
                emailController.text = val;
              });
  }
}
