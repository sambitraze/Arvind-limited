import 'package:arvind/screens/Quality.dart';
import 'package:arvind/screens/production.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('Arvind Limited'),
          centerTitle: true,
          actions: <Widget>[
            MaterialButton(
              onPressed: () {print('LOgged Out');Navigator.pop(context);},
              child: Icon(
                Icons.exit_to_app,
                color: Colors.white,
              ),
            )
          ],
        ),
        body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              MaterialButton(
                elevation: 1,
                minWidth: 150,
                height: 80,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                color: Colors.white30,
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Production(),),),
                child: Text(
                  'Production',
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
                    MaterialPageRoute(builder: (context) => Quality(),),),
                child: Text(
                  'Quality',
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
