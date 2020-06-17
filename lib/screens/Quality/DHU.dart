import 'package:arvind/screens/Quality/DhuReport.dart';
import 'package:flutter/material.dart';
import 'package:arvind/compnents/textfieldBox.dart';

class DHU extends StatefulWidget {
  @override
  _DHUState createState() => _DHUState();
}

class _DHUState extends State<DHU> {
  String garmentType;
  TextEditingController styleNo = TextEditingController();
  TextEditingController lineNo = TextEditingController();

  DropdownButton _hintDown() => DropdownButton<String>(
        value: garmentType,
        iconEnabledColor: Colors.black,
        icon: Icon(Icons.arrow_downward),
        items: [
          DropdownMenuItem<String>(
            value: "T-Shirt",
            child: Text(
              "T-Shirt",
            ),
          ),
          DropdownMenuItem<String>(
            value: "3/4TH",
            child: Text(
              "3/4TH",
            ),
          ),
          DropdownMenuItem<String>(
            value: "Joggers",
            child: Text(
              "Joggers",
            ),
          ),
          DropdownMenuItem<String>(
            value: "Slip-Top",
            child: Text(
              "Slip-Top",
            ),
          ),
        ],
        onChanged: (value) {
          print("value: $value");
          setState(() {
            value = value;
          });
          garmentType = value;
        },
        hint: Text(
          "Garment type!",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('DHU%'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Garment Type:\t',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                _hintDown(),
              ],
            ),
            SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: TextFieldDec.inputDec("Line No"),
                controller: lineNo,
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: TextFieldDec.inputDec("Style No"),
                controller: styleNo,
              ),
               SizedBox(
                height: 30,
              ),
              MaterialButton(
              minWidth: 150,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                color: Colors.black,
              padding: EdgeInsets.all(15),
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> DhuSubmit())),
              child: Text(
                'Submit',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
