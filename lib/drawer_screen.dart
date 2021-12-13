import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({Key key}) : super(key: key);

  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Drawer"),
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () => _scaffoldKey.currentState.openDrawer(),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              margin: EdgeInsets.zero,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/images/house.jpg'),
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    left: 16,
                    bottom: 12,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 45,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            radius: 43,
                            backgroundImage: AssetImage(
                              "assets/images/hacker.jpg",
                            ),
                          ),
                        ),
                        Text(
                          "Flutter Drawer",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: 'Roboto slab',
                            shadows: [
                              Shadow(
                                color: Colors.red,
                                blurRadius: 1,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            _createDrawerItem(
              Icons.home,
              'Home',
            ),
            _createDrawerItem(
              Icons.call,
              'Contact',
            ),
            _createDrawerItem(
              Icons.chat,
              'Chat',
            ),
            Divider(
              color: Colors.grey,
              height: 40,
            ),
            _createDrawerItem(
              Icons.collections_bookmark,
              'Steps',
            ),
            _createDrawerItem(
              Icons.face,
              'Face',
            ),
            _createDrawerItem(
              Icons.account_box,
              'Documentation',
            ),
            _createDrawerItem(
              Icons.star,
              'Useful link',
            ),
            _createDrawerItem(
              Icons.bug_report,
              'Report an issue',
            ),
            ListTile(
              title: Text('0.0.1'),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _createDrawerItem(IconData icon, String text) {
    return ListTile(
      title: Text(text),
      leading: Icon(icon),
    );
  }
}
