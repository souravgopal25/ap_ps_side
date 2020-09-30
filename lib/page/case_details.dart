import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CaseDetails extends StatelessWidget {
  const CaseDetails({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CaseDetails"),
      ),
      body: FutureBuilder(
          future: Firestore.instance
              .collection("FIR")
              .document("Jamshedpur ")
              .get(),
          builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (snapshot.hasData) {
              print(snapshot.data.data());

              /* Map<String, Future> map = snapshot.data.data;
              print(map);*/
              return Text("Hello");
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
