import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class ListViewScreen extends StatefulWidget {
  const ListViewScreen({Key key}) : super(key: key);

  @override
  _ListViewScreenState createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<ListViewScreen> {
  List<Widget> itemList = [
    Text('Item 1'),
    Text('Item 2'),
    Text('Item 3'),
    Text('Item 4'),
    Text('Item 5'),
    Text('Item 6'),
    Text('Item 7'),
    Text('Item 8'),
    Text('Item 9'),
    Text('Item 10'),
    Text('Item 11'),
    Text('Item 12'),
    Text('Item 13'),
    Text('Item 14'),
  ];

  List simpleList = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
    'Item 6',
    'Item 7',
    'Item 8',
    'Item 9',
    'Item 10',
    'Item 11',
    'Item 12',
    'Item 13',
    'Item 14',
  ];

  String itemController;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Listview Screen'),
          backgroundColor: Colors.blue,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'ListView',
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
              Container(
                height: 150,
                child: NotificationListener<OverscrollIndicatorNotification>(
                  onNotification: (OverscrollIndicatorNotification overscroll) {
                    overscroll.disallowGlow();
                    return;
                  },
                  child: ListView(
                    shrinkWrap: true,
                    children: itemList,
                  ),
                ),
              ),
              Container(
                height: 50,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(vertical: 10),
                  shrinkWrap: true,
                  children: itemList,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                'ListView Builder',
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
              Container(
                height: 150,
                child: NotificationListener<OverscrollIndicatorNotification>(
                  onNotification: (OverscrollIndicatorNotification overscroll) {
                    overscroll.disallowGlow();
                    return;
                  },
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: simpleList.length,
                    itemBuilder: (context, index) {
                      return Text(simpleList[index]);
                    },
                  ),
                ),
              ),
              Container(
                height: 50,
                child: NotificationListener<OverscrollIndicatorNotification>(
                  onNotification: (OverscrollIndicatorNotification overscroll) {
                    overscroll.disallowGlow();
                    return;
                  },
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: simpleList.length,
                    itemBuilder: (context, index) {
                      return Text(simpleList[index]);
                    },
                  ),
                ),
              ),
              Text(
                'ListView Separator',
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
              Container(
                height: 150,
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: simpleList.length,
                  itemBuilder: (context, index) {
                    return Text(simpleList[index]);
                  },
                  separatorBuilder: (context, index) {
                    if (index % 2 == 0) {
                      return Divider(
                        color: Colors.black,
                        height: 4,
                      );
                    }
                    return Divider(
                      color: Colors.red,
                      height: 4,
                    );
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 30,
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: simpleList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Text(simpleList[index]);
                  },
                  separatorBuilder: (context, index) {
                    if (index % 2 == 0) {
                      return VerticalDivider(
                        color: Colors.black,
                        width: 4,
                      );
                    }
                    return VerticalDivider(
                      color: Colors.red,
                      width: 4,
                    );
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'ListView Custom',
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
              Container(
                height: 150,
                child: ListView.custom(
                  shrinkWrap: true,
                  reverse: false,
                  childrenDelegate: MyCustomDelegate(),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 50,
                child: ListView.custom(
                  shrinkWrap: true,
                  reverse: false,
                  scrollDirection: Axis.horizontal,
                  childrenDelegate: MyCustomDelegate(),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List customList = [
  'Item 1',
  'Item 2',
  'Item 3',
  'Item 4',
  'Item 5',
  'Item 6',
  'Item 7',
  'Item 8',
  'Item 9',
  'Item 10',
  'Item 11',
  'Item 12',
  'Item 13',
  'Item 14',
];

class MyCustomDelegate extends SliverChildDelegate {
  @override
  int get estimatedChildCount => customList.length;

  @override
  Widget build(BuildContext context, int index) {
    return index < estimatedChildCount
        ? Container(
            padding: EdgeInsets.all(5),
            child: Text(customList[index]),
          )
        : null;
  }

  @override
  bool shouldRebuild(covariant SliverChildDelegate oldDelegate) {
    return true;
  }
}
