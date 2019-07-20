import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:slug/entity/sport_details.dart';
import 'dart:convert';

class Func {
  List<SportDetails> handleData(var response) {
    List<SportDetails> data = new List<SportDetails>();
    List<dynamic> list = json.decode(response.body);
    for (int i = 0; i < list.length; i++) {
      SportDetails sportDetails = new SportDetails();
      try {
        if (list[i]['result'] != null &&
            list[i]['desc'] != null &&
            list[i]['name'] != null) {
          sportDetails.result = list[i]['result'];
          sportDetails.desc = list[i]['desc'];
          sportDetails.name = list[i]['name'];
          data.add(sportDetails);
        }
      } catch (e) {}
    }
    return data;
  }

  Future<List<SportDetails>> getDetails(String date) async {
    print(date);
    List<SportDetails> s = new List<SportDetails>();
    final response = await http.get('http://demo1738540.mockable.io/api');
    if (response.statusCode == 200) {
      List<SportDetails> res = handleData(response);
      return res;
    } else {
      throw Exception('Failed to load post');
    }
  }
}
