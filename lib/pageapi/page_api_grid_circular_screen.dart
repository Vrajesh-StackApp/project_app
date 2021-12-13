import 'package:flutter/material.dart';
import 'package:project_app/pageapi/grid_widget.dart';
import 'package:project_app/pageapi/main_model.dart';
import 'package:project_app/pageapi/page_api_services.dart';

class PageApiGridCircularScreen extends StatefulWidget {
  const PageApiGridCircularScreen({Key key}) : super(key: key);

  @override
  _PageApiGridCircularScreenState createState() =>
      _PageApiGridCircularScreenState();
}

class _PageApiGridCircularScreenState extends State<PageApiGridCircularScreen> {
  PageApiServices pageApiServices = PageApiServices();
  int page = 1;
  MainModelList mainModel;
  List<MainModel> dataList = [];
  List<MainModel> itemList = [];
  int _index;

  ScrollController _controller = ScrollController();
  bool isLoading = false;

  @override
  void initState() {
    _getData(page);

    _controller.addListener(() {
      if (!isLoading &&
          _controller.position.pixels == _controller.position.maxScrollExtent) {
        setState(() {
          isLoading = true;
        });
      }
      /*else {
        setState(() {
          isLoading = false;
        });
      }*/
    });
    super.initState();
  }

  Future _getData(int page) async {
    dataList = await pageApiServices.getPageApiData(page);
    itemList.addAll(dataList);
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text("Pagination Api"),
      ),
      body: Stack(
        children: [
          GridView.builder(
            shrinkWrap: true,
            controller: _controller,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 4,
              mainAxisSpacing: 4,
            ),
            itemBuilder: (context, index) {
              _index = index;
              return GridWidget(
                itemList[index].id,
                itemList[index].author,
                itemList[index].downloadUrl,
              );
            },
            itemCount: itemList.length,
          ),
          if (_index == itemList.length - 1)
            Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                onPressed: () {
                  page++;
                  _getData(page);
                  setState(() {
                    isLoading = false;
                  });
                },
                child: Text("Load more"),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0.0),
                ),
              ),
            ),
        ],
      ),
    ));
  }
}
