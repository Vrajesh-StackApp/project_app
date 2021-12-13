import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScreenOrienation extends StatefulWidget {
  const ScreenOrienation({Key key}) : super(key: key);

  @override
  _ScreenOrienationState createState() => _ScreenOrienationState();
}

class _ScreenOrienationState extends State<ScreenOrienation> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text("Screen Orientation"),
        ),
        body: Container(
          child: OrientationBuilder(
            builder: (context, orientation) {
              if (orientation == Orientation.portrait) {
                return _portraitMode();
              } else {
                return _landscapeMode();
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _portraitMode() {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Portrait Mode",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto slab',
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Image.asset(
              'assets/images/house.jpg',
              height: 200,
              width: 200,
            ),
          ],
        ),
      ],
    );
  }

  Widget _landscapeMode() {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Landscape Mode",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto slab',
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Image.asset(
              'assets/images/smoking.png',
              height: 50,
            )
          ],
        ),
      ],
    );
  }
}
