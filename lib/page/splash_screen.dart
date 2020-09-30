import 'package:ap_ps_side/page/selector.dart';
import 'package:flutter/material.dart';

import 'dart:async';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.push(
          context, new MaterialPageRoute(builder: (context) => Selector()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.white),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 10,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        radius: 150,
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage("assets/logo.jpg"),
                        /*child: Image.asset(
                          "assets/logo.png",
                          fit: BoxFit.cover,
                        ),*/
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[CircularProgressIndicator()],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
