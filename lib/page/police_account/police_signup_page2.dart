import 'dart:io';

import 'package:ap_ps_side/models/police_acc.dart';
import 'package:ap_ps_side/page/dashboard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class Police_Account_Page2 extends StatefulWidget {
  Police_Account_Page2({Key key, this.policeAccModel}) : super(key: key);

  final PoliceAccModel policeAccModel;

  _Police_Account_Page2 createState() => _Police_Account_Page2(policeAccModel);
}

class _Police_Account_Page2 extends State<Police_Account_Page2> {
  _Police_Account_Page2(this.policeAccModel);
  PoliceAccModel policeAccModel;
  String designation;
  String state;
  String district;
  String police_station;
  String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 20.0,
              ),
              CircleAvatar(
                backgroundColor: Colors.blue,
                radius: 20.0,
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

                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Dashboard()));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 5.0,
        child: new Icon(Icons.chevron_right),
        backgroundColor: Colors.blue,
        onPressed: () {},
      ),
    );
  }
}
