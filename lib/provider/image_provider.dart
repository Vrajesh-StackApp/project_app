import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:project_app/provider/imagedata.dart';
import 'package:project_app/utils/string_utils.dart';

class ImageProviderAbc with ChangeNotifier {
  List<ImageData> list = [];

  Future<List<ImageData>> callRegister() async {
    var res;
    try {
      http.Response response = await http.get(Uri.parse(StringUtils.pageUrl));
      res = returnResponse(response);
      NewImageData imageList = NewImageData.fromJson(res);
      list = imageList.imageDataList;
      return imageList.imageDataList;
    } catch (e) {
      print(e.toString());
      throw 'No internet connection';
    }
  }

  returnResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        var _res = json.decode(response.body);
        return _res;
      case 400:
        throw 'Invalid request : ${response.body.toString()}';
      case 403:
        throw 'Unauthorised Request : ${response.body.toString()}';
      default:
        throw 'Error occured while communication with server' +
            ' with status code : ${response.statusCode}';
    }
  }
}
