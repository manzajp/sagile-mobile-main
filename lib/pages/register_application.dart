import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class User {
  final int id;
  final String username;
  final String email;
  final String password;

  User(
      {required this.id,
      required this.username,
      required this.email,
      required this.password});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      password: json['password'],
    );
  }
  Map<String, dynamic> toJson() => {
        'username': username,
        'email': email,
        'password': password,
      };
}

class Env {
  static String URL_PREFIX = "http://manza.lan/flutter_api";
}

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
    return await http.post(
      Uri.parse("${Env.URL_PREFIX}/create.php"),
      body: {
        "username": usernameController.text,
        "email": emailController.text,
        "password": passwordController.text,
      },
    );
  }

  void _onConfirm(context) async {
    await _createUser();
    print("received respond!");
    // Remove all existing routes until the Home.dart, then rebuild Home.
    // Navigator.of(context)
    //   .pushNamedAndRemoveUntil('/'
    //   , (Route<dynamic> route) => false);
  }

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
                        validator: (username){
                          if(username!.length < 8){
                            return 'Username must be more than 7 character!';
                          }
                          return null;
                        }
                      ),
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
                        validator: (email){
                          RegExp regex = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                          if(!regex.hasMatch(email!)){
                            return 'Invalid email format!';
                          }
                          else if(email!.isEmpty){
                            return 'Please enter your email address!';
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
                        validator: (password){
                          if(password!.isEmpty){
                            return 'Please enter a password!';
                          }
                          // passwordController.text = password;
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
                        validator: (confirm){
                          if(confirm != passwordController.text){
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
                          if (formKey.currentState!.validate()) {
                            _onConfirm(context);
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
