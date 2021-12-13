import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesScreen extends StatefulWidget {
  const SharedPreferencesScreen({Key key}) : super(key: key);

  @override
  _SharedPreferencesScreenState createState() =>
      _SharedPreferencesScreenState();
}

class _SharedPreferencesScreenState extends State<SharedPreferencesScreen> {
  Future<SharedPreferences> _pref;
  List stdList = [];
  Map stdMap = {};
  String email = '';
  String password = '';
  String studentData = '';
  String studentMap = '';

  String getStdData = '';
  String getStdMapData = '';
  List getStdList = [];
  Map getStdMap = {};

  Future<SharedPreferences> setSharedPreferences() async {
    await Future.delayed(Duration(seconds: 5));

    /*stdList.add(Student(1, "Vrajesh", 1000));
    stdList.add(Student(2, "Ashok", 2000));*/

    stdList.add("Vrajesh");
    stdList.add("Ashok");

    stdMap.addAll({"name": "Vrajesh@123", "name1": "Ashok@123"});

    studentData = jsonEncode(stdList);
    studentMap = jsonEncode(stdMap);

    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("userid", "ashok.stackapp@gmail.com");
    pref.setString("password", "1234567");
    pref.setString("StudentList", studentData);
    pref.setString("StudentMap", studentMap);

    return pref;
  }

  Future getEmailPass() async {
    SharedPreferences _getPref = await SharedPreferences.getInstance();

    email = _getPref.getString("userid");
    password = _getPref.getString("password");
    getStdData = _getPref.getString("StudentList");
    getStdMapData = _getPref.getString("StudentMap");

    if (getStdData != null) {
      getStdList = jsonDecode(getStdData);
      email = getStdList[0];
      password = getStdList[1];

      print(getStdData);
    }
    if (getStdMapData != null) {
      getStdMap = jsonDecode(getStdMapData);
      email = getStdMap['name'];
      password = getStdMap['name1'];

      print(getStdMap);
    }

    print(email);
    print(password);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getEmailPass();
  }

  Future clearPrefData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.clear();
  }

  Future removePrefData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.remove('StudentMap');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("Shared Preference"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Email :- $email",
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Roboto slab',
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Password :- $password",
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Roboto slab',
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: ElevatedButton.icon(
                  onPressed: () {
                    _pref = setSharedPreferences();
                    setState(() {});
                  },
                  label: Text('Login'),
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
                height: 20,
              ),
              Container(
                child: ElevatedButton.icon(
                  onPressed: () {
                    clearPrefData();
                    setState(() {});
                  },
                  label: Text('Logout'),
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
              Container(
                child: ElevatedButton.icon(
                  onPressed: () {
                    removePrefData();
                    setState(() {});
                  },
                  label: Text('Remove Map Data'),
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
                future: _pref,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.none) {
                    return Text("none");
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.connectionState == ConnectionState.done) {
                    return Text("Data Saved");
                  } else {
                    return Text("error");
                  }
                },
              ),
            ],
          ),
        ),
      ),
    ));
  }
}

class Student {
  int id;
  String name;
  int fee;
  Student(this.id, this.name, this.fee);
}
