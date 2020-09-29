import 'package:ap_ps_side/models/police_acc.dart';
import 'package:ap_ps_side/police_account/police_signup_page2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Police_Account_Page1 extends StatefulWidget {
  Police_Account_Page1({Key key, this.title}) : super(key: key);

  final String title;

  _Police_Account_Page1 createState() => _Police_Account_Page1();
}

class _Police_Account_Page1 extends State<Police_Account_Page1> {
  String name;
  String email;
  String phone;
  String address;
  String pass;

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
                radius: 40.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                child: Divider(),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                child: TextField(
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.account_circle),
                    labelText: 'Name',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    setState(() {
                      name = value;
                    });
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    labelText: 'Email',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    setState(() {
                      email = value.trim();
                    });
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                child: TextField(
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.security),
                    labelText: 'Password',
                    hintText: "Enter 6+ characters",
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    setState(() {
                      pass = value.trim();
                    });
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                child: TextField(
                  keyboardType: TextInputType.phone,
                  maxLength: 10,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.phone),
                    labelText: 'Phone No.',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    setState(() {
                      phone = value.trim();
                    });
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                child: TextField(
                  minLines: 2,
                  maxLines: 6,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.location_city),
                    labelText: 'Address',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    setState(() {
                      address = value;
                    });
                  },
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 5.0,
        child: new Icon(Icons.chevron_right),
        backgroundColor: Colors.blue,
        onPressed: () {
          PoliceAccModel object = PoliceAccModel(
              name: name,
              email: email,
              phone: phone,
              address: address,
              pass: pass);
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => (Police_Account_Page2(
                    policeAccModel: object,
                  ))));
        },
      ),
    );
  }
}
