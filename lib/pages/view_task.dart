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
        appBar: new AppBar(
          title: new Text('App Name'),
          bottom:
            new TabBar(tabs: <Widget>[new Text("text"), new Text("text 2")],
            ),
    
          ),
        body:
          new TabBarView(
            children: <Widget>[
              new Container(
                child:
                  new Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      new Padding(
                        child:
                          new Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              new Text(
                              "Task Name 1",
                                style: new TextStyle(fontSize:12.0,
                                color: const Color(0xFF000000),
                                fontWeight: FontWeight.w200,
                                fontFamily: "Roboto"),
                              ),
    
                              new Checkbox(key:null, onChanged: checkChanged, value:true)
                            ]
    
                          ),
    
                        padding: const EdgeInsets.fromLTRB(24.0, 14.0, 0.0, 6.0),
                      ),
    
                      new Divider(color: const Color(0x5e5e5e),
    
                      new Padding(
                        child:
                          new Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              new Text(
                              "Task Name 2",
                                style: new TextStyle(fontSize:12.0,
                                color: const Color(0xFF000000),
                                fontWeight: FontWeight.w200,
                                fontFamily: "Roboto"),
                              ),
    
                              new Checkbox(key:null, onChanged: checkChanged, value:true)
                            ]
    
                          ),
    
                        padding: const EdgeInsets.fromLTRB(24.0, 14.0, 0.0, 6.0),
                      ),
    
                      new Divider(color: const Color(0x5e5e5e)
                    ]
    
                  ),
    
                padding: const EdgeInsets.all(0.0),
                alignment: Alignment.center,
              ),
    
              new Text(
              " TabBarView placeholder 1",
                style: new TextStyle(fontSize:12.0,
                color: const Color(0xFF000000),
                fontWeight: FontWeight.w200,
                fontFamily: "Roboto"),
              )
            ]
    
          ),
    
      );
    }
    void checkChanged(bool value){}
    
    void fabPressed() {}
    
}