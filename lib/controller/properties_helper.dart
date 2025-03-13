
import 'dart:convert';

import 'package:EWC/models/index.dart';

import 'package:http/http.dart' as http;

const url = "https://fituniverse.com/EWC/api/";

class GetProperty{
   String getPath() {
    return url + "PropertiesDetails";
  }

  Future<List<Propertyitem>> getProperties() async {
    final res = await http.get(getPath());

    if (res.statusCode == 200) {
      var json = jsonDecode(res.body);
      List data = json['properties'];
      return data.map((propertylist) => new Propertyitem.fromJson(propertylist)).toList();
    } else {
      throw Exception('Failed to fetch data');
    }
  }
}