import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SecondScreen extends StatefulWidget {
  static const String id = "ScreenSecond";

  final String text;

  const SecondScreen({Key key, @required this.text}) : super(key: key);

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  Map isPop = {'Name': 'Ashok', "Age": "23"};

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context, isPop);
        return true;
      },
      child: SafeArea(
          child: Scaffold(
        appBar: AppBar(
          title: Text("Second Screen"),
          backgroundColor: Colors.blue,
        ),
        body: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Name :- ${widget.text}",
                style: TextStyle(
                  fontFamily: 'Roboto slab',
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context, isPop);
                },
                icon: Icon(Icons.arrow_back),
                label: Text('Go Back'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  alignment: Alignment.center,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                    side: BorderSide(color: Colors.white, width: 1),
                  ),
                  elevation: 10,
                  primary: Colors.purple,
                  textStyle: TextStyle(
                    fontFamily: 'Roboto slab',
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
