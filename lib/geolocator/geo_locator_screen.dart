import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart';

class GeoLocatorScreen extends StatefulWidget {
  const GeoLocatorScreen({Key key}) : super(key: key);

  @override
  _GeoLocatorScreenState createState() => _GeoLocatorScreenState();
}

class _GeoLocatorScreenState extends State<GeoLocatorScreen> {
  LocationData locationData;
  double lat, log;
  Location location = Location();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("GeoLocation"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: () async {
                  requestPermission(Permission.location);
                  await getLocation();
                },
                icon: Icon(Icons.my_location),
                label: Text("GetLocation"),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  elevation: 8,
                  primary: Colors.blue,
                  shadowColor: Colors.grey,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  Text(lat.toString()),
                  Text(log.toString()),
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }

  getLocation() async {
    bool _serviceEnable;

    _serviceEnable = await location.serviceEnabled();
    if (!_serviceEnable) {
      _serviceEnable = await location.requestService();
      if (_serviceEnable) {
        return;
      }
    }

    locationData = await location.getLocation();

    location.onLocationChanged.listen((LocationData event) {
      lat = event.latitude;
      log = event.longitude;
      print(event.longitude);
      print(event.latitude);
    });

    location.enableBackgroundMode(enable: true);
  }

  Future<void> requestPermission(Permission permission) async {
    var result = await permission.request();
    print(result);
    if (result.isPermanentlyDenied) {
      await openAppSettings();
    } else {
      await permission.request();
    }
  }
}
