import 'package:flutter/material.dart';
import 'package:project_app/pageapi/listtile_widget.dart';
import 'package:project_app/pageapi/main_model.dart';
import 'package:project_app/pageapi/page_api_services.dart';

class PageApiButtonScreen extends StatefulWidget {
  const PageApiButtonScreen({Key key}) : super(key: key);

  @override
  _PageApiButtonScreenState createState() => _PageApiButtonScreenState();
}

class _PageApiButtonScreenState extends State<PageApiButtonScreen> {
  PageApiServices pageApiServices = PageApiServices();
  int page = 1;
  MainModelList mainModel;
  List<MainModel> dataList = [];
  List<MainModel> itemList = [];

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
      } /*else {
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
      body: ListView.builder(
        shrinkWrap: true,
        controller: _controller,
        itemBuilder: (context, index) {
          if (index == itemList.length - 1) {
            return Center(
                child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: ElevatedButton(
                onPressed: (){
                  page++;
                  _getData(page);
                  setState(() {
                    isLoading = false;
                  });
                },
                child: Text("Load more"),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 10,vertical: 0.0),
                ),
              ),
            ));
          }
          return ListTileWidget(
            itemList[index].id,
            itemList[index].author,
            itemList[index].downloadUrl,
          );
        },
        itemCount: itemList.length,
      ),
    ));
  }
}
