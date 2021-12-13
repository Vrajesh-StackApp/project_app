import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({Key key}) : super(key: key);

  @override
  _BottomNavigationScreenState createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue,
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.purple,
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          unselectedItemColor: Colors.black,
          selectedItemColor: Colors.blue,
          selectedFontSize: 15,
          elevation: 0,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.grey,
              ),
              label: 'Home',
              activeIcon: Icon(
                Icons.home,
                color: Colors.blue,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.business,
                color: Colors.grey,
              ),
              label: 'Business',
              activeIcon: Icon(
                Icons.business,
                color: Colors.blue,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.school,
                color: Colors.grey,
              ),
              label: 'School',
              activeIcon: Icon(
                Icons.school,
                color: Colors.blue,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.flight,
                color: Colors.grey,
              ),
              label: 'Flight',
              activeIcon: Icon(
                Icons.flight,
                color: Colors.blue,
              ),
            ),
          ],
          onTap: (value) {
            setState(() {
              _selectedIndex = value;
            });
          },
        ),
        body: _bottomList.elementAt(_selectedIndex),
      ),
    );
  }

  List<Widget> _bottomList = [
    Container(
      color: Colors.red,
      width: double.infinity,
      height: double.infinity,
      alignment: Alignment.center,
      child: Text(
        "Home",
        style: TextStyle(
            color: Colors.white, fontSize: 20, fontFamily: 'Roboto slab'),
      ),
    ),
    Container(
      color: Colors.green,
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
      child: Text(
        "Business",
        style: TextStyle(
            color: Colors.white, fontSize: 20, fontFamily: 'Roboto slab'),
      ),
    ),
    Container(
      color: Colors.blue,
      width: double.infinity,
      height: double.infinity,
      alignment: Alignment.center,
      child: Text(
        "School",
        style: TextStyle(
            color: Colors.white, fontSize: 20, fontFamily: 'Roboto slab'),
      ),
    ),
    Container(
      color: Colors.yellow,
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
      child: Text(
        "Flight",
        style: TextStyle(
            color: Colors.black, fontSize: 20, fontFamily: 'Roboto slab'),
      ),
    ),
  ];
}
