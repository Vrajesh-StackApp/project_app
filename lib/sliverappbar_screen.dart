import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SliverAppBarScreen extends StatefulWidget {
  const SliverAppBarScreen({Key key}) : super(key: key);

  @override
  _SliverAppBarScreenState createState() => _SliverAppBarScreenState();
}

class _SliverAppBarScreenState extends State<SliverAppBarScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              floating: false,
              snap: false,
              expandedHeight: 200,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  "Goa",
                  textScaleFactor: 1,
                ),
                background: Image.asset(
                  'assets/images/house.jpg',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SliverList(
              delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
                return ListTile(
                  leading: Container(
                    padding: EdgeInsets.all(8),
                    width: 100,
                    child: Placeholder(),
                  ),
                  title: Text(
                    "Place ${index + 1}",
                    textScaleFactor: 2,
                  ),
                );
              }, childCount: 20),
            ),
          ],
        ),
      ),
    );
  }
}
