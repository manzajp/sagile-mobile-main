import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key}) : super(key: key);
  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
              Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: TextField(
                        style: GoogleFonts.robotoCondensed(
                            fontSize: 16.0, fontWeight: FontWeight.normal),
                        decoration: const InputDecoration(
                          labelText: 'Username',
                          hintText: 'Enter your username here...',
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      alignment: Alignment.center,
                    ),
                    Container(
                      child: TextField(
                        style: GoogleFonts.robotoCondensed(
                            fontSize: 16.0, fontWeight: FontWeight.normal),
                        decoration: const InputDecoration(
                          labelText: 'Password',
                          hintText: 'Enter your password here...',
                        ),
                        obscureText: true,
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      alignment: Alignment.center,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 25),
                      child: TextButton(
                          key: null,
                          onPressed: buttonPressed,
                          child: Text(
                            "Login",
                            style: GoogleFonts.robotoCondensed(
                                fontSize: 14.0, fontWeight: FontWeight.normal),
                          )),
                    ),
                  ]),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Don’t have an account yet? ",
                      style: GoogleFonts.robotoCondensed(
                          fontSize: 12.0, fontWeight: FontWeight.normal),
                    ),
                    TextButton(
                        key: null,
                        onPressed: buttonPressed,
                        child: const Text(
                          "Register",
                          style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Roboto"),
                        ))
                  ])
            ]),
      ),
    );
  }

  void buttonPressed() {}
}
