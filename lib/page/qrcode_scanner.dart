import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
));

class QRCode extends StatefulWidget {

  @override
  _QRCode createState() => _QRCode();
}

class _QRCode extends State<QRCode> {
  String result = "Hey there !";

  Future _scanQR() async {
    try{
      String qrResult = (await BarcodeScanner.scan()) as String;
      setState(() {
        result = qrResult;
      });
    }
    on PlatformException catch (ex) {
      if(ex.code == BarcodeScanner.cameraAccessDenied) {
        setState(() {
          result = "Camera permission was denied";
        });
      } else {
        setState(() {
          result = "Unknown Error $ex";
        });
      }

    } on FormatException {
      setState(() {
        result = "You pressed the back button before scanning";
      });
    } catch (ex) {
      setState(() {
        result = " Unknown Error $ex";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("QR Scanner"),
      ),

      body: Center(
        child: Text(
          result,
          style: new TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.camera_alt),
        label: Text("Scan"),
        onPressed: _scanQR,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );

  }
}


