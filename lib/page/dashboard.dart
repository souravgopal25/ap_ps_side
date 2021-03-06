import 'package:ap_ps_side/card/drawer_card.dart';
import 'package:ap_ps_side/page/alerts.dart';
import 'package:ap_ps_side/page/qrcode_scanner.dart';
import 'package:ap_ps_side/page/report/fir_page1.dart';
import 'package:ap_ps_side/slider/slider.dart';
import 'package:flutter/material.dart';

import 'news_page.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          child: Row(
            children: <Widget>[
              Image.asset(
                "assets/ashoka.jpeg",
                height: 100,
                fit: BoxFit.contain,
              ),
              Column(
                children: [
                  Text(
                    "GOVERMENT OF ASSAM",
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                  Text(
                    "ASSAM POLICE",
                    style: TextStyle(
                        color: Colors.blue[400],
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ],
              )
            ],
          ),
        ),
        toolbarHeight: 120,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        color: Colors.red[400],
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DashBoardSlider(),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.55,
                    child: Card(
                      elevation: 100,
                      shadowColor: Colors.black,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              ButtonTheme(
                                buttonColor: Colors.lightBlueAccent,
                                splashColor: Colors.red,
                                minWidth: 350,
                                height:
                                    MediaQuery.of(context).size.height * 0.15,
                                child: RaisedButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(15.0)),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                AlertGeneration()));
                                  },
                                  child: Column(
                                    children: [
                                      Icon(
                                        Icons.new_releases,
                                        size: 40,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        "Generate Alert",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 42),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              ButtonTheme(
                                buttonColor: Colors.lightBlueAccent,
                                splashColor: Colors.red,
                                minWidth: 350,
                                height:
                                    MediaQuery.of(context).size.height * 0.15,
                                child: RaisedButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(15.0)),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        new MaterialPageRoute(
                                            builder: (context) =>
                                                UserRegistration()));
                                  },
                                  child: Column(
                                    children: [
                                      Icon(
                                        Icons.account_balance,
                                        size: 40,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        "Register FIR ",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 42),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              ButtonTheme(
                                buttonColor: Colors.lightBlueAccent,
                                splashColor: Colors.red,
                                minWidth: 165,
                                height:
                                    MediaQuery.of(context).size.height * 0.15,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0)),
                                child: RaisedButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        new MaterialPageRoute(
                                            builder: (context) => QRCode()));
                                  },
                                  child: Column(
                                    children: [
                                      Icon(
                                        Icons.camera,
                                        size: 40,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        "Scan ",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 35),
                                      ),
                                      Text(
                                        "Approve ",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 35),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              ButtonTheme(
                                buttonColor: Colors.lightBlueAccent,
                                splashColor: Colors.red,
                                minWidth: 165,
                                height:
                                    MediaQuery.of(context).size.height * 0.15,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0)),
                                child: RaisedButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        new MaterialPageRoute(
                                            builder: (context) => NewsPage()));
                                  },
                                  child: Column(
                                    children: [
                                      Icon(
                                        Icons.sms,
                                        color: Colors.white,
                                        size: 40,
                                      ),
                                      Text(
                                        "News",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 42),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      drawer: Menu(),
    );
  }
}
