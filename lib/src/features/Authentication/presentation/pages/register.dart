// ignore_for_file: unrelated_type_equality_checks, missing_return, missing_required_param

import 'dart:convert';
import 'dart:ui';

import 'package:fastex/core/constants/constants.dart';
import 'package:fastex/core/constants/widgetFunction.dart';
import 'package:fastex/core/shared/fastexAPI.dart';
import 'package:fastex/core/shared/loading.dart';
import 'package:fastex/src/features/Authentication/data/models/encryption.dart';
import 'package:fastex/src/features/Authentication/presentation/pages/login.dart';
import 'package:fastex/src/features/landingPage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  const Register({Key key, this.toggleView}) : super(key: key);

  // get tokenId => AuthService();

  @override
  _RegisterState createState() => _RegisterState(toggleView);
}

class _RegisterState extends State<Register> {
  final _formkey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();

  final FastexAPI _api = FastexAPI();

  bool loading = false;
  bool isButtonDisabled = true;
  String error = "";
  bool isAPIcall = false;
  _RegisterState(Function toggleView);
  Map<String, dynamic> userMap;

  @override
  void initState() {
    super.initState();
    // setButtonStatus();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    userMap;
    // setButtonStatus();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Loading(
        child: uiBuild(context),
        isAsyncCall: isAPIcall,
        opacity: 0.75,
      ),
    );
  }

  Widget uiBuild(BuildContext context) {
    double screenWidth = window.physicalSize.width;
    return SafeArea(
      child: Scaffold(
        appBar: appBarComponent(
          dBlue,
          null,
          "Registration Page",
          const Icon(
            Icons.person_outlined,
            color: white,
          ),
          () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Login()));
          },
          "",
        ),
        body: ClipRRect(
          child: details(screenWidth),
        ),
      ),
    );
  }

  Container details(double screenWidth) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 1,
      ),
      child: GestureDetector(
        onTap: FocusScope.of(context).unfocus,
        child: Stack(
          fit: StackFit.loose,
          children: <Widget>[
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Form(
                key: _formkey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                onChanged: () {
                  final form = _formkey.currentState;
                  setState(() {
                    if (form.validate()) {
                      isButtonDisabled = false;
                    } else {
                      if (emailController.text.isEmpty ||
                          passwordController.text.isEmpty ||
                          phoneController.text.isEmpty) {
                        isButtonDisabled = true;
                      }
                    }
                  });
                },
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Text(
                        "Create a new account!",
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
                    ),
                    addVertical(size.height * 0.025),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 50.0),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            buildTextFormField(
                              "Enter Your Username",
                              "Username",
                              nameController,
                              false,
                              true,
                              false,
                              false,
                            ),
                            addVertical(size.height * 0.001),
                            buildTextFormField(
                              'Enter Phone Number',
                              'Phone Number',
                              phoneController,
                              false,
                              false,
                              true,
                              false,
                            ),
                            addVertical(size.height * 0.001),
                            buildTextFormField(
                              "Enter A valid Email Address",
                              "Email",
                              emailController,
                              true,
                              false,
                              false,
                              false,
                            ),
                            addVertical(size.height * 0.001),
                            buildTextFormField(
                              'Enter password',
                              'Password',
                              passwordController,
                              false,
                              false,
                              false,
                              true,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 20.0),
                            ),
                            SizedBox(
                              height: size.height * 0.07,
                              width: size.width,
                              child: registerButton(),
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
                    ),
                  ],
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }

  ElevatedButton registerButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: isButtonDisabled ? bGrey : dBlue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Text(
        'Register',
        style: GoogleFonts.lato(
          textStyle: const TextStyle(
            fontSize: 22,
            letterSpacing: 2.2,
            color: white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      onPressed: isButtonDisabled ? null : onButtonPressed,
    );
  }

  void onButtonPressed() async {
    // signIn();
    if (validateAndSave()) {
      setState(() {
        isAPIcall = true;
      });
      var plainText = passwordController.text;
      dynamic encrypted = EncryptionsDecryption.encryptAES(plainText);
      Map<String, dynamic> userMap = {
        "id": null,
        "firstName": "",
        "middleName": "",
        "lastName": "",
        "userName": nameController.text,
        "email": emailController.text,
        "passwordHash": encrypted.toString(),
        "phoneNumber": phoneController.text,
        "isVendor": false,
        "agreedTOC": false
      };
      var authority = "fastexapi.azurewebsites.net";
      var response =
          await _api.authData(userMap, "$authority/api/Users/AddUser");
      var boddy = json.decode(response.body);
      if (boddy['message'] == "Success") {
        SharedPreferences localStorage = await SharedPreferences.getInstance();
        localStorage.setString('token', json.encode(boddy['token']));
        localStorage.setString('name', json.encode(boddy['name']));
      }
      setState(() {
        isAPIcall = false;
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const LandingPage(),
          ),
        );
      });
      showTopSnackBar(
        context,
        CustomSnackBar.success(
          message: "Account created for: ${emailController.text}",
        ),
      );
    }
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

  SizedBox buildTextFormField(
      String hint,
      label,
      TextEditingController controller,
      bool isEmail,
      bool isUser,
      bool phone,
      bool pwd) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.09,
      child: TextFormField(
        validator: (val) => val.isEmpty
            ? (isEmail
                ? 'Create an account using a registered address'
                : (phone ? "Format must match 020 xxxxxxx" : null))
            : null,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: GoogleFonts.lato(
            textStyle: const TextStyle(
              fontSize: 12,
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
              ? const Icon(Icons.mail_outline_rounded, color: Colors.orange)
              : (phone
                  ? const Icon(Icons.phone, color: Colors.orange)
                  : (isUser
                      ? const Icon(Icons.person, color: Colors.orange)
                      : const Icon(Icons.lock, color: Colors.orange))),
          fillColor: white,
          filled: true,
          focusColor: lightB,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              color: Colors.orange,
              // width: 20
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              color: dBlue,
            ),
          ),
        ),
        keyboardType: phone ? TextInputType.phone : TextInputType.emailAddress,
        // on÷
        onChanged: isEmail
            ? (val) {
                val = emailController.text;
              }
            : (isUser
                ? (val) {
                    val = nameController.text;
                  }
                : (!phone
                    ? (val) {
                        val = passwordController.text;
                      }
                    : (val) {
                        val = phoneController.text;
                      })),
        obscureText: pwd ? true : false,
      ),
    );
  }
}
