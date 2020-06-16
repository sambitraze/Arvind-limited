import 'package:flutter/material.dart';
import 'package:arvind/compnents/textfieldBox.dart';
import 'package:flutter_rounded_date_picker/rounded_picker.dart';

class WIP extends StatefulWidget {
  @override
  _WIPState createState() => _WIPState();
}

class _WIPState extends State<WIP> {
  TextEditingController styleNo = TextEditingController();
  TextEditingController buyer = TextEditingController();
  TextEditingController product = TextEditingController();
  TextEditingController po = TextEditingController();
  DateTime fromDate = DateTime.now();
  DateTime toDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('WIP'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 5,
            ),
            TextFormField(
              decoration: TextFieldDec.inputDec("Style Number"),
              controller: styleNo,
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              decoration: TextFieldDec.inputDec("Buyer"),
              controller: buyer,
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              decoration: TextFieldDec.inputDec("Product"),
              controller: product,
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              decoration: TextFieldDec.inputDec("PO"),
              controller: po,
            ),
            SizedBox(
              height: 15,
            ),
            FlatButton.icon(
              onPressed: () async {
                fromDate = await showRoundedDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(DateTime.now().year - 1),
                  lastDate: DateTime(DateTime.now().year + 1),
                  borderRadius: 16,
                );
                setState(() {});
              },
              icon: Icon(Icons.calendar_today),
              label: Text('From Date: ' +
                  "${fromDate.year}" +
                  "-" +
                  "${fromDate.month}" +
                  "-" +
                  "${fromDate.day}"),
            ),
            SizedBox(
              height: 15,
            ),
            FlatButton.icon(
              onPressed: () async {
                toDate = await showRoundedDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(DateTime.now().year - 1),
                  lastDate: DateTime(DateTime.now().year + 1),
                  borderRadius: 16,
                );
                setState(() {});
              },
              icon: Icon(Icons.calendar_today),
              label: Text('To Date: ' +
                  "${toDate.year}" +
                  "-" +
                  "${toDate.month}" +
                  "-" +
                  "${toDate.day}"),
            ),
            SizedBox(
              height: 15,
            ),
            MaterialButton(
              minWidth: 150,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                color: Colors.black,
              padding: EdgeInsets.all(15),
              onPressed: () => print("fecthed"),
              child: Text(
                'Fetch',
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