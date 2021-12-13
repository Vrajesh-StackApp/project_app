import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppBarScreen extends StatefulWidget {
  const AppBarScreen({Key key}) : super(key: key);

  @override
  _AppBarScreenState createState() => _AppBarScreenState();
}

class _AppBarScreenState extends State<AppBarScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('AppBar Screen'),
          backgroundColor: Colors.blue,
          leading: Icon(Icons.account_circle_rounded),
          leadingWidth: 56, //default 56
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Icon(Icons.search),
            ),
            Icon(Icons.more_vert),
          ],
          actionsIconTheme: IconThemeData(
            color: Colors.black,
            size: 36,
          ),
          textTheme: TextTheme(
            headline6: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontFamily: 'Roboto slab',
            ),
          ),
          elevation: 10,
          shadowColor: Colors.blue,
          toolbarHeight: 80,
          toolbarOpacity: 0.5,
          automaticallyImplyLeading: false,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          brightness: Brightness.light,
          iconTheme: IconThemeData(
            color: Colors.red,
            size: 30,
          ),
          bottom: PreferredSize(
            child: Text("Hello"),
            preferredSize: Size.fromWidth(30),
          ),
          bottomOpacity: 0.5,
          centerTitle: true,
          foregroundColor: Colors.red,
          titleSpacing: 20,
          toolbarTextStyle: TextStyle(
            color: Colors.red,
          ),
          excludeHeaderSemantics: false,
        ),
      ),
    );
  }
}
