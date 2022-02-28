import 'dart:ui';

import 'package:fastex/core/constants/constants.dart';
import 'package:fastex/core/constants/widgetFunction.dart';
import 'package:fastex/core/shared/fastexAPI.dart';
import 'package:fastex/core/shared/loading.dart';
import 'package:fastex/src/features/Authentication/data/models/authModels.dart';
import 'package:fastex/src/features/Authentication/presentation/pages/register.dart';
import 'package:fastex/src/features/landingPage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class Login extends StatefulWidget {
  final Function toggleView;
  const Login({Key key, this.toggleView}) : super(key: key);

  // get tokenId => AuthService();

  @override
  _LoginState createState() => _LoginState(toggleView);
}

class _LoginState extends State<Login> {
  final _formkey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();

  final FastexAPI _api = FastexAPI();

  bool loading = false;
  bool isDisabled = true;
  String error = "";
  bool isAPIcall = false;
  _LoginState(Function toggleView);
  AuthRequest authRequest;

  @override
  void initState() {
    super.initState();
    authRequest = AuthRequest();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    authRequest;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Loading(
      child: uiBuild(context),
      isAsyncCall: isAPIcall,
      opacity: 0.75,
    );
  }

  Widget uiBuild(BuildContext context) {
    double screenWidth = window.physicalSize.width;
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: appBarComponent(
          dBlue,
          null,
          "Login Page",
          const Icon(Icons.person, color: white),
          () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Register()));
          },
          "",
        ),
        body: ClipRRect(
          child: details(screenWidth, size, context),
        ),
      ),
    );
  }

  Container details(double screenWidth, Size size, BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 1,
      ),
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          ClipRRect(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  onChanged: () {
                    final form = _formkey.currentState;
                    setState(() {
                      if (form.validate()) {
                        isDisabled = false;
                      } else {
                        isDisabled = true;
                      }
                    });
                  },
                  key: _formkey,
                  child: Column(
                    children: <Widget>[
                      Text(
                        "Login into your account!",
                        style: GoogleFonts.lato(
                          textStyle: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: dBlue,
                            letterSpacing: 1.75,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                      addVertical(size.height * 0.01),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 50.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            buildTextFormField(
                              "Enter A valid Email address",
                              "Email",
                              emailController,
                              true,
                            ),
                            addVertical(size.height * 0.01),
                            buildTextFormField(
                              'Enter password',
                              'Password',
                              passwordController,
                              false,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 20.0),
                            ),
                            addVertical(size.height * 0.01),
                            SizedBox(
                              height: size.height * 0.07,
                              width: size.width,
                              child: loginButton(
                                context,
                                "Login",
                                isDisabled
                                    ? null
                                    : () async {
                                        // signIn();
                                        if (validateAndSave()) {
                                          setState(() {
                                            isAPIcall = true;
                                          });

                                          _api
                                              .login(authRequest)
                                              .then((value) => {
                                                    setState(() {
                                                      isAPIcall = false;
                                                    }),
                                                    Navigator.pushReplacement(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            const LandingPage(),
                                                      ),
                                                    )
                                                  });
                                          showTopSnackBar(
                                            context,
                                            const CustomSnackBar.success(
                                              message:
                                                  "You have sucessfully logged into your account!",
                                            ),
                                          );
                                          print(authRequest.toJson());
                                        }
                                      },
                              ),
                            ),
                            addVertical(size.height * 0.015),
                            Text(
                              error,
                              style: GoogleFonts.lato(
                                textStyle: TextStyle(
                                  color: Colors.red[500],
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      addVertical(size.height * 0.0015),
                      Text(
                        "\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tOr \nCreate an Account with Us!",
                        style: GoogleFonts.lato(
                          textStyle: const TextStyle(
                            fontSize: 18,
                            color: orange,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      addVertical(size.height * 0.025),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50.0),
                        child: SizedBox(
                          height: size.height * 0.07,
                          width: size.width,
                          child: loginButton(
                            context,
                            "Register",
                            () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Register(),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  ElevatedButton loginButton(
      BuildContext context, String text, Function function) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: dBlue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Text(
        text,
        style: GoogleFonts.lato(
          textStyle: const TextStyle(
            fontSize: 22,
            letterSpacing: 2.2,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      // onPressed: () async {
      //   // signIn();
      //   if (validateAndSave()) {
      //     setState(() {
      //       isAPIcall = true;
      //     });

      //     _api.login(authRequest).then((value) => {
      //           setState(() {
      //             isAPIcall = false;
      //           }),
      //           Navigator.pushReplacement(
      //             context,
      //             MaterialPageRoute(
      //               builder: (context) => const LandingPage(),
      //             ),
      //           )
      //         });
      //     print(authRequest.toJson());
      //   }
      // },
      onPressed: function,
    );
  }

  bool validateAndSave() {
    final form = _formkey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  TextFormField buildTextFormField(
      String hint, label, TextEditingController controller, bool isEmail) {
    return TextFormField(
      validator: (val) => val.isEmpty &&
              val !=
                  RegExp("a-zA-Z0-9." "@a-z" ".a-z")
                      .hasMatch(emailController.text)
          ? "Should match 'abcd@efghi.com'!"
          : null,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: GoogleFonts.lato(
          textStyle: const TextStyle(
            fontSize: 14,
            letterSpacing: 1,
            color: bGrey,
            fontWeight: FontWeight.bold,
          ),
        ),
        labelText: label,
        labelStyle: GoogleFonts.lato(
          textStyle: const TextStyle(
            fontSize: 14,
            letterSpacing: 1,
            color: bGrey,
            fontWeight: FontWeight.bold,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: Color(0x00008baa),
          ),
        ),
        prefixIcon: isEmail
            ? const Icon(Icons.mail_outline_rounded, color: orange)
            : const Icon(Icons.lock, color: orange),
        fillColor: white,
        filled: true,
        focusColor: lightB,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: orange,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: dBlue,
          ),
        ),
      ),
      keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
      onChanged: isEmail
          ? (val) {
              emailController.text = val;
            }
          : (val) {
              passwordController.text = val;
            },
      // onSaved: (input) =>
      //     isEmail ? authRequest.email = input : authRequest.password = input,
      obscureText: !isEmail ? true : false,
    );
  }
}
