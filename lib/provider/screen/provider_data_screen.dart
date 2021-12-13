import 'package:flutter/material.dart';
import 'package:project_app/provider/imagedata.dart';
import 'package:project_app/provider/view_model/image_view_model.dart';
import 'package:provider/provider.dart';
import 'package:project_app/provider/image_provider.dart';

class ProviderDataScreen extends StatefulWidget {
  const ProviderDataScreen({Key key}) : super(key: key);

  @override
  ProviderDataScreenState createState() => ProviderDataScreenState();
}

class ProviderDataScreenState extends State<ProviderDataScreen> {
  List<ImageData> list = [];
  ImageViewModel model;
  ImageProviderAbc provider;

  @override
  void initState() {
    list = Provider.of<ImageProviderAbc>(context, listen: false).list;
    print("List $list");
    if (list.isEmpty) {
      callapi();
      // model.apiCall();
    }
    super.initState();
  }

  callapi() async {
    print("252");
    list = await Provider.of<ImageProviderAbc>(context, listen: false)
        .callRegister();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    model ?? (model = ImageViewModel(this));

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Provider Screen"),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Container(
              padding: EdgeInsets.all(10),
              child: ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) {
                  print(list[index].author);
                  return Column(
                    children: [
                      Text(list[index].author),
                    ],
                  );
                },
              )),
        ),
      ),
    );
  }
}
