import 'package:flutter/material.dart';
import 'package:arvind/compnents/textfieldBox.dart';

class Alteration extends StatefulWidget {
  @override
  _AlterationState createState() => _AlterationState();
}

class _AlterationState extends State<Alteration> {
  TextEditingController quickFix = TextEditingController();
  TextEditingController hardFix = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('DHU%'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                decoration: TextFieldDec.inputDec("Quick Fix"),
                controller: quickFix,
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                decoration: TextFieldDec.inputDec("Hard Fix"),
                controller: hardFix,
              ),
              SizedBox(
                height: 30,
              ),
              MaterialButton(
                minWidth: 150,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                color: Colors.black,
                padding: EdgeInsets.all(15),
                onPressed: () => print("sbumit"),
                child: Text(
                  'Submit',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
