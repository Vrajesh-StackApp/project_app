import 'package:flutter/material.dart';
import 'package:project_app/pageapi/listtile_widget.dart';
import 'package:project_app/pageapi/main_model.dart';
import 'package:project_app/pageapi/page_api_services.dart';

class PageApiCircularScreen extends StatefulWidget {
  const PageApiCircularScreen({Key key}) : super(key: key);

  @override
  _PageApiCircularScreenState createState() => _PageApiCircularScreenState();
}

class _PageApiCircularScreenState extends State<PageApiCircularScreen> {
  PageApiServices pageApiServices = PageApiServices();
  int page = 1;
  MainModelList mainModel;
  List<MainModel> dataList = [];
  List<MainModel> itemList = [];

  ScrollController _controller = ScrollController();
  bool isLoading = false;

  @override
  void initState() {
    _getData();

    _controller.addListener(() {
      if (!isLoading &&
          _controller.position.pixels == _controller.position.maxScrollExtent) {
        page++;
        _getData();
        setState(() {
          isLoading = true;
        });
      } else {
        setState(() {
          isLoading = false;
        });
      }
    });
    super.initState();
  }

  Future _getData() async {
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
              padding: const EdgeInsets.all(20.0),
              child: CircularProgressIndicator(),
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
