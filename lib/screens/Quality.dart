import 'package:arvind/screens/Quality/Alteration.dart';
import 'package:arvind/screens/Quality/DHU.dart';
import 'package:arvind/screens/Quality/Inspection.dart';
import 'package:arvind/screens/Quality/Rejection.dart';
import 'package:flutter/material.dart';

class Quality extends StatefulWidget {
  @override
  _QualityState createState() => _QualityState();
}

class _QualityState extends State<Quality> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('Quality'),
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
                    MaterialPageRoute(builder: (context) => DHU(),),),
                child: Text(
                  'DHU%',
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
                    MaterialPageRoute(builder: (context) => Rejection(),),),
                child: Text(
                  'Rejection%',
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
                    MaterialPageRoute(builder: (context) => Alteration(),),),
                child: Text(
                  'Alteration%',
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
                    MaterialPageRoute(builder: (context) => Inspection(),),),
                child: Text(
                  'Inspection',
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