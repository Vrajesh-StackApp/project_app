import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AspactRatioScreen extends StatefulWidget {
  const AspactRatioScreen({Key key}) : super(key: key);

  @override
  _AspactRatioScreenState createState() => _AspactRatioScreenState();
}

class _AspactRatioScreenState extends State<AspactRatioScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("AspactRatio Screen"),
          backgroundColor: Colors.blue,
        ),
        body: Column(
          children: [
            Container(
              color: Colors.green,
              child: AspectRatio(
                aspectRatio: 2 / 1,
                child: Image(
                  image: AssetImage('assets/images/house.jpg'),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Container(
                  child: Visibility(
                    visible: false,
                    maintainState: true,
                    maintainAnimation: true,
                    maintainSize: true,
                    maintainInteractivity: true,
                    child: Image(
                      image: AssetImage('assets/images/house.jpg'),
                      width: 100,
                      height: 100,
                    ),
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                Container(
                  child: Visibility(
                    visible: true,
                    maintainState: true,
                    maintainAnimation: true,
                    maintainSize: true,
                    maintainInteractivity: true,
                    child: Image(
                      image: AssetImage('assets/images/house.jpg'),
                      width: 100,
                      height: 100,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
