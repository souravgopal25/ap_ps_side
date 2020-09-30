import 'package:ap_ps_side/page/admin/admin_homepage.dart';
import 'package:ap_ps_side/page/login_page.dart';
import 'package:flutter/material.dart';

class Selector extends StatelessWidget {
  const Selector({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(color: Colors.black),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 5,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    ButtonTheme(
                      buttonColor: Colors.blue,
                      splashColor: Colors.black,
                      minWidth: MediaQuery.of(context).size.width * 0.75,
                      height: MediaQuery.of(context).size.height * 0.25,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) => AdminDashboard()));
                        },
                        child: Column(
                          children: [
                            Icon(
                              Icons.verified_user,
                              size: 40,
                              color: Colors.white,
                            ),
                            Text(
                              "Admin ",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 35),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ButtonTheme(
                      buttonColor: Colors.blueAccent,
                      splashColor: Colors.black,
                      minWidth: MediaQuery.of(context).size.width * 0.75,
                      height: MediaQuery.of(context).size.height * 0.25,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) => LoginPage()));
                        },
                        child: Column(
                          children: [
                            Icon(
                              Icons.account_circle,
                              size: 40,
                              color: Colors.white,
                            ),
                            Text(
                              "Police ",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 35),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ],
    ));
  }
}
