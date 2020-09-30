import 'package:ap_ps_side/page/Annomouscase_detail.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CaseDetails extends StatelessWidget {
  final String keyword;
  const CaseDetails({Key key, this.keyword}) : super(key: key);

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
      body: FutureBuilder(
          future: Firestore.instance
              .collection("FIR1")
              .document(keyword.trim())
              .get(),
          builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (snapshot.hasData) {
              print(snapshot.data.data());
              print(snapshot.data.data().runtimeType);
              Map<String, dynamic> map = snapshot.data.data();
              print(map);

              /* Map<String, Future> map = snapshot.data.data;
              print(map);*/
              return SingleChildScrollView(
                child: CaseCard(
                  map: map,
                ),
              );
            } else if (snapshot.hasError) {
              return Text("ERROR");
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
