import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GreedViewScreen extends StatefulWidget {
  const GreedViewScreen({Key key}) : super(key: key);

  @override
  _GreedViewScreenState createState() => _GreedViewScreenState();
}

class _GreedViewScreenState extends State<GreedViewScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('GridView Screen'),
          backgroundColor: Colors.blue,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'GridView Count',
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
              GridView.count(
                padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                physics: AlwaysScrollableScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: 4,
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
                children: List.generate(choices.length, (index) {
                  return Container(
                    color: Colors.blue,
                    alignment: Alignment.center,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          choices[index].icon,
                          size: 30,
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          choices[index].title,
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  );
                }),
              ),
              Text(
                'GridView Builder',
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
              GridView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                itemCount: choices.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 4,
                  mainAxisSpacing: 4,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    color: Colors.blue,
                    alignment: Alignment.center,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          choices[index].icon,
                          size: 30,
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          choices[index].title,
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  );
                },
              ),
              Text(
                'GridView Extent',
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
              GridView.extent(
                shrinkWrap: true,
                mainAxisSpacing: 4,
                crossAxisSpacing: 4,
                maxCrossAxisExtent: 100,
                padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                children: List.generate(choices.length, (index) {
                  return Container(
                    color: Colors.blue,
                    alignment: Alignment.center,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          choices[index].icon,
                          size: 30,
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          choices[index].title,
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  );
                }),
              ),
              Text(
                'GridView Custom',
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
              GridView.custom(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 4,
                ),
                childrenDelegate: SliverChildListDelegate(
                  choices.map((e) {
                    return Container(
                      color: Colors.blue,
                      alignment: Alignment.center,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            e.icon,
                            size: 30,
                            color: Colors.white,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            e.title,
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
              GridView(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 4,
                  mainAxisSpacing: 4,
                  crossAxisCount: 3,
                ),
                children: List.generate(choices.length, (index) {
                  return Container(
                    color: Colors.blue,
                    alignment: Alignment.center,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          choices[index].icon,
                          size: 30,
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          choices[index].title,
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Choice {
  const Choice({this.title, this.icon});
  final String title;
  final IconData icon;
}

List<Choice> choices = const <Choice>[
  Choice(title: 'Home', icon: Icons.home),
  Choice(title: 'Contact', icon: Icons.contacts),
  Choice(title: 'Map', icon: Icons.map),
  Choice(title: 'Phone', icon: Icons.phone),
  Choice(title: 'Camera', icon: Icons.camera_alt),
  Choice(title: 'Setting', icon: Icons.settings),
  Choice(title: 'Album', icon: Icons.photo_album),
  Choice(title: 'WiFi', icon: Icons.wifi),
];
