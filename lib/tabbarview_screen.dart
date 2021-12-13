import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TabBarViewScreen extends StatefulWidget {
  const TabBarViewScreen({Key key}) : super(key: key);

  @override
  _TabBarViewScreenState createState() => _TabBarViewScreenState();
}

class _TabBarViewScreenState extends State<TabBarViewScreen>
    with TickerProviderStateMixin {
  TabController _tabController;
  int _selectedIndex = 0;

  @override
  void initState() {
    _tabController =
        TabController(length: tabList.length, vsync: this, initialIndex: 0);
    _tabController.addListener(() {
      setState(() {
        _selectedIndex = _tabController.index;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        initialIndex: _selectedIndex,
        length: tabList.length,
        child: Scaffold(
          appBar: AppBar(
            title: Text("TabBarView"),
            backgroundColor: Colors.blue,
            bottom: TabBar(
              controller: _tabController,
              tabs: tabList,
              physics: ScrollPhysics(),
              labelPadding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              labelColor: Colors.white,
              unselectedLabelColor: Colors.grey,
            ),
          ),
          body: TabBarView(
            controller: _tabController,
            children: [
              Container(
                width: double.infinity,
                alignment: Alignment.center,
                child: Text(
                  "Chat",
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<Widget> tabList = [
  Tab(text: "Chat", icon: Icon(Icons.chat)),
  Tab(text: "Status", icon: Icon(Icons.slideshow)),
  Tab(text: "Chat", icon: Icon(Icons.call)),
];
