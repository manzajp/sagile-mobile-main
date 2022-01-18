import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterWidget extends StatefulWidget {
  const RegisterWidget({Key? key}) : super(key: key);
  @override
  _RegisterWidgetState createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        labelText: 'Email Address',
                        hintText: 'Enter your email address here...',
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
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    alignment: Alignment.center,
                  ),
                  Container(
                    child: TextField(
                      style: GoogleFonts.robotoCondensed(
                          fontSize: 16.0, fontWeight: FontWeight.normal),
                      decoration: const InputDecoration(
                        labelText: 'Confirm Password',
                        hintText: 'Enter your password here...',
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    alignment: Alignment.center,
                  ),
                  TextButton(
                      onPressed: buttonPressed,
                      child: Text(
                        "Create Account",
                        style: GoogleFonts.robotoCondensed(
                            fontSize: 16, fontWeight: FontWeight.normal),
                      ))
                ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  "Don't have an account yet?",
                  style: GoogleFonts.robotoCondensed(
                      fontSize: 12.0,
                      color: const Color(0xFF000000),
                      fontWeight: FontWeight.normal),
                ),
                TextButton(
                    key: null,
                    onPressed: buttonPressed,
                    child: const Text(
                      "Login",
                      style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Roboto"),
                    ))
              ],
            )
          ]),
    );
  }

  void buttonPressed() {}
}
