import 'package:ap_ps_side/page/dashboard.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';

class LoginForm extends StatefulWidget {
  LoginForm({
    Key key,
    @required GlobalKey<FormState> formKey,
    @required this.emailController,
    @required this.passController,
  })  : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final TextEditingController emailController;
  final TextEditingController passController;

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final phoneController = TextEditingController();
  final otpController = TextEditingController();
  Future<bool> loginUser(String phone, BuildContext context) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    _auth.verifyPhoneNumber(
        phoneNumber: phone,
        timeout: Duration(seconds: 60),
        verificationCompleted: (AuthCredential credential) async {
          var result = await _auth.signInWithCredential(credential);
          User user = result.user;
          if (user != null) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Dashboard()));
          }
        },
        verificationFailed: (FirebaseAuthException exception) {
          print(exception);
        },
        codeSent: (String verificationID, [int forceResendingToken]) {
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) {
                return AlertDialog(
                  title: Text("Submit OTP"),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      TextField(
                        controller: otpController,
                      ),
                    ],
                  ),
                  actions: <Widget>[
                    FlatButton(
                      child: Text("Confirm"),
                      textColor: Colors.white,
                      color: Colors.blue,
                      onPressed: () async {
                        final code = otpController.text.trim();
                        AuthCredential credential =
                            PhoneAuthProvider.credential(
                                verificationId: verificationID, smsCode: code);

                        var result =
                            await _auth.signInWithCredential(credential);

                        User user = result.user;

                        if (user != null) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Dashboard()));
                        } else {
                          print("Error");
                        }
                      },
                    )
                  ],
                );
              });
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          print(verificationId);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget._formKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            TextFormField(
              keyboardType: TextInputType.phone,
              controller: phoneController,
              maxLength: 10,
              validator: (String value) {
                if (value.isEmpty) {
                  return "Phone Required";
                }
                return null;
              },
              style: TextStyle(fontSize: 20),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                fillColor: Colors.black,
                labelText: "Phone",
                labelStyle: TextStyle(color: Colors.black, fontSize: 22),
                hintStyle: TextStyle(color: Colors.black, fontSize: 18),
                hintText: "Enter Phone ",
              ),
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: widget.emailController,
              validator: (String value) {
                if (value.isEmpty) {
                  return "Email Required";
                }
                return null;
              },
              style: TextStyle(fontSize: 20),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Email",
                hintText: "Enter Email",
                labelStyle: TextStyle(color: Colors.black, fontSize: 22),
                hintStyle: TextStyle(color: Colors.black, fontSize: 18),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              maxLength: 10,
              style: TextStyle(fontSize: 20),
              controller: widget.passController,
              validator: (String value) {
                if (value.length < 6) {
                  return "Password Required with length 6+";
                }
                return null;
              },
              decoration: InputDecoration(
                  labelStyle: TextStyle(color: Colors.black, fontSize: 22),
                  hintStyle: TextStyle(color: Colors.black, fontSize: 18),
                  hintText: "Enter Password",
                  border: OutlineInputBorder(),
                  labelText: "Password"),
            ),
            ButtonTheme(
              minWidth: MediaQuery.of(context).size.shortestSide,
              height: MediaQuery.of(context).size.height * 0.05,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)),
                onPressed: () async {
                  if (!widget._formKey.currentState.validate()) {
                    return;
                  } else {
                    FirebaseAuth _auth = FirebaseAuth.instance;
                    if (!widget._formKey.currentState.validate()) {
                      return;
                    } else {
                      var result1 = await _auth.signInWithEmailAndPassword(
                          email: widget.emailController.text.trim(),
                          password: widget.passController.text.trim());
                      User user = result1.user;
                      if (user != null) {
                        loginUser("+91" + phoneController.text.trim(), context);
                      }
                    }
                  }
                },
                child: Column(
                  children: [
                    Text(
                      "Sign-in",
                      style: TextStyle(color: Colors.white, fontSize: 42),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
