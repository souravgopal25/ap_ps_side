import 'package:ap_ps_side/models/fir_info.dart';
import 'package:ap_ps_side/page/dashboard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CaseDetails extends StatefulWidget {
  final FirDetails details;
  CaseDetails({Key key, this.details}) : super(key: key);

  _CaseDetailsPage createState() => _CaseDetailsPage(details);
}

class _CaseDetailsPage extends State<CaseDetails> {
  final FirDetails object;
  _CaseDetailsPage(this.object);

  final caseType = TextEditingController();
  final titleCase = TextEditingController();
  final description = TextEditingController();
  final suspect = TextEditingController();
  final evidence = TextEditingController();

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
              SizedBox(
                width: 20,
              ),
              Column(
                children: [
                  Text(
                    "GOVERMENT OF ASSAM",
                    style: TextStyle(color: Colors.black, fontSize: 25),
                  ),
                  Text(
                    "ASSAM POLICE",
                    style: TextStyle(
                        color: Colors.blue[400],
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
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
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                  child: TextField(
                    controller: caseType,
                    decoration: InputDecoration(
                      labelText: 'Case Type',
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.blue,
                      )),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                  child: TextField(
                    controller: titleCase,
                    decoration: InputDecoration(
                      labelText: 'Case Title',
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.blue,
                      )),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                  child: TextField(
                    controller: description,
                    minLines: 2,
                    maxLines: 10,
                    decoration: InputDecoration(
                      labelText: 'Case Description',
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.blue,
                      )),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                  child: TextField(
                    controller: suspect,
                    decoration: InputDecoration(
                      labelText: 'Suspects(if any)',
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.blue,
                      )),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                  child: TextField(
                    controller: evidence,
                    decoration: InputDecoration(
                      labelText: 'Evidence(if any photo/video/docx.etc)',
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.blue,
                      )),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ButtonTheme(
                    buttonColor: Colors.lightBlueAccent,
                    splashColor: Colors.red,
                    minWidth: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.07,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                      onPressed: () async {
                        object.caseType = caseType.text.trim();
                        object.caseTitle = titleCase.text.trim();
                        object.description = description.text.trim();
                        object.suspect = suspect.text.trim();
                        print(object.toMap());

                        var x = await Firestore.instance
                            .collection("FIR1")
                            .doc(object.city + object.caseTitle)
                            .set(object.toMap());

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Dashboard()));
                      },
                      child: Column(
                        children: [
                          Text(
                            "Submit",
                            style: TextStyle(color: Colors.white, fontSize: 42),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
