import 'package:ap_ps_side/models/alert_model.dart';
import 'package:ap_ps_side/page/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'admin/admin_homepage.dart';

class AlertGeneration1 extends StatefulWidget {
  AlertGeneration1({Key key}) : super(key: key);

  @override
  _AlertGenerationState1 createState() => _AlertGenerationState1();
}

class _AlertGenerationState1 extends State<AlertGeneration1> {
  final alertTitleController = TextEditingController();

  final alertBodyController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

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
        color: Colors.grey,
        child: Stack(fit: StackFit.expand, children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image.network(
              "https://i.pinimg.com/736x/0e/a8/00/0ea800de8e9033282bdf73c4a086fe0a.jpg",
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Card(
                    elevation: 20,
                    color: Colors.white.withOpacity(0.8),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              //TODO ADD FIELD FOR  FROM DATE TO DATE
                              TextFormField(
                                autocorrect: true,
                                keyboardType: TextInputType.text,
                                controller: alertTitleController,
                                maxLength: 20,
                                validator: (String value) {
                                  if (value.isEmpty) {
                                    return " Title Required";
                                  } else {
                                    return null;
                                  }
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: "Enter Title of Alert",
                                  labelText: "Title",
                                ),
                              ),
                              TextFormField(
                                autocorrect: true,
                                keyboardType: TextInputType.text,
                                controller: alertBodyController,
                                minLines: 5,
                                maxLines: 10,
                                maxLength: 280,
                                validator: (String value) {
                                  if (value.isEmpty) {
                                    return " Alert Body Required";
                                  } else {
                                    return null;
                                  }
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: "Enter Body of Alert",
                                  labelText: "Body",
                                ),
                              ),
                              ButtonTheme(
                                splashColor: Colors.blue,
                                minWidth:
                                    MediaQuery.of(context).size.width * 0.8,
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0)),
                                child: RaisedButton(
                                  onPressed: () async {
                                    final DateTime now = DateTime.now();
                                    final DateFormat formatter =
                                        DateFormat('yyyy-MM-dd');
                                    final String formattedDate =
                                        formatter.format(now);
                                    String time = DateFormat.jm().format(now);
                                    print(formattedDate);
                                    print(time);

                                    if (_formKey.currentState.validate()) {
                                      AlertModel alert = AlertModel(
                                          title:
                                              alertTitleController.text.trim(),
                                          body: alertBodyController.text.trim(),
                                          date: formattedDate,
                                          time: time);
                                      await Firestore.instance
                                          .collection("Alerts")
                                          .doc("PoliceAlerts" + alert.time)
                                          .set(alert.toMap());
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  AdminDashboard()));
                                    }
                                  },
                                  child: Column(
                                    children: [
                                      Text(
                                        "Post",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 42),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )),
                    )),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
