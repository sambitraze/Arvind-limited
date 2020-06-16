import 'package:arvind/screens/Production/lineeff.dart';
import 'package:arvind/screens/Production/wip.dart';
import 'package:flutter/material.dart';

class Production extends StatefulWidget {
  @override
  _ProductionState createState() => _ProductionState();
}

class _ProductionState extends State<Production> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('Production'),
          centerTitle: true,
          
        ),
        body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              MaterialButton(
                minWidth: 150,
                height: 80,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                color: Colors.white30,
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LineEfficiency(),),),
                child: Text(
                  'Line\nEfficiency',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              MaterialButton(
                elevation: 1,
                height: 80,
                minWidth: 150,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                color: Colors.white30,
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => WIP(),),),
                child: Text(
                  'WIP',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}