import 'package:flutter/material.dart';

class CaseDetail extends StatelessWidget {
  const CaseDetail({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Card(
            elevation: 15,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Name",
                  style: TextStyle(fontSize: 20),
                ),
                Text("Sourav Sharma",
                    style: TextStyle(
                      fontSize: 20,
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    ButtonTheme(
                      buttonColor: Colors.lightBlueAccent,
                      splashColor: Colors.red,
                      minWidth: 100,
                      height: MediaQuery.of(context).size.height * 0.05,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                        onPressed: () {},
                        child: Row(
                          children: [
                            Icon(Icons.arrow_upward),
                            Text(
                              "Accept",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 42),
                            ),
                          ],
                        ),
                      ),
                    ),
                    ButtonTheme(
                      buttonColor: Colors.lightBlueAccent,
                      splashColor: Colors.red,
                      minWidth: 100,
                      height: MediaQuery.of(context).size.height * 0.05,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                        onPressed: () {},
                        child: Row(
                          children: [
                            Icon(Icons.arrow_downward),
                            Text(
                              "Reject",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 42),
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
      ),
    );
  }
}
