import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

class RegisterWidget extends StatefulWidget {
  const RegisterWidget({Key? key}) : super(key: key);

  @override
  _RegisterWidgetState createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
  TextEditingController confirmPasswordController = TextEditingController();
  bool confirmPasswordVisibility = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool passwordVisibility = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    // image: DecorationImage(
                    //   fit: BoxFit.fitWidth,
                    //   image: Image.asset(
                    //     'assets/images/topSection@2x.png',
                    //   ).image,
                    // ),
                  ),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 40),
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColorDark,
                        shape: BoxShape.rectangle,
                      ),
                      child: const Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(80, 35, 80, 0),
                        child: Text(
                          'SAgile',
                          textAlign: TextAlign.center,
                          // style: FlutterFlowTheme.title1.override(
                          //   fontFamily: 'Lexend Deca',
                          //   fontSize: 50,
                          //   fontWeight: FontWeight.bold,
                          // ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 100, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 36),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            TextFormField(
                              controller: usernameController,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Username',
                                // labelStyle: FlutterFlowTheme.bodyText1,
                                hintText: 'Enter your username',
                                // hintStyle: FlutterFlowTheme.bodyText1,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        Theme.of(context).secondaryHeaderColor,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        Theme.of(context).secondaryHeaderColor,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                filled: true,
                                fillColor:
                                    Theme.of(context).secondaryHeaderColor,
                              ),
                              // style: FlutterFlowTheme.bodyText1,
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 20, 0, 0),
                              child: TextFormField(
                                controller: emailController,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Email Address',
                                  // labelStyle: FlutterFlowTheme.bodyText1,
                                  hintText: 'Enter your email address',
                                  // hintStyle: FlutterFlowTheme.bodyText1,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Theme.of(context)
                                          .secondaryHeaderColor,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Theme.of(context)
                                          .secondaryHeaderColor,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  filled: true,
                                  fillColor:
                                      Theme.of(context).secondaryHeaderColor,
                                ),
                                // style: FlutterFlowTheme.bodyText1,
                                keyboardType: TextInputType.emailAddress,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 20, 0, 0),
                              child: TextFormField(
                                controller: passwordController,
                                obscureText: !passwordVisibility,
                                decoration: InputDecoration(
                                  labelText: 'Password',
                                  // labelStyle: FlutterFlowTheme.bodyText1,
                                  hintText: 'Enter your password',
                                  // hintStyle: FlutterFlowTheme.bodyText1,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Theme.of(context)
                                          .secondaryHeaderColor,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Theme.of(context)
                                          .secondaryHeaderColor,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  filled: true,
                                  fillColor:
                                      Theme.of(context).secondaryHeaderColor,
                                  suffixIcon: InkWell(
                                    onTap: () => setState(
                                      () => passwordVisibility =
                                          !passwordVisibility,
                                    ),
                                    child: Icon(
                                      passwordVisibility
                                          ? Icons.visibility_outlined
                                          : Icons.visibility_off_outlined,
                                      color: const Color(0x80FFFFFF),
                                      size: 22,
                                    ),
                                  ),
                                ),
                                // style: FlutterFlowTheme.bodyText1,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 20, 0, 0),
                              child: TextFormField(
                                controller: confirmPasswordController,
                                obscureText: !confirmPasswordVisibility,
                                decoration: InputDecoration(
                                  labelText: 'Confirm Password',
                                  // labelStyle: FlutterFlowTheme.bodyText1,
                                  hintText: 'Retype your password',
                                  // hintStyle: FlutterFlowTheme.bodyText1,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Theme.of(context)
                                          .secondaryHeaderColor,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Theme.of(context)
                                          .secondaryHeaderColor,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  filled: true,
                                  fillColor:
                                      Theme.of(context).secondaryHeaderColor,
                                  suffixIcon: InkWell(
                                    onTap: () => setState(
                                      () => confirmPasswordVisibility =
                                          !confirmPasswordVisibility,
                                    ),
                                    child: Icon(
                                      confirmPasswordVisibility
                                          ? Icons.visibility_outlined
                                          : Icons.visibility_off_outlined,
                                      color: const Color(0x80FFFFFF),
                                      size: 22,
                                    ),
                                  ),
                                ),
                                // style: FlutterFlowTheme.bodyText1,
                              ),
                            ),
                            const Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                              child: TextButton(
                                  onPressed: null, child: Text("register")),
                              //   child: FFButtonWidget(
                              //     onPressed: () async {
                              //       if (passwordController.text !=
                              //           confirmPasswordController.text) {
                              //         ScaffoldMessenger.of(context).showSnackBar(
                              //           const SnackBar(
                              //             content: Text(
                              //               "Passwords don't match!",
                              //             ),
                              //           ),
                              //         );
                              //         return;
                              //       }

                              //       final user = await createAccountWithEmail(
                              //         context,
                              //         emailController.text,
                              //         passwordController.text,
                              //       );
                              //       if (user == null) {
                              //         return;
                              //       }

                              //       final usersCreateData = createUsersRecordData(
                              //         displayName: usernameController.text,
                              //       );
                              //       await UsersRecord.collection
                              //           .doc(user.uid)
                              //           .update(usersCreateData);

                              //       await Navigator.pushAndRemoveUntil(
                              //         context,
                              //         MaterialPageRoute(
                              //           builder: (context) =>
                              //               NavBarPage(initialPage: 'myTasks'),
                              //         ),
                              //         (r) => false,
                              //       );
                              //     },
                              //     text: 'Create Account',
                              //     options: FFButtonOptions(
                              //       width: 200,
                              //       height: 50,
                              //       color: FlutterFlowTheme.darkBG,
                              //       textStyle:
                              //           FlutterFlowTheme.subtitle2.override(
                              //         fontFamily: 'Lexend Deca',
                              //         color: Colors.white,
                              //         fontWeight: FontWeight.bold,
                              //       ),
                              //       elevation: 3,
                              //       borderSide: const BorderSide(
                              //         color: Colors.transparent,
                              //         width: 1,
                              //       ),
                              //       borderRadius: 8,
                              //     ),
                              //   ),
                            ),
                            Expanded(
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: const [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 6),
                                    child: Text(
                                      'Don’t have an account yet? ',
                                      // style:
                                      //     FlutterFlowTheme.bodyText1.override(
                                      //   fontFamily: 'Lexend Deca',
                                      //   color: FlutterFlowTheme.darkBG,
                                      // ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 8, 0, 0),
                                    child: TextButton(
                                        onPressed: null, child: Text("login")),
                                    // child: FFButtonWidget(
                                    //   onPressed: () async {
                                    //     await Navigator.push(
                                    //       context,
                                    //       PageTransition(
                                    //         type: PageTransitionType.fade,
                                    //         duration: const Duration(
                                    //             milliseconds: 200),
                                    //         reverseDuration: const Duration(
                                    //             milliseconds: 200),
                                    //         child: LoginWidget(),
                                    //       ),
                                    //     );
                                    //   },
                                    //   text: 'Login',
                                    //   options: FFButtonOptions(
                                    //     width: 80,
                                    //     height: 30,
                                    //     color: FlutterFlowTheme.primaryColor,
                                    //     textStyle:
                                    //         FlutterFlowTheme.subtitle2.override(
                                    //       fontFamily: 'Lexend Deca',
                                    //       color: Colors.white,
                                    //     ),
                                    //     elevation: 0,
                                    //     borderSide: const BorderSide(
                                    //       color: Colors.transparent,
                                    //       width: 1,
                                    //     ),
                                    //     borderRadius: 0,
                                    //   ),
                                    // ),
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
            ),
          ],
        ),
      ),
    );
  }
}
