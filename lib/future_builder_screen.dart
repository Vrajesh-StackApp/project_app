import 'package:flutter/material.dart';

class FutureBuilderScreen extends StatefulWidget {
  const FutureBuilderScreen({Key key}) : super(key: key);

  @override
  _FutureBuilderScreenState createState() => _FutureBuilderScreenState();
}

Future<String> getValue() async {
  // Future.delayed(Duration(seconds: 0), () => CircularProgressIndicator());
  await Future.delayed(Duration(seconds: 5));
  return 'Vrajesh';
}

class _FutureBuilderScreenState extends State<FutureBuilderScreen> {
  // Future<String> _value;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Future Builder"),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      setState(() {});
                    },
                    label: Text('Future Builder'),
                    icon: Icon(Icons.touch_app),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(150, 50),
                      primary: Colors.blue,
                      elevation: 5,
                      shadowColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        side: BorderSide(width: 1, color: Colors.white),
                      ),
                      padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      textStyle: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontFamily: 'Roboto slab',
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                FutureBuilder(
                  future: getValue(),
                  builder:
                      (BuildContext context, AsyncSnapshot<String> snapshot) {
                    if (snapshot.connectionState == ConnectionState.none) {
                      return Text("Hello");
                    } else if (snapshot.connectionState ==
                        ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else if (snapshot.connectionState ==
                        ConnectionState.done) {
                      if (snapshot.hasData) {
                        return Text(snapshot.data);
                      } else {
                        return Text("No data available");
                      }
                    } else {
                      return Text("else");
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
