import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RowColumnScreen extends StatefulWidget {
  const RowColumnScreen({Key key}) : super(key: key);

  @override
  _RowColumnScreenState createState() => _RowColumnScreenState();
}

class _RowColumnScreenState extends State<RowColumnScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          dragStartBehavior: DragStartBehavior.start,
          reverse: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          controller: ScrollController(),
          physics: ClampingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                width: double.infinity,
                child: Stack(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 50),
                      height: 150,
                      decoration: BoxDecoration(
                          color: Colors.green.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    Container(
                      height: 160,
                      child: Row(
                        children: [
                          Expanded(
                              child: Text(
                                  "Smoking is a proven risk factor for heart attack Smoking is a proven risk factor for heart attack ")),
                          Expanded(
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: Image(
                                image: AssetImage('assets/images/smoking.png'),
                                width: 100,
                                height: 100,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                color: Colors.red,
                height: 100,
              ),
              Container(
                width: double.infinity,
                color: Colors.green,
                height: 100,
              ),
              Container(
                width: double.infinity,
                color: Colors.orange,
                height: 100,
              ),
              Container(
                width: double.infinity,
                color: Colors.purple,
                height: 100,
              ),
              Container(
                width: double.infinity,
                color: Colors.pink,
                height: 100,
              ),
              Container(
                width: double.infinity,
                color: Colors.blue,
                height: 100,
              ),
              Container(
                width: double.infinity,
                color: Colors.lime,
                height: 100,
              ),
              Align(
                alignment: Alignment.center,
                heightFactor: 0.5,
                widthFactor: 0.5,
                child: Container(
                  color: Colors.red,
                  width: 100,
                  height: 100,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
