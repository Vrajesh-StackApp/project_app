import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionHandling extends StatefulWidget {
  const PermissionHandling({Key key}) : super(key: key);

  @override
  _PermissionHandlingState createState() => _PermissionHandlingState();
}

class _PermissionHandlingState extends State<PermissionHandling> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Permission Handling'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              commonButton("Storage", Permission.storage),
              commonButton("Location", Permission.location),
              commonButton("Contact", Permission.contacts),
              commonButton("Sms", Permission.sms),
              commonButton("Ignore Battery Optimization",
                  Permission.ignoreBatteryOptimizations),
              commonButton(
                  "AccessMediaLocation ", Permission.accessMediaLocation),
              commonButton("Bluetooth ", Permission.bluetooth),
            ],
          ),
        ),
      ),
    );
  }

  commonButton(String name, Permission permission) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            alignment: AlignmentDirectional.center,
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(color: Colors.white, width: 1),
            )),
        onPressed: () => requestPermission(permission),
        child: Text(
          name,
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontFamily: "Roboto slab",
          ),
        ),
      ),
    );
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
