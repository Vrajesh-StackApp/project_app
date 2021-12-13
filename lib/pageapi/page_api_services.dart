import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:project_app/pageapi/main_model.dart';
import 'package:project_app/utils/string_utils.dart';

class PageApiServices {
  static int itemCount = 10;

  Future<Response> _apiCalling(int page) async {
    http.Response response = await http.get(
        Uri.parse("${StringUtils.pageUrl}?page=$page&limit=$itemCount"));
    return response;
  }

  Future getPageApiData(int page) async {
    try {
      http.Response response = await _apiCalling(page);

      if (response.statusCode == HttpStatus.ok) {
        final jsonResponse = jsonDecode(response.body);

        MainModelList mainModel = MainModelList.fromJson(jsonResponse);

        return mainModel.imageDataList;
      } else {
        print("Failed");
      }
    } catch (e) {
      print(e);
    }
  }
}
