import 'package:flutter/material.dart';
import 'package:arvind/compnents/textfieldBox.dart';

class Inspection extends StatefulWidget {
  @override
  _InspectionState createState() => _InspectionState();
}

class _InspectionState extends State<Inspection> {
  String operation;
  TextEditingController operatorName = TextEditingController();

  DropdownButton _hintDown() => DropdownButton<String>(
        value: operation,
        iconEnabledColor: Colors.black,
        icon: Icon(Icons.arrow_downward),
        items: [
          DropdownMenuItem<String>(
            value: "Operation1",
            child: Text(
              "Operation1",
            ),
          ),
          DropdownMenuItem<String>(
            value: "Operation2",
            child: Text(
              "Operation2",
            ),
          ),
          DropdownMenuItem<String>(
            value: "Operation3",
            child: Text(
              "Operation3",
            ),
          ),
          DropdownMenuItem<String>(
            value: "Operation4",
            child: Text(
              "Operation4",
            ),
          ),
        ],
        onChanged: (value) {
          print("value: $value");
          setState(() {
            value = value;
          });
          operation = value;
        },
        hint: Text(
          "Select Operation!",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      );

  List<int> _list = List.generate(10, (i) => i);
  List<String> _status = List.generate(10, (index) => "none");
  Future<void> _showDialog(int ind) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Change Status"),
          backgroundColor: Colors.grey[200],
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(10.0),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                MaterialButton(
                  minWidth: 150,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  color: Colors.greenAccent,
                  padding: EdgeInsets.all(15),
                  onPressed: () => setState(() {
                    _status[ind] = "PASS";
                    Navigator.pop(context);
                  }),
                  child: Text(
                    'PASS',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                    ),
                  ),
                ),SizedBox(
              height: 10,
            ),
                MaterialButton(
                  minWidth: 150,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  color: Colors.amber,
                  padding: EdgeInsets.all(15),
                  onPressed: () => setState(() {
                    _status[ind] = "IN-PROCESS";
                    Navigator.pop(context);
                  }),
                  child: Text(
                    'IN_PROCESS',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                    ),
                  ),
                ), SizedBox(
              height: 10,
            ),
                MaterialButton(
                  minWidth: 150,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  color: Colors.redAccent,
                  padding: EdgeInsets.all(15),
                  onPressed: () => setState(() {
                    _status[ind] = "REJECT";
                    Navigator.pop(context);
                  }),
                  child: Text(
                    'REJECT',
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
      },
    );
  }

  Color changeColour(int i) {
    if (_status[i] == "PASS")
      return Colors.greenAccent;
    else if (_status[i] == "IN-PROCESS")
      return Colors.amber;
    else if (_status[i] == "REJECT")
      return Colors.redAccent;
    else
      return Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Inspection'),
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
              decoration: TextFieldDec.inputDec("OperatorName"),
              controller: operatorName,
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _list.length,
                itemBuilder: (_, i) {
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    color: Colors.grey[200],
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: changeColour(i),
                      ),
                      trailing: Text("Status: " + _status[i]),
                      title: Text("Item ${_list[i] + 1}"),
                      onTap: () => _showDialog(i),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 20,
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
          ],
        ),
      ),
    );
  }
}
