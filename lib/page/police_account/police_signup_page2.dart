import 'dart:io';

import 'package:ap_ps_side/models/police_acc.dart';
import 'package:ap_ps_side/page/admin/admin_homepage.dart';
import 'package:ap_ps_side/page/dashboard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class PoliceAccountPage2 extends StatefulWidget {
  PoliceAccountPage2({Key key, this.policeAccModel}) : super(key: key);

  final PoliceAccModel policeAccModel;

  _PoliceAccountPage2 createState() => _PoliceAccountPage2(policeAccModel);
}

class _PoliceAccountPage2 extends State<PoliceAccountPage2> {
  _PoliceAccountPage2(this.policeAccModel);
  PoliceAccModel policeAccModel;
  String designation;
  String state;
  String district;
  String police_station;
  String id;

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
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 1.0),
                child: Divider(),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.assignment_ind),
                    labelText: 'Designation',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    setState(() {
                      designation = value;
                    });
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.location_city),
                    labelText: 'State',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    setState(() {
                      state = value;
                    });
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.room),
                    labelText: 'District',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    setState(() {
                      district = value;
                    });
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.location_city),
                    labelText: 'Police Station',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    setState(() {
                      police_station = value;
                    });
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
                child: MaterialButton(
                  child: Text(
                    'Submit',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  color: Colors.blue,
                  onPressed: () async {
                    // policeAccModel.desig = designation;
                    /*policeAccModel.state = state;
                    policeAccModel.district = district;*/
                    print(designation);
                    print(state);
                    print(district);
                    await Firestore.instance
                        .collection("Profile_Police")
                        .doc(policeAccModel.name)
                        .set(policeAccModel.toMap());

                    await FirebaseAuth.instance.createUserWithEmailAndPassword(
                        email: policeAccModel.email,
                        password: policeAccModel.pass);

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AdminDashboard()));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
