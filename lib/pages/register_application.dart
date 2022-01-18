import 'package:flutter/material.dart';

void main() {
  runApp(new MyApp());
}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Generated App',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: const Color(0xFF2196f3),
        accentColor: const Color(0xFF2196f3),
        canvasColor: const Color(0xFFfafafa),
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
    @override
    Widget build(BuildContext context) {
      return new Scaffold(
        body:
          new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  new Container(
                    child:
                      new Text(
                      "SAgile",
                        style: new TextStyle(fontSize:42.0,
                        color: const Color(0xFFffffff),
                        fontWeight: FontWeight.w200,
                        fontFamily: "Roboto"),
                      ),
    
                    color: const Color(0xFF404040),
                    padding: const EdgeInsets.fromLTRB(50.0, 10.0, 50.0, 10.0),
                    alignment: Alignment.center,
                    width: 1.7976931348623157e+308,
                    height: 70.0,
                  )
                ]
    
              ),
    
              new Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  new Container(
                    child:
                      new Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          new Text(
                          "Username",
                            style: new TextStyle(fontSize:12.0,
                            color: const Color(0xFF000000),
                            fontWeight: FontWeight.w200,
                            fontFamily: "Roboto"),
                          ),
    
                          new TextField(
                            style: new TextStyle(fontSize:12.0,
                            color: const Color(0xFF000000),
                            fontWeight: FontWeight.w200,
                            fontFamily: "Roboto"),
                          ),
    
                          new Text(
                          "Email Address",
                            style: new TextStyle(fontSize:12.0,
                            color: const Color(0xFF000000),
                            fontWeight: FontWeight.w200,
                            fontFamily: "Roboto"),
                          ),
    
                          new TextField(
                            style: new TextStyle(fontSize:12.0,
                            color: const Color(0xFF000000),
                            fontWeight: FontWeight.w200,
                            fontFamily: "Roboto"),
                          ),
    
                          new Text(
                          "Password",
                            style: new TextStyle(fontSize:12.0,
                            color: const Color(0xFF000000),
                            fontWeight: FontWeight.w200,
                            fontFamily: "Roboto"),
                          ),
    
                          new TextField(
                            style: new TextStyle(fontSize:12.0,
                            color: const Color(0xFF000000),
                            fontWeight: FontWeight.w200,
                            fontFamily: "Roboto"),
                          ),
    
                          new Text(
                          "Confirm Password",
                            style: new TextStyle(fontSize:12.0,
                            color: const Color(0xFF000000),
                            fontWeight: FontWeight.w200,
                            fontFamily: "Roboto"),
                          ),
    
                          new TextField(
                            style: new TextStyle(fontSize:12.0,
                            color: const Color(0xFF000000),
                            fontWeight: FontWeight.w200,
                            fontFamily: "Roboto"),
                          ),
    
                          new Container(
                            child:
                              new Container(
                                child:
                                  new FlatButton(key:null, onPressed:buttonPressed,
                                    child:
                                      new Text(
                                      "Create Account",
                                        style: new TextStyle(fontSize:12.0,
                                        color: const Color(0xFFffffff),
                                        fontWeight: FontWeight.w200,
                                        fontFamily: "Roboto"),
                                      )
                                    ),
    
                                color: const Color(0xFF3d99ff),
                                padding: const EdgeInsets.fromLTRB(1.0, 1.0, 1.0, 5.0),
                                alignment: Alignment.center,
                                width: 100.0,
                                height: 40.0,
                              ),
    
                            alignment: Alignment.center,
                            width: 1.7976931348623157e+308,
                            height: 70.0,
                          )
                        ]
    
                      ),
    
                    padding: const EdgeInsets.fromLTRB(50.0, 50.0, 50.0, 10.0),
                    alignment: Alignment.center,
                    width: 1.7976931348623157e+308,
                    height: 350.0,
                  )
                ]
    
              ),
    
              new Container(
                child:
                  new Text(
                  "Don't have an account yet? Login",
                    style: new TextStyle(fontSize:12.0,
                    color: const Color(0xFF000000),
                    fontWeight: FontWeight.w200,
                    fontFamily: "Roboto"),
                  ),
    
                padding: const EdgeInsets.all(0.0),
                alignment: Alignment.center,
                width: 1.7976931348623157e+308,
                height: 142.0,
              )
            ]
    
          ),
    
      );
    }
    void buttonPressed(){}
    
}