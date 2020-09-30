import 'package:ap_ps_side/page/dashboard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AnnCaseDetail extends StatelessWidget {
  const AnnCaseDetail({Key key}) : super(key: key);

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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: StreamBuilder(
          stream: Firestore.instance.collection("Reports-An").snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, index) {
                    return CaseCard();
                  });
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}

class CaseCard extends StatelessWidget {
  final Map<String, dynamic> map;
  const CaseCard({Key key, this.map}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        elevation: 15,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              "Case Type",
              style: TextStyle(fontSize: 40),
            ),
            Text(
              map["caseType"],
              style: TextStyle(fontSize: 35),
            ),
            Text(
              "Case Title",
              style: TextStyle(fontSize: 40),
            ),
            Text(
              map["caseTitle"],
              style: TextStyle(fontSize: 35),
            ),
            Text(
              "Case Description",
              style: TextStyle(fontSize: 40),
            ),
            Text(
              map["description"],
              style: TextStyle(fontSize: 35),
            ),
            Text(
              "Suspects",
              style: TextStyle(fontSize: 40),
            ),
            Text(
              map["suspect"],
              style: TextStyle(fontSize: 40),
            ),
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
                    onPressed: () async {
                      map["status"] = "1";
                      await Firestore.instance
                          .collection("FIR1")
                          .doc(map["city"] + map["caseTitle"])
                          .set(map);

                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => Dashboard()));
                    },
                    child: Row(
                      children: [
                        Icon(Icons.arrow_upward),
                        Text(
                          "Accept",
                          style: TextStyle(color: Colors.white, fontSize: 42),
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
                    onPressed: () async {
                      map["status"] = "-1";
                      await Firestore.instance
                          .collection("FIR1")
                          .doc(map["city"] + map["caseTitle"])
                          .set(map);

                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => Dashboard()));
                    },
                    child: Row(
                      children: [
                        Icon(Icons.arrow_downward),
                        Text(
                          "Reject",
                          style: TextStyle(color: Colors.white, fontSize: 42),
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
    );
  }
}
