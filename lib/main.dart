import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      title: "API Demo",
      home: homepage(),
    );
  }
}

class homepage extends StatefulWidget {
  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {

  int data=0;
  var temp ='off';
  void offbulb() {
    Dio().get('http://c81d72d4ae3d.ngrok.io/api/v1/11');
    setState(() {
       temp='off';
    });
    print('http://c81d72d4ae3d.ngrok.io/api/v1/11');
  }
    void onbulb(){
      Dio().get('http://c81d72d4ae3d.ngrok.io/api/v1/1');
      setState(() {
         temp='on';
      });
      print('http://c81d72d4ae3d.ngrok.io/api/v1/1');
    }

  void datachange(){
    setState(() {
      data+=1;
    });
  }
  @override
  Widget build(BuildContext context) {
    // getData();
    return Scaffold(
    appBar: AppBar(
      title: Text(
          "Smart Home"
      ) ,
    ),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:<Widget> [
            Text("$temp",
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            RaisedButton(
              onPressed: offbulb,
              color: Colors.blue,
              child:Text("OFF",
                style: TextStyle(
                  fontSize: 24.0,
                  color: Colors.white,
                ),
            ),
            ),
            RaisedButton(
              onPressed: onbulb,
              color: Colors.blue,
              child:Text("ON",
                style: TextStyle(
                  fontSize: 24.0,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
