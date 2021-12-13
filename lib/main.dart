import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:project_app/access_external_screen.dart';
import 'package:project_app/appbar_screen.dart';
import 'package:project_app/aspact_rasio_screen.dart';
import 'package:project_app/asynchronous_screen.dart';
import 'package:project_app/bottom_navigation_screen.dart';
import 'package:project_app/customappbar_screen.dart';
import 'package:project_app/defaulttabbar_screen.dart';
import 'package:project_app/drawer_screen.dart';
import 'package:project_app/form_design_screen.dart';
import 'package:project_app/future_builder_screen.dart';
import 'package:project_app/geolocator/geo_locator_screen.dart';
import 'package:project_app/gridview_screen.dart';
import 'package:project_app/pageapi/loading_type_screen.dart';
import 'package:project_app/payment_gateway/payment_gateway_screen.dart';
import 'package:project_app/provider/image_provider.dart';
import 'package:project_app/provider/screen/provider_data_screen.dart';
import 'package:project_app/services/json_parser_screen.dart';
import 'package:project_app/layout_screen.dart';
import 'package:project_app/listview_screen.dart';
import 'package:project_app/open_gallery_screen.dart';
import 'package:project_app/pageview_screen.dart';
import 'package:project_app/permision_handling.dart';
import 'package:project_app/row_column_screen.dart';
import 'package:project_app/screen_orientation.dart';
import 'package:project_app/second_screen.dart';
import 'package:project_app/shared_preferences_screen.dart';
import 'package:project_app/sliverappbar_screen.dart';
import 'package:project_app/database/sqlite_database_screen.dart';
import 'package:project_app/tabbarview_screen.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.lightBlue));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ImageProviderAbc()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
        debugShowCheckedModeBanner: false,
        routes: {
          // '/': (context) => HomeScreen(),
          SecondScreen.id: (context) => SecondScreen(
                text: "Hello",
              ),
        },
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class TimeValue {
  final int _key;
  final String _value;
  final String _rupee;
  bool _checked;

  TimeValue(this._key, this._value, this._rupee, this._checked);
}

class _HomePageState extends State<HomePage> {
  var isSwitched = false;
  var isRadio = false;
  var _sliderVal = 10.0;
  int val = 1;

  final _buttonList = [
    TimeValue(30, "30 Minutes", "100", false),
    TimeValue(60, "1 Hour", "200", false),
    TimeValue(120, "2 Hours", "300", false)
  ];

  DateTime _date = DateTime.now();

  Future<Null> _selectDate(BuildContext context) async {
    DateTime _datePicker = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(1947),
      lastDate: DateTime(2030),
      textDirection: TextDirection.ltr,
      initialDatePickerMode: DatePickerMode.day, //Day or Year mode
      selectableDayPredicate: (DateTime val) =>
          val.weekday == 7 ? false : true, // Week day off
    );

    if (_datePicker != null && _datePicker != _date) {
      setState(() {
        _date = _datePicker;
      });
    }
  }

  TimeOfDay _time = TimeOfDay.now();

  Future<Null> _selectTime(BuildContext context) async {
    TimeOfDay _timePicker = await showTimePicker(
      context: context,
      initialTime: _time,
      initialEntryMode: TimePickerEntryMode.dial,
    );
    if (_timePicker != null && _timePicker != _time) {
      setState(() {
        _time = _timePicker;
      });
    }
  }

  double _progress = 0;
  String _chosenValue = 'Android';

  void startTimer() {
    new Timer.periodic(Duration(seconds: 1), (Timer timer) {
      setState(() {
        if (_progress == 1) {
          timer.cancel();
        } else {
          _progress += 0.05;
        }
      });
    });
  }

  Widget _chip(String label, Color color) {
    return Chip(
      avatar: CircleAvatar(
        backgroundColor: Colors.black54,
        child: Text(
          label[0].toUpperCase(),
          style: TextStyle(color: Colors.white),
        ),
      ),
      label: Text(
        label,
        style: TextStyle(color: Colors.white),
      ),
      labelPadding: EdgeInsets.all(4.0),
      backgroundColor: color,
      shadowColor: Colors.grey[80],
      elevation: 5.0,
      padding: EdgeInsets.all(4.0),
    );
  }

  var heading = '\$2300 per month';
  var subheading = '2 bed, 1 bath, 1300 sqft';
  var supportingText =
      'Beautiful home to rent, recently refurbished with modern appliances...';

  bool _isBluetooth = false;

  Widget _choiceChip(String label, Color color, bool isChoice) {
    return ChoiceChip(
      selected: isChoice,
      onSelected: (bool value) {
        setState(() {
          isChoice = !isChoice;
          print(isChoice);
        });
      },
      avatar: CircleAvatar(
        backgroundColor: Colors.black54,
        child: Text(
          label[0].toUpperCase(),
          style: TextStyle(color: Colors.white),
        ),
      ),
      label: Text(
        label,
        style: TextStyle(color: Colors.white),
      ),
      selectedColor: Colors.black,
      selectedShadowColor: color,
      pressElevation: 5.0,
      labelPadding: EdgeInsets.all(4.0),
      backgroundColor: color,
      shadowColor: Colors.grey[80],
      elevation: 5.0,
      padding: EdgeInsets.all(4.0),
    );
  }

  PermissionStatus _permissionStatus;

  Future<void> requestPermission(Permission permission) async {
    var result = await permission.request();
    print(result);
    if (result.isPermanentlyDenied) {
      await openAppSettings();
    } else {
      await permission.request();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Text Widget Example')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0.0, 10.0, 20.0, 10.0),
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (builder) => ProviderDataScreen()));
                },
                label: Text('Provider Demo'),
                icon: Icon(Icons.web),
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
                          builder: (builder) => PaymentGatewayScreen()));
                },
                label: Text('Payment Gateway'),
                icon: Icon(Icons.paid),
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
                          builder: (builder) => GeoLocatorScreen()));
                },
                label: Text('GeoLocator'),
                icon: Icon(Icons.my_location),
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
                  if (_permissionStatus.isDenied) {
                    requestPermission(Permission.storage);
                  } else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (builder) => LoadingTypeScreen()));
                  }
                },
                label: Text('Page Api Calling'),
                icon: Icon(Icons.web),
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
                  if (_permissionStatus.isDenied) {
                    requestPermission(Permission.storage);
                  } else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (builder) => OpenGalleryScreen()));
                  }
                },
                label: Text('Open Gallery'),
                icon: Icon(Icons.web),
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
                  if (_permissionStatus.isDenied) {
                    requestPermission(Permission.storage);
                  } else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (builder) => JsonParserScreen()));
                  }
                },
                label: Text('Json Parser'),
                icon: Icon(Icons.web),
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
                  if (_permissionStatus.isDenied) {
                    requestPermission(Permission.storage);
                  } else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (builder) => SqliteDatabaseScreen()));
                  }
                },
                label: Text('Sqlite Database'),
                icon: Icon(Icons.web),
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
                  if (_permissionStatus.isDenied) {
                    requestPermission(Permission.storage);
                  } else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (builder) => SharedPreferencesScreen()));
                  }
                },
                label: Text('Shared Preferences'),
                icon: Icon(Icons.web),
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
                  if (_permissionStatus.isDenied) {
                    requestPermission(Permission.storage);
                  } else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (builder) => FutureBuilderScreen()));
                  }
                },
                label: Text('Future Builder'),
                icon: Icon(Icons.web),
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
                  if (_permissionStatus.isDenied) {
                    requestPermission(Permission.storage);
                  } else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (builder) => AsynchronousScreen()));
                  }
                },
                label: Text('Asynchronous'),
                icon: Icon(Icons.web),
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
                  if (_permissionStatus.isDenied) {
                    requestPermission(Permission.storage);
                  } else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (builder) => AccessExternalScreen(
                                title: 'ExtStorage Demo')));
                  }
                },
                label: Text('Access Storage'),
                icon: Icon(Icons.web),
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
                  if (kIsWeb) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text("Web PlatForm")));
                  } else {
                    if (Platform.isAndroid) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Android PlatForm")));
                    }
                    if (Platform.isIOS) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("IOS PlatForm")));
                    }
                  }
                },
                label: Text('Is Platform'),
                icon: Icon(Icons.web),
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
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (builder) => PermissionHandling())),
                label: Text('Permission Handling'),
                icon: Icon(Icons.web),
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
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (builder) => BottomNavigationScreen())),
                label: Text('Bottom Navigation'),
                icon: Icon(Icons.web),
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
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (builder) => DrawerScreen())),
                label: Text('Drawer'),
                icon: Icon(Icons.web),
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
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (builder) => TabBarViewScreen())),
                label: Text('TabBarView'),
                icon: Icon(Icons.web),
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
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (builder) => DefaultTabBarScreen())),
                label: Text('DefaultTabBar'),
                icon: Icon(Icons.web),
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
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (builder) => CustomAppBarScreen())),
                label: Text('CustomAppBar'),
                icon: Icon(Icons.web),
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
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (builder) => SliverAppBarScreen())),
                label: Text('SliverAppBar'),
                icon: Icon(Icons.web),
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
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (builder) => AppBarScreen())),
                label: Text('AppBar'),
                icon: Icon(Icons.web),
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
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (builder) => PageViewScreen())),
                label: Text('PageView'),
                icon: Icon(Icons.web),
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
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (builder) => GreedViewScreen())),
                label: Text('GridView'),
                icon: Icon(Icons.web),
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
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (builder) => ListViewScreen())),
                label: Text('Listview it\'s type'),
                icon: Icon(Icons.web),
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
            Text(
              'As Michael Harvey writes, paragraphs are “in essence—a form of punctuation.',
              textAlign: TextAlign.start,
              // textScaleFactor: 2.0,
              // maxLines: 2,
              softWrap: true,
              // overflow: TextOverflow.ellipsis,
              textWidthBasis: TextWidthBasis.parent,
              style: TextStyle(
                fontSize: 25.0,
                letterSpacing: 2.0,
                wordSpacing: 5.0,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.italic,
                fontFamily: "Roboto Slab",
                decoration: TextDecoration.overline,
                shadows: [
                  Shadow(
                      color: Colors.white,
                      offset: Offset(0.1, 0.1),
                      blurRadius: 20)
                ],
                color: Colors.red,
                // height: 2.0,
                backgroundColor: Colors.black,
                decorationColor: Colors.blueAccent,
                decorationThickness: 2.0,
                decorationStyle: TextDecorationStyle.dotted,
              ),
              semanticsLabel: 'Double Dollars',
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Name',
                  hintText: 'Enter your name',
                  border: OutlineInputBorder(),
                ),
                cursorColor: Colors.red,
                cursorHeight: 30.0,
                cursorWidth: 5.0,
                cursorRadius: Radius.circular(50.0),
                autocorrect: true,
                enabled: true,
                autofocus: false,
                obscuringCharacter: "\u{2222}",
                onChanged: (value) => {print(value)},
                onTap: () {
                  print("hello");
                },
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 10.0),
              child: Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter your password',
                    hintStyle: TextStyle(
                        fontFamily: 'Roboto slab', color: Colors.brown),
                    helperText: "Hello",

                    // icon: Icon(Icons.visibility),
                    // prefix: CircularProgressIndicator(),
                    prefixIcon: Icon(Icons.visibility),
                    suffixIcon: Icon(Icons.visibility),
                    prefixIconConstraints: BoxConstraints(
                      minHeight: 40.0,
                      minWidth: 40.0,
                      maxWidth: 50.0,
                      maxHeight: 50.0,
                    ),
                    suffixIconConstraints: BoxConstraints(
                        minWidth: 40.0,
                        minHeight: 40.0,
                        maxWidth: 50.0,
                        maxHeight: 50.0),
                    border: OutlineInputBorder(),
                  ),
                  cursorColor: Colors.red,
                  cursorHeight: 30.0,
                  cursorWidth: 5.0,
                  cursorRadius: Radius.circular(50.0),
                  autocorrect: true,
                  enabled: true,
                  maxLength: 4,
                  // obscureText: true,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  textCapitalization: TextCapitalization.sentences,
                  textAlign: TextAlign.center,
                  textAlignVertical: TextAlignVertical.center,
                  scrollController: ScrollController(
                    keepScrollOffset: true,
                  ),
                  validator: (String value) {
                    return (value != null && value.contains('@'))
                        ? 'Do not use the @ char.'
                        : null;
                  },
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w700,
                    fontSize: 20.0,
                    decorationStyle: TextDecorationStyle.dashed,
                    decorationThickness: 2,
                    decorationColor: Colors.black,
                    // decoration: TextDecoration.underline,
                    fontFamily: 'Roboto slab',
                    fontStyle: FontStyle.italic,
                    letterSpacing: 2.0,
                    textBaseline: TextBaseline.ideographic,
                    inherit: true,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 50),
              child: ElevatedButton.icon(
                onPressed: () => {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Elevated Button Clicked'),
                    backgroundColor: Colors.red,
                  ))
                },
                label: Text('Elevated Button'),
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
              padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              width: 100,
              child: Switch(
                value: isSwitched,
                onChanged: (value) {
                  setState(() {
                    isSwitched = value;
                  });
                  print(isSwitched);
                },
                activeTrackColor: Colors.lightGreenAccent,
                activeColor: Colors.green,
                inactiveThumbColor: Colors.lightBlue,
                inactiveTrackColor: Colors.lightBlueAccent,
              ),
            ),
            Container(
              child: ListView(
                physics: ClampingScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.all(8.0),
                children: _buttonList
                    .map((timeValue) => RadioListTile(
                          value: timeValue._key,
                          groupValue: val,
                          title: Text(timeValue._value),
                          subtitle: Text("₹ ${timeValue._rupee}"),
                          secondary: Icon(Icons.sd_storage),
                          selected: isRadio,
                          toggleable: true,
                          activeColor: Colors.red,
                          controlAffinity: ListTileControlAffinity.trailing,
                          onChanged: (int value) {
                            setState(() {
                              if (value != null) {
                                val = value;
                                print(val);
                              }
                              // if (isRadio == false) {
                              //   isRadio = true;
                              // } else {
                              //   isRadio = false;
                              // }
                            });
                          },
                        ))
                    .toList(),
              ),
            ),
            Container(
              width: double.maxFinite,
              child: ListView(
                physics: ClampingScrollPhysics(),
                shrinkWrap: true,
                children: _buttonList
                    .map((e) => CheckboxListTile(
                          value: e._checked,
                          onChanged: (value) {
                            if (value != null) {
                              e._checked = value;
                            }
                            setState(() {});
                          },
                          title: Text(e._value),
                          subtitle: Text("₹ ${e._rupee}"),
                          secondary: Icon(Icons.web),
                          checkColor: Colors.white,
                          activeColor: Colors.blue,
                          selected: e._checked,
                          isThreeLine: true,
                          dense: true,
                          controlAffinity: ListTileControlAffinity.leading,
                        ))
                    .toList(),
              ),
            ),
            Container(
              child: Slider(
                value: _sliderVal,
                min: 0,
                max: 10,
                onChanged: (e) {
                  setState(() {
                    _sliderVal = e;
                  });
                },
                divisions: 10,
                label: _sliderVal.round().toString(),
                activeColor: Colors.green,
                inactiveColor: Colors.orange,
                semanticFormatterCallback: (double newValue) {
                  return '${newValue.round()}dollars';
                },
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(50, 10, 50, 20),
              child: ElevatedButton.icon(
                onPressed: () => {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('SnackBar Button Clicked'),
                    backgroundColor: Colors.lightBlue,
                    elevation: 2.0,
                    duration: Duration(seconds: 2),
                    action: SnackBarAction(
                      label: 'Dismiss',
                      onPressed: () {
                        print('Dismiss');
                      },
                      textColor: Colors.white,
                    ),
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    width: 300.0,
                  ))
                },
                label: Text('SnackBar Button'),
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
              margin: EdgeInsets.fromLTRB(50, 10, 50, 20),
              child: ElevatedButton.icon(
                onPressed: () => {
                  showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Delete'),
                          content: Text('Are you sure?'),
                          elevation: 5.0,
                          // actionsOverflowButtonSpacing: 10.0,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                          backgroundColor: Colors.yellowAccent,
                          // clipBehavior: Clip.hardEdge,
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text("Remind me later")),
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text("Yes")),
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text("No")),
                          ],
                        );
                      })
                },
                label: Text('Alert Dialog'),
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
              margin: EdgeInsets.fromLTRB(50, 10, 50, 20),
              child: Column(
                children: [
                  Text(
                    "Date Picker :- \n ${_date.day}-${_date.month}-${_date.year}",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: 'Roboto slab',
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () => {_selectDate(context)},
                    label: Text('Date Pick'),
                    icon: Icon(Icons.calendar_today_rounded),
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
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(50, 10, 50, 20),
              child: Column(
                children: [
                  Text(
                    "Time Picker :- \n ${_time.hour}:${_time.minute}",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: 'Roboto slab',
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () => {_selectTime(context)},
                    label: Text('Time Pick'),
                    icon: Icon(Icons.access_time_sharp),
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
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(50, 10, 50, 20),
              child: Row(
                children: [
                  CircularProgressIndicator(
                    color: Colors.green,
                    backgroundColor: Colors.lightGreen,
                    strokeWidth: 10.0,
                    valueColor: AlwaysStoppedAnimation(Colors.green),
                    value: _progress,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      setState(() {
                        _progress = 0;
                      });
                      startTimer();
                    },
                    label: Text('Start progress'),
                    icon: Icon(Icons.access_time_sharp),
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
                ],
              ),
            ),
            Container(
              child: DropdownButton(
                value: _chosenValue,
                style: TextStyle(color: Colors.black),
                onChanged: (String val) {
                  setState(() {
                    if (val != null) {
                      _chosenValue = val;
                    }
                  });
                },
                items: <String>[
                  "Android",
                  "Ios",
                  "Flutter",
                  "Node",
                  "Java",
                  "Python",
                  "Php",
                ].map<DropdownMenuItem<String>>((String e) {
                  return DropdownMenuItem<String>(
                    value: e,
                    child: Text(e),
                  );
                }).toList(),
                hint: Text(
                  'Please chose language',
                  style: TextStyle(fontSize: 16.0, color: Colors.black),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 20.0),
              child: Column(
                children: <Widget>[
                  Text("Chip,Wrap Widget"),
                  Wrap(
                    spacing: 5.0,
                    runSpacing: 2.0,
                    children: <Widget>[
                      _chip('Science', Colors.red),
                      _chip('English', Colors.green),
                      _chip('Maths', Colors.orange),
                      _chip('Hindi', Colors.yellow),
                      _chip('Gujarati', Colors.black38),
                      _chip('Punjabi', Colors.blue),
                    ],
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(10.0),
              child: Card(
                shadowColor: Colors.grey[60],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                elevation: 4.0,
                child: Column(
                  children: [
                    ListTile(
                      title: Text(heading),
                      subtitle: Text(subheading),
                      trailing: Icon(Icons.favorite_outline),
                    ),
                    Container(
                        // height: 200.0,
                        child: Image.asset(
                      "assets/images/house.jpg",
                      fit: BoxFit.scaleDown,
                    )),
                    Container(
                      padding: EdgeInsets.all(16.0),
                      alignment: Alignment.centerLeft,
                      child: Text(supportingText),
                    ),
                    ButtonBar(
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text("Contact Agent".toUpperCase()),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text("Lern More".toUpperCase()),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(20.0),
              child: IconButton(
                icon: Icon(Icons.bluetooth),
                iconSize: 40.0,
                color: Colors.grey,
                highlightColor: Colors.red,
                hoverColor: Colors.green,
                focusColor: Colors.purple,
                splashColor: Colors.yellow,
                disabledColor: Colors.amber,
                onPressed: () {
                  setState(() {
                    _isBluetooth = !_isBluetooth;
                  });
                },
                tooltip: "Toggle Bluetooth :- $_isBluetooth",
                alignment: Alignment.centerRight,
                enableFeedback: true,
                autofocus: true,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 20.0),
              child: Column(
                children: <Widget>[
                  Wrap(
                    spacing: 5.0,
                    runSpacing: 2.0,
                    children: <Widget>[
                      _choiceChip("Android", Colors.red, false),
                      _choiceChip("Flutter", Colors.green, false),
                      _choiceChip("Php", Colors.orange, false),
                      _choiceChip("Java", Colors.yellow, false),
                      _choiceChip("Kotlin", Colors.blue, false),
                      _choiceChip("Python", Colors.pink, false),
                      _choiceChip("Node", Colors.purple, false),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 20.0),
              child: CircleAvatar(
                radius: 55,
                backgroundColor: Colors.blue,
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/images/house.jpg'),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0.0, 10.0, 20.0, 10.0),
              child: ElevatedButton.icon(
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (builder) => LayoutScreen())),
                label: Text('Layout Screen'),
                icon: Icon(Icons.web),
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
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (builder) => RowColumnScreen())),
                label: Text('Row Column Screen'),
                icon: Icon(Icons.web),
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
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (builder) => ScreenOrienation())),
                label: Text('Screen Orientation'),
                icon: Icon(Icons.web),
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
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (builder) => AspactRatioScreen())),
                label: Text('AspactRatio Screen'),
                icon: Icon(Icons.web),
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
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (builder) => FormDesignScreen())),
                label: Text('Form Design'),
                icon: Icon(Icons.web),
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
    );
  }
}
