import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:arvind/compnents/textfieldBox.dart';
import 'package:uuid/uuid.dart';

final dhucollref = Firestore.instance.collection('dhu');

class DhuSubmit extends StatefulWidget {
  DhuSubmit({this.styleNo, this.lineNo, this.garment});

  final String garment;
  final String lineNo;
  final String styleNo;

  @override
  _DhuSubmitState createState() => _DhuSubmitState();
}

var controllers = <TextEditingController>[];
var rowList = List<DataRow>();

SizedBox leaveSpace() {
  return SizedBox(
    height: 10,
  );
}

DataRow getRow(int index, {bool newController = true}) {
  var list = List<DataCell>();
  index = index * 10;
  for (int i = index; i < index + 10; ++i) {
    newController
        ? controllers.add(TextEditingController())
        : print("Not New Controller");
    list.add(
      DataCell(
        TextField(
          controller: controllers[i],
        ),
      ),
    );
  }
  return DataRow(cells: list);
}

class _DhuSubmitState extends State<DhuSubmit> {
  final _scaffoldState = GlobalKey<ScaffoldState>();
  int rows = 0;
  TextEditingController defects = TextEditingController(),
      firsthour = TextEditingController(),
      secondhour = TextEditingController(),
      thirdhour = TextEditingController(),
      fourthhour = TextEditingController(),
      fifthhour = TextEditingController(),
      sixthhour = TextEditingController(),
      seventhhour = TextEditingController(),
      eigthhour = TextEditingController(),
      total = TextEditingController();

  var buyer = TextEditingController();
  final checker = TextEditingController();
  final orderQty = TextEditingController();
  final styleNo = TextEditingController();
  final lineNo = TextEditingController();
  final date = TextEditingController();
  final tpc = TextEditingController();
  final tdp = TextEditingController();
  final tpp = TextEditingController();
  final td = TextEditingController();
  final dhu = TextEditingController();
  final garment = TextEditingController();
  String dhuperc = '';
  List<DataRow> getRows() {
    for (int i = 0; i < rows; ++i) rowList.add(getRow(i));
    return rowList;
  }

  createData(String idd) async {
    dhucollref.document(idd).setData({
      'Line_No': lineNo.text,
      'Style_No': styleNo.text,
      'buyer': buyer.text,
      'garment': garment.text,
      'date': date.text,
      'oder_Qty': orderQty.text,
      'checker_name': checker.value.text,
      'total_defected_pieces': tdp.value.text,
      'total_pieces_checked': tpc.value.text,
      'total_pass_pieces': tpp.value.text,
      'total_defects': td.value.text,
      'dhu_percentage': dhu.value.text,
    });
    
    print('object');
  }

  @override
  void initState() {
    rows = 0;
    controllers = [];
    rowList = [];
    styleNo.text = widget.styleNo;
    lineNo.text = widget.lineNo;
    garment.text = widget.garment;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('DHU Submit'),
        centerTitle: true,
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: TextFieldDec.inputDec("line Number"),
                controller: lineNo,
              ),
              leaveSpace(),
              TextFormField(
                decoration: TextFieldDec.inputDec("Style No"),
                controller: styleNo,
              ),
              leaveSpace(),
              TextFormField(
                decoration: TextFieldDec.inputDec("Buyer"),
                controller: buyer,
              ),
              leaveSpace(),
              TextFormField(
                controller: garment,
                decoration: TextFieldDec.inputDec("Garment"),
              ),
              SizedBox(
                height: 10,
              ),
              DateTimeField(
                controller: date,
                format: DateFormat('dd-MM-yyyy'),
                decoration: TextFieldDec.inputDec("Date"),
                onShowPicker: (context, currentValue) async {
                  final dat = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1970),
                      lastDate: DateTime(2100));
                  setState(() {});
                  return dat;
                },
              ),
              leaveSpace(),
              TextFormField(
                  decoration: TextFieldDec.inputDec("Order Qty"),
                  controller: orderQty),
              leaveSpace(),
              leaveSpace(),
              Column(
                children: <Widget>[
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black)),
                      child: DataTable(
                        columns: [
                          DataColumn(
                            label: Text(
                              "Defects",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          ),
                          DataColumn(
                              label: Text("1ST HOUR",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold))),
                          DataColumn(
                              label: Text("2ND HOUR",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold))),
                          DataColumn(
                              label: Text("3RD HOUR",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold))),
                          DataColumn(
                              label: Text("4TH HOUR",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold))),
                          DataColumn(
                              label: Text("5TH HOUR",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold))),
                          DataColumn(
                              label: Text("6TH HOUR",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold))),
                          DataColumn(
                              label: Text("7TH HOUR",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold))),
                          DataColumn(
                              label: Text("8TH HOUR",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold))),
                          DataColumn(
                              label: Text("tOTAL",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)))
                        ],
                        rows: rowList,
                      ),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      IconButton(
                        color: Colors.blueAccent,
                        icon: Icon(Icons.add),
                        onPressed: () {
                          setState(
                            () {
                              print(
                                "Rows = " + rows.toString(),
                              );
                              rowList.add(
                                getRow(rows++),
                              );
                              print(controllers.length);
                            },
                          );
                        },
                      ),
                      IconButton(
                        color: Colors.redAccent,
                        icon: Icon(Icons.remove),
                        onPressed: () {
                          setState(
                            () {
                              print(controllers.length);
                              rows--;
                              if (rows >= 0) {
                                rowList.removeLast();
                                [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].forEach(
                                  (element) {
                                    controllers.removeLast();
                                  },
                                );
                              } else {
                                rows = 0;
                              }
                            },
                          );
                        },
                      ),
                      IconButton(
                        color: Colors.green,
                        icon: Icon(Icons.refresh),
                        onPressed: () {
                          setState(
                            () {
                              controllers = [];
                              rows = 0;
                              rowList = [];
                            },
                          );
                        },
                      )
                    ],
                  )
                ],
              ),
              leaveSpace(),
              leaveSpace(),
              TextFormField(
                decoration: TextFieldDec.inputDec("Checker Name"),
                controller: checker,
              ),
              leaveSpace(),
              TextFormField(
                decoration: TextFieldDec.inputDec("Total Pieces Checked"),
                controller: tpc,
                onChanged: ((value) {
                  double dhutext = 0;
                  if (int.tryParse(value) > 0 &&
                      int.tryParse(td.value.text) > 0) {
                    dhutext =
                        int.tryParse(td.value.text) * 100 / int.tryParse(value);
                  }
                  setState(() {
                    dhu.text = dhutext.toStringAsPrecision(2);
                  });
                }),
              ),
              leaveSpace(),
              TextFormField(
                decoration: TextFieldDec.inputDec("Total Defected Pieces"),
                controller: tdp,
              ),
              leaveSpace(),
              TextFormField(
                decoration: TextFieldDec.inputDec("Total Pass Pieces"),
                controller: tpp,
              ),
              leaveSpace(),
              TextFormField(
                decoration: TextFieldDec.inputDec("Total Defects"),
                controller: td,
                onChanged: ((value) {
                  double dhutext = 0;
                  if (int.tryParse(tpc.value.text) > 0 &&
                      int.tryParse(value) > 0) {
                    dhutext = int.tryParse(value) *
                        100 /
                        int.tryParse(tpc.value.text);
                  }
                  setState(
                    () {
                      dhu.text = dhutext.toStringAsPrecision(3);
                    },
                  );
                }),
              ),
              leaveSpace(),
              TextFormField(
                decoration: TextFieldDec.inputDec("DHU %"),
                controller: dhu,
              ),
              leaveSpace(),
              MaterialButton(
                minWidth: 150,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                color: Colors.black,
                padding: EdgeInsets.all(15),
                child: Text(
                  "Submit",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                  ),
                ),
                onPressed: () async {
                  String id = Uuid().v4();
                  _scaffoldState.currentState.showSnackBar(SnackBar(
                    content: Text("Uploading"),
                  ),);
                  try {
                    var tableList = [];
                    controllers.forEach(
                      (element) {
                        tableList.add(element.value.text);
                      },
                    );                    
                    createData(id);
                  } catch (e) {
                    _scaffoldState.currentState.showSnackBar(
                      SnackBar(
                        content: Text(
                          e.toString(),
                        ),
                      ),
                    );
                  }
                  controllers.forEach(
                    (element) {
                      print(element.value.text);
                    },
                  );
                  _scaffoldState.currentState.showSnackBar(
                    SnackBar(
                      content: Text("Done"),
                    ),
                  );
                  id = Uuid().v4();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

