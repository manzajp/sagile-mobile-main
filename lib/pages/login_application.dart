import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  bool passwordVisibility = false;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.always,
      child: Scaffold(
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
                    height: 350,
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
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 160),
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColorDark,
                        ),
                        child: const Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 75, 0, 0),
                          child: Text(
                            'SAgile',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Lexend Deca',
                              fontSize: 50,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24, 0, 24, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextFormField(
                                controller: emailTextController,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Username',
                                  // labelStyle: FlutterFlowTheme.bodyText1,
                                  hintText: 'Enter your username here...',
                                  hintStyle: const TextStyle(
                                    fontFamily: 'Lexend Deca',
                                    color: Color(0x9AFFFFFF),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  filled: true,
                                  fillColor:
                                      Theme.of(context).secondaryHeaderColor,
                                  prefixIcon: Icon(
                                    Icons.email_outlined,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                                // style: FlutterFlowTheme.bodyText1,
                                keyboardType: TextInputType.name,
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return 'Please fill in a valid username.';
                                  }

                                  return null;
                                },
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 20, 0, 0),
                                child: TextFormField(
                                  controller: passwordTextController,
                                  obscureText: !passwordVisibility,
                                  decoration: InputDecoration(
                                    labelText: 'Password',
                                    // labelStyle: FlutterFlowTheme.bodyText1,
                                    hintText: 'Enter your password here...',
                                    // hintStyle:
                                    //     FlutterFlowTheme.bodyText1.override(
                                    //   fontFamily: 'Lexend Deca',
                                    //   color: const Color(0x9AFFFFFF),
                                    // ),
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
                                    prefixIcon: Icon(
                                      Icons.lock_outline,
                                      color: Theme.of(context).primaryColor,
                                    ),
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
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return 'Please fill in the password.';
                                    }

                                    return null;
                                  },
                                ),
                              ),
                              const Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                                child: TextButton(
                                    onPressed: null, child: Text("login")),
                                // child: FFButtonWidget(
                                //   onPressed: () async {
                                //     if (!formKey.currentState.validate()) {
                                //       return;
                                //     }
                                //     final user = await signInWithEmail(
                                //       context,
                                //       emailTextController.text,
                                //       passwordTextController.text,
                                //     );
                                //     if (user == null) {
                                //       return;
                                //     }

                                //     await Navigator.pushAndRemoveUntil(
                                //       context,
                                //       MaterialPageRoute(
                                //         builder: (context) =>
                                //             NavBarPage(initialPage: 'myTasks'),
                                //       ),
                                //       (r) => false,
                                //     );
                                //   },
                                //   text: 'Login',
                                //   options: FFButtonOptions(
                                //     width: 200,
                                //     height: 50,
                                //     color: FlutterFlowTheme.darkBG,
                                //     textStyle:
                                //         FlutterFlowTheme.subtitle2.override(
                                //       fontFamily: 'Lexend Deca',
                                //       color: Colors.white,
                                //       fontWeight: FontWeight.bold,
                                //     ),
                                //     elevation: 3,
                                //     borderSide: const BorderSide(
                                //       color: Colors.transparent,
                                //       width: 1,
                                //     ),
                                //     borderRadius: 8,
                                //   ),
                                // ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 8, 0, 30),
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
                                          // style: FlutterFlowTheme.bodyText1
                                          //     .override(
                                          //   fontFamily: 'Lexend Deca',
                                          //   color: FlutterFlowTheme.darkBG,
                                          // ),
                                        ),
                                      ),
                                      // FFButtonWidget(
                                      //   onPressed: () async {
                                      //     await Navigator.push(
                                      //       context,
                                      //       PageTransition(
                                      //         type: PageTransitionType.fade,
                                      //         duration: const Duration(
                                      //             milliseconds: 200),
                                      //         reverseDuration: const Duration(
                                      //             milliseconds: 200),
                                      //         child: RegisterWidget(),
                                      //       ),
                                      //     );
                                      //   },
                                      //   text: 'Register',
                                      //   options: FFButtonOptions(
                                      //     width: 100,
                                      //     height: 32,
                                      //     color: FlutterFlowTheme.primaryColor,
                                      //     textStyle: FlutterFlowTheme.subtitle2
                                      //         .override(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
