import 'dart:convert';

import 'package:http/http.dart';
import 'package:project_app/provider/services/base_services.dart';
import 'package:http/http.dart' as http;

class ImageDataService extends BaseServices {
  @override
  getResponse() async {
    var res;
    try {
      http.Response response = await http.get(Uri.parse(imageBaseUrl));
      res = returnResponse(response);
      return res;
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
