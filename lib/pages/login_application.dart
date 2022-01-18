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
        brightness:Brightness.dark,
        primarySwatch: Colors.blue,
        primaryColor: const Color(0xFF212121),
        accentColor: const Color(0xFF64ffda),
        canvasColor: const Color(0xFF303030),
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
        appBar: new AppBar(
          title: new Text('App Name'),
          ),
        body:
          new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  new Container(
                    child:
                      new Text(
                      "SAgile",
                        style: new TextStyle(fontSize:50.0,
                        color: const Color(0xFFffffff),
                        fontWeight: FontWeight.w700,
                        fontFamily: "Roboto"),
                      ),
    
                    padding: const EdgeInsets.fromLTRB(1.0, 30.0, 1.0, 1.0),
                    alignment: Alignment.center,
                  )
                ]
    
              ),
    
              new Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  new Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      new Container(
                        child:
                          new TextField(
                            style: new TextStyle(fontSize:12.0,
                            color: const Color(0xFFffffff),
                            fontWeight: FontWeight.w200,
                            fontFamily: "Roboto"),
                          ),
    
                        padding: const EdgeInsets.fromLTRB(1.0, 80.0, 1.0, 1.0),
                        alignment: Alignment.center,
                      ),
    
                      new Container(
                        child:
                          new TextField(
                            style: new TextStyle(fontSize:12.0,
                            color: const Color(0xFFffffff),
                            fontWeight: FontWeight.w200,
                            fontFamily: "Roboto"),
                          ),
    
                        padding: const EdgeInsets.fromLTRB(1.0, 20.0, 1.0, 1.0),
                        alignment: Alignment.center,
                      ),
    
                      new FlatButton(key:null, onPressed:buttonPressed,
                        child:
                          new Text(
                          "Login",
                            style: new TextStyle(fontSize:14.0,
                            color: const Color(0xFFffffff),
                            fontWeight: FontWeight.w400,
                            fontFamily: "Roboto"),
                          )
                        ),
    
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          new Text(
                          "Don’t have an account yet? ",
                            style: new TextStyle(fontSize:12.0,
                            color: const Color(0xFFffffff),
                            fontWeight: FontWeight.w200,
                            fontFamily: "Roboto"),
                          ),
    
                          new FlatButton(key:null, onPressed:buttonPressed,
                            child:
                              new Text(
                              "Register",
                                style: new TextStyle(fontSize:12.0,
                                color: const Color(0xFFffffff),
                                fontWeight: FontWeight.w400,
                                fontFamily: "Roboto"),
                              )
                            )
                        ]
    
                      )
                    ]
    
                  )
                ]
    
              )
            ]
    
          ),
    
      );
    }
    void buttonPressed(){}
    
}