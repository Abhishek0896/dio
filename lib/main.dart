import 'package:flutter/cupertino.dart';
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

  int temp = 0, hum = 0;
  var response;
  var r1, r2, r3;

  // var temp ='off';
  bool _b1 = false,
      _b2 = false,
      _b3 = false;
  bool _visible = false;

  void _bulb1() async {
    if (r1 == 'off')
      r1 = await Dio().get('192.168.0.164/1/on');
    else
      r1 =await Dio().get('192.168.0.164/1/off');
    setState(() async {
      if (r1 == 'on')
        _b1 = true;
    });
  }

  void _bulb2() async {
    if (r2 == 'off')
      r2 =await Dio().get('192.168.0.164/2/on');
    else
      r2 =await Dio().get('192.168.0.164/2/off');
    setState(() async {
      if (r2 == 'on')
        _b2 = true;
    });
  }

  void _bulb3() async {
    if (r3 == 'off')
      r3 = await Dio().get('192.168.0.164/3/on');
    else
      r3 = await Dio().get('192.168.0.164/3/off');
    setState(() async {
      if (r3 == 'on')
        _b3 = true;
    });
  }

  void _gethumidity() {
    setState(() async {
      response =await Dio().get('192.168.0.164/humidity');
      hum =response.value;
      if(hum >0)
        _visible=true;
    });
  }

  void _getTemp() {
    setState(() async {
      response = await Dio().get('192.168.0.164/temperature');
      temp = response.value;
      if(temp >0)
        _visible=true;
    });
  }


// void offbulb() {
//   Dio().get('http://c81d72d4ae3d.ngrok.io/api/v1/11');
//   setState(() {
//      temp='off';
//   });
//   print('http://c81d72d4ae3d.ngrok.io/api/v1/11');
// }
//   void onbulb(){
//     Dio().get('http://c81d72d4ae3d.ngrok.io/api/v1/1');
//     setState(() {
//        temp='on';
//     });
//     print('http://c81d72d4ae3d.ngrok.io/api/v1/1');
//   }

// void datachange(){
//   setState(() {
//     data+=1;
//   });
// }
  @override
  Widget build(BuildContext context) {
    // getData();
    return Scaffold(
    appBar: AppBar(
      title: Text(
          "Smart Home"
      ) ,
    ),
      body:Container(
    decoration: BoxDecoration(
    image: DecorationImage(
    image: AssetImage("assests/smart_home.jpg"),
    fit: BoxFit.cover,
    ),
    ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:<Widget> [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[


              Padding(
                padding: const EdgeInsets.all(10.0),
                child: RaisedButton(
                  onPressed: _bulb1,
                  color: _b1?Colors.green:Colors.red,
                  child:Text("Bulb 1",
                    style: TextStyle(
                      fontSize: 24.0,
                      color: Colors.white,
                    ),
                ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: RaisedButton(
                  onPressed: _bulb2,
                  color: _b2 ? Colors.green:Colors.red,
                  child:Text("Bulb 2",
                    style: TextStyle(
                      fontSize: 24.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: RaisedButton(
                  onPressed: _bulb2,
                  color: _b3?Colors.green:Colors.red,
                  child:Text("Bulb 3",
                    style: TextStyle(
                      fontSize: 24.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: RaisedButton(
                      onPressed: _gethumidity,
                      color: Colors.blue,
                      child:Text("Temprature",
                        style: TextStyle(
                          fontSize: 24.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: RaisedButton(
                      onPressed: _getTemp,
                      color: Colors.blue,
                      child:Text("Humidity",
                        style: TextStyle(
                          fontSize: 24.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Visibility(
                    child: Text("Temprature is $temp",
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    visible: _visible,
                  ),
                  Visibility(
                    child: Text("Humidity is $hum",
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    visible: _visible,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
