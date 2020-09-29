import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AnnCaseDetail extends StatelessWidget {
  const AnnCaseDetail({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
  const CaseCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        elevation: 15,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              children: [
                Text(
                  "Name : ",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 40),
                ),
                Text("Sourav Sharma",
                    style: TextStyle(
                      fontSize: 40,
                    )),
              ],
            ),
            Text(
              "Case Description",
              style: TextStyle(fontSize: 40),
            ),
            Text(
              " CASE",
              style: TextStyle(fontSize: 35),
            ),
            Text(
              "Case Filled Date :",
              style: TextStyle(fontSize: 40),
            ),
            Text(
              "26/09/2020",
              style: TextStyle(fontSize: 40),
            ),
            Text(
              "Suspects",
              style: TextStyle(fontSize: 40),
            ),
            Text(
              "hdbvhjdsbv",
              style: TextStyle(fontSize: 40),
            ),
            Text(
              "Evidence",
              style: TextStyle(fontSize: 40),
            ),
            Text(
              "Evidences",
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
                    onPressed: () {},
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
                    onPressed: () {},
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
