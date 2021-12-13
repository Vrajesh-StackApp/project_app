import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DefaultTabBarScreen extends StatefulWidget {
  const DefaultTabBarScreen({Key key}) : super(key: key);

  @override
  _DefaultTabBarScreenState createState() => _DefaultTabBarScreenState();
}

class _DefaultTabBarScreenState extends State<DefaultTabBarScreen>
    with TickerProviderStateMixin {
  TabController _tabController;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: 3, initialIndex: 0);
    _tabController.addListener(() {
      setState(() {
        _selectedIndex = _tabController.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        initialIndex: _selectedIndex,
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text('DefaultTabBar'),
            backgroundColor: Colors.blue,
            bottom: TabBar(
              controller: _tabController,
              indicatorColor: Colors.white,
              indicatorWeight: 3,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.grey,
              physics: ScrollPhysics(),
              labelPadding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              tabs: [
                Tab(
                  text: 'Home',
                  icon: Icon(
                    Icons.home,
                    color: _selectedIndex == 0 ? Colors.white : Colors.grey,
                  ),
                  iconMargin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                ),
                Tab(
                  text: 'Status',
                  icon: Icon(Icons.slideshow,
                      color: _selectedIndex == 1 ? Colors.white : Colors.grey),
                  iconMargin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                ),
                Tab(
                  text: 'Call',
                  icon: Icon(Icons.call,
                      color: _selectedIndex == 2 ? Colors.white : Colors.grey),
                  iconMargin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                ),
              ],
            ),
          ),
          body: TabBarView(
            controller: _tabController,
            physics: ScrollPhysics(),
            children: [
              Container(
                width: double.infinity,
                alignment: Alignment.center,
                child: Text(
                  "Home",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: double.infinity,
                child: Text(
                  "Status",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: double.infinity,
                child: Text(
                  "Call",
                  style: TextStyle(fontSize: 20),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
