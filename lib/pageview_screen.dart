import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PageViewScreen extends StatefulWidget {
  const PageViewScreen({Key key}) : super(key: key);

  @override
  _PageViewScreenState createState() => _PageViewScreenState();
}

class _PageViewScreenState extends State<PageViewScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('PageView Screen'),
          backgroundColor: Colors.blue,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "PageView",
                style: TextStyle(color: Colors.red),
              ),
              Container(
                height: 200,
                child: PageView(
                  scrollDirection: Axis.vertical,
                  physics: ScrollPhysics(),
                  children: [
                    Container(
                      alignment: Alignment.center,
                      color: Colors.red,
                      child: Text(
                        "1",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      color: Colors.green,
                      child: Text(
                        "2",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      color: Colors.blue,
                      child: Text(
                        "3",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "PageView Builder",
                style: TextStyle(color: Colors.red),
              ),
              Container(
                height: 200,
                child: PageView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: pageList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      alignment: Alignment.center,
                      color: pageList[index].color,
                      child: Text(
                        pageList[index].page,
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "PageView Custom",
                style: TextStyle(color: Colors.red),
              ),
              Container(
                height: 200,
                child: PageView.custom(
                  physics: BouncingScrollPhysics(),
                  childrenDelegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      Color color;
                      if (index % 3 == 0) {
                        color = Colors.red;
                      } else if (index % 3 == 1) {
                        color = Colors.green;
                      } else {
                        color = Colors.blue;
                      }

                      return Container(
                        alignment: Alignment.center,
                        color: color,
                        child: Text(
                          pageList[index].page,
                          style: TextStyle(color: Colors.white),
                        ),
                      );
                    },
                    childCount: pageList.length,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<PageList> pageList = [
  PageList("1", Colors.red),
  PageList("2", Colors.green),
  PageList("3", Colors.blue),
  PageList("4", Colors.yellow),
  PageList("5", Colors.red),
];

class PageList {
  String page;
  Color color;

  PageList(this.page, this.color);
}
