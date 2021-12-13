import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_app/services/api_manager.dart';
import 'package:project_app/services/people.dart';

class JsonParserScreen extends StatefulWidget {
  const JsonParserScreen({Key key}) : super(key: key);

  @override
  _JsonParserScreenState createState() => _JsonParserScreenState();
}

class _JsonParserScreenState extends State<JsonParserScreen> {
  People people;
  ApiManager apiManager = ApiManager();
  bool isProgress = false;

  Future getApiData() async {
    people = await apiManager.loadPeople();
    isProgress = false;
    print("False :- $isProgress");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('Json Parser'),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: ElevatedButton.icon(
                    onPressed: () async {
                      setState(() {
                        isProgress = true;
                      });
                      print("True :- $isProgress");
                      await getApiData();
                    },
                    icon: Icon(Icons.touch_app),
                    style: ElevatedButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    ),
                    label: Text(
                      'Click here',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'Roboto slab',
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                if (isProgress) CircularProgressIndicator(),
                if (people != null)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(people.name),
                      Text(people.gender),
                      Text(people.mass),
                      Text(people.birthYear),
                      Text(people.height),
                      Text(people.homeWorld),
                      Text(people.eyeColor),
                      Text(people.skinColor),
                      ListView.builder(
                          shrinkWrap: true,
                          itemCount: people.filmsList.length,
                          itemBuilder: (context, index) {
                            return Text(
                              people.filmsList[index].toString(),
                              textAlign: TextAlign.center,
                            );
                          }),
                      ListView.builder(
                          shrinkWrap: true,
                          itemCount: people.vehicleList.length,
                          itemBuilder: (context, index) {
                            return Text(
                              people.vehicleList[index].toString(),
                              textAlign: TextAlign.center,
                            );
                          }),
                      ListView.builder(
                          shrinkWrap: true,
                          itemCount: people.starshipsList.length,
                          itemBuilder: (context, index) {
                            return Text(
                              people.starshipsList[index].toString(),
                              textAlign: TextAlign.center,
                            );
                          }),
                    ],
                  )
              ],
            ),
          ),
          isProgress ? Center(child: CircularProgressIndicator()) : Container(),
        ],
      ),
    ));
  }
}
