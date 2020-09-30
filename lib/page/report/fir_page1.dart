import 'package:ap_ps_side/models/fir_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'fir_page2.dart';

class UserRegistration extends StatefulWidget {
  UserRegistration({Key key, this.title}) : super(key: key);

  final String title;

  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<UserRegistration> {
  final state = TextEditingController();
  final city = TextEditingController();
  final disrtict = TextEditingController();
  final policeStation = TextEditingController();
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
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              //children: Image.asset('assets/images/logo.png',
              //height: 100.0,
              //width: 100.0,),

              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 20.0,
                ),

                // CircleAvatar(
                //  backgroundColor: Colors.blue,
                //  radius: 50.0),

                Padding(
                  padding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 1.0),
                  child: Divider(),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                  child: TextField(
                    controller: state,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.location_city),
                      labelText: 'State',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),

                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                  child: TextField(
                    controller: city,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.location_city),
                      labelText: 'City',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),

                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                  child: TextField(
                    controller: disrtict,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.location_city),
                      labelText: 'District',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),

                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                  child: TextField(
                    controller: policeStation,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.business),
                      labelText: 'Police Station',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      ),
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
                      onPressed: () {
                        //Creating object to pass to nextpage

                        var detail = FirDetails(
                            state: state.text.trim(),
                            city: city.text.trim(),
                            district: disrtict.text.trim(),
                            policeStation: policeStation.text.trim());
                        print(detail.toString());

                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => CaseDetails(
                                      details: detail,
                                    )));
                      },
                      child: Column(
                        children: [
                          Text(
                            "Next",
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
