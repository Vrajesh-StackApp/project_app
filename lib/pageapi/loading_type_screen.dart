import 'package:flutter/material.dart';
import 'package:project_app/pageapi/page_api_button_screen.dart';
import 'package:project_app/pageapi/page_api_circular_screen.dart';
import 'package:project_app/pageapi/page_api_grid_circular_screen.dart';

class LoadingTypeScreen extends StatefulWidget {
  const LoadingTypeScreen({Key key}) : super(key: key);

  @override
  _LoadingTypeScreenState createState() => _LoadingTypeScreenState();
}

class _LoadingTypeScreenState extends State<LoadingTypeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: Text("Loading Type"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0.0, 10.0, 20.0, 10.0),
              child: ElevatedButton.icon(
                onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (builder) => PageApiCircularScreen()));

                },
                label: Text('PageApi Circular'),
                icon: Icon(Icons.send),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(150, 50),
                  primary: Colors.purple,
                  elevation: 5,
                  shadowColor: Colors.purple,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0)),
                  padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  textStyle: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                    fontFamily: 'Roboto slab',
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0.0, 10.0, 20.0, 10.0),
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (builder) => PageApiButtonScreen()));

                },
                label: Text('PageApi Button'),
                icon: Icon(Icons.send),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(150, 50),
                  primary: Colors.purple,
                  elevation: 5,
                  shadowColor: Colors.purple,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0)),
                  padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  textStyle: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                    fontFamily: 'Roboto slab',
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0.0, 10.0, 20.0, 10.0),
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (builder) => PageApiGridCircularScreen()));

                },
                label: Text('PageApi Grid Circular'),
                icon: Icon(Icons.send),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(150, 50),
                  primary: Colors.purple,
                  elevation: 5,
                  shadowColor: Colors.purple,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0)),
                  padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  textStyle: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                    fontFamily: 'Roboto slab',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
