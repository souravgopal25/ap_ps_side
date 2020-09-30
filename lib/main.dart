import 'package:ap_ps_side/page/alerts.dart';
import 'package:ap_ps_side/page/Annomouscase_detail.dart';
import 'package:ap_ps_side/page/case_details.dart';
import 'package:ap_ps_side/page/dashboard.dart';
import 'package:ap_ps_side/page/login_page.dart';
import 'package:ap_ps_side/page/qrcode_scanner.dart';
import 'package:ap_ps_side/page/splash_screen.dart';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
      primarySwatch: Colors.red,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
    home: MyHome(),
  ));
}

class MyHome extends StatefulWidget {
  MyHome({Key key}) : super(key: key);
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: widget._initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {}
          if (snapshot.connectionState == ConnectionState.done) {
            return Dashboard();
          }
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }
}
