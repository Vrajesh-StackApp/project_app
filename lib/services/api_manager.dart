import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:project_app/services/people.dart';
import 'package:project_app/utils/string_utils.dart';

class ApiManager {
  Future<Response> _loadAsPeopleApi() async {
    Response response = await http.get(Uri.parse("${StringUtils.url}people/1"));
    return response;
  }

  Future<People> loadPeople() async {
    Response response = await _loadAsPeopleApi();

    if (response.statusCode == HttpStatus.ok) {
      // print(response.body);
      final jsonResponse = jsonDecode(response.body);

      People people = People.fromJson(jsonResponse);

      return people;
    } else {
      print('Error');
    }

    return null;
  }

  /*Future<String> _loadAsPeopleAssets() async {
    return await rootBundle.loadString('assets/people.json');
  }

  Future<People> loadPeople() async {
    String jsonString = await _loadAsPeopleAssets();
    final jsonResponse = jsonDecode(jsonString);

    print("Json response :- $jsonResponse");

    People people = People.fromJson(jsonResponse);

    print("Api Manager ${people.birthYear}");
    return people;
  }*/
}
