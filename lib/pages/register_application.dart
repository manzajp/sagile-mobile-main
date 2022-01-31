import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:sagile_mobile_main/model/user.dart';
import '../static.dart';

class RegisterWidget extends StatefulWidget {
  const RegisterWidget({Key? key}) : super(key: key);
  @override
  _RegisterWidgetState createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
  // Required for form validations
  final formKey = GlobalKey<FormState>();

  // Handles text onchange
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpwController = TextEditingController();

  // Http post request to create new data
  Future _createUser() async {
    try {
      final res = await http.post(
        Uri.parse("${Env.URL_PREFIX}/users/details.php"),
        body: {
          "username": usernameController.text,
        },
      );
      var result = json.decode(res.body)['result'];
      if (result == false) {
        setState(() {
          usernameDuplicate = false;
          formKey.currentState!.validate();
        });

        // Create a new User entry
        await http.post(
          Uri.parse("${Env.URL_PREFIX}/users/create.php"),
          body: {
            "username": usernameController.text,
            "email": emailController.text,
            "password": passwordController.text,
          },
        );
        print('haha acc go brr brr');
        Navigator.pop(context);
      } else {
        setState(() {
          usernameDuplicate = true;
          formKey.currentState!.validate();
        });
        print('haha acc exists');
      }
      print("received respond!");
    } on Exception catch (e) {
      // TODO
      print('no server bro');
    }
  }

  void _onCreate(context) async {
    await _createUser();
  }

  bool usernameDuplicate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: Text(
              'SAgile',
              style: GoogleFonts.robotoCondensed(
                fontSize: 50.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            padding: const EdgeInsets.symmetric(vertical: 50),
            alignment: Alignment.center,
          ),
          Form(
            key: formKey,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: TextFormField(
                        controller: usernameController,
                        style: GoogleFonts.robotoCondensed(
                            fontSize: 16.0, fontWeight: FontWeight.normal),
                        decoration: const InputDecoration(
                          labelText: 'Username',
                          hintText: 'Enter your username here...',
                        ),
                        validator: (username) {
                          if (username!.length < 8) {
                            return 'Username must be more than 7 character!';
                          } else if (usernameDuplicate == true) {
                            usernameDuplicate = false;
                            return 'Username already in use!';
                          }
                          return null;
                        }),
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    alignment: Alignment.center,
                  ),
                  Container(
                    child: TextFormField(
                      controller: emailController,
                      style: GoogleFonts.robotoCondensed(
                          fontSize: 16.0, fontWeight: FontWeight.normal),
                      decoration: const InputDecoration(
                        labelText: 'Email Address',
                        hintText: 'Enter your email address here...',
                      ),
                      validator: (email) {
                        RegExp regex = RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                        if (email!.isEmpty) {
                          return 'Please enter your email address!';
                        } else if (!regex.hasMatch(email)) {
                          return 'Invalid email format!';
                        }
                        return null;
                      },
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    alignment: Alignment.center,
                  ),
                  Container(
                    child: TextFormField(
                      controller: passwordController,
                      style: GoogleFonts.robotoCondensed(
                          fontSize: 16.0, fontWeight: FontWeight.normal),
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        hintText: 'Enter your password here...',
                      ),
                      obscureText: true,
                      validator: (password) {
                        if (password!.isEmpty) {
                          return 'Please enter a password!';
                        } else if (password.length > 7) {
                          return 'Please enter more than 7 characters!';
                        }
                        return null;
                      },
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    alignment: Alignment.center,
                  ),
                  Container(
                    child: TextFormField(
                      controller: confirmpwController,
                      style: GoogleFonts.robotoCondensed(
                          fontSize: 16.0, fontWeight: FontWeight.normal),
                      decoration: const InputDecoration(
                        labelText: 'Confirm Password',
                        hintText: 'Re-enter your password here...',
                      ),
                      obscureText: true,
                      validator: (confirm) {
                        if (confirm != passwordController.text) {
                          return 'Your password doesn\'t match!';
                        }
                        return null;
                      },
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    alignment: Alignment.center,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        if (formKey.currentState!.validate()) {
                          _onCreate(context);
                        }
                      },
                      child: Text(
                        "Create Account",
                        style: GoogleFonts.robotoCondensed(
                            fontSize: 16, fontWeight: FontWeight.normal),
                      ))
                ]),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                "Have an account? Have a KitKat!",
                style: GoogleFonts.robotoCondensed(
                    fontSize: 12.0, fontWeight: FontWeight.normal),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  "Login",
                  style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Roboto"),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
