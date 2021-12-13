import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({Key key}) : super(key: key);

  @override
  _LayoutScreenState createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.grey,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 5,
                              ),
                              Expanded(child: commonContainer(0, 0)),
                              SizedBox(
                                width: 5,
                              ),
                              Expanded(child: commonContainer(0, 0)),
                              SizedBox(
                                width: 5,
                              ),
                              Expanded(child: commonContainer(0, 0)),
                              SizedBox(
                                width: 5,
                              ),
                            ],
                          ),
                          Container(
                              width: double.infinity,
                              child: commonContainer(5, 5)),
                          Row(
                            children: [
                              SizedBox(
                                width: 5,
                              ),
                              Expanded(child: commonContainer(0, 0)),
                              SizedBox(
                                width: 5,
                              ),
                              Expanded(child: commonContainer(0, 0)),
                              SizedBox(
                                width: 5,
                              ),
                            ],
                          ),
                          Expanded(
                            child: Container(
                                width: double.infinity,
                                child: commonContainer(5, 5)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                            width: double.infinity,
                            child: commonContainer(0, 0)),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                            width: double.infinity,
                            child: commonContainer(0, 0)),
                        SizedBox(
                          height: 10,
                        ),
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            color: Colors.grey,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Expanded(
                                      child: commonContainer(0, 0),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Expanded(
                                      child: commonContainer(0, 0),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Expanded(
                                  child: Container(
                                      width: double.infinity,
                                      child: commonContainer(5, 0)),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Expanded(
                                      child: commonContainer(0, 0),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Expanded(
                                      child: commonContainer(0, 0),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: commonContainer(0, 0),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: commonContainer(0, 0),
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
            Container(
              width: double.infinity,
              child: commonContainer(10, 10),
            ),
            SizedBox(
              width: 10,
            ),
          ],
        ),
      ),
    );
  }

  Widget commonContainer(double hMargin, double vMargin) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: hMargin, vertical: vMargin),
      color: Colors.blue,
      child: Text(
        "Hello",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20.0,
          fontFamily: 'Roboto slab',
        ),
      ),
    );
  }
}
