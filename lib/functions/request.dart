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
        sportDetails.sport = list[i]['sport'];
        sportDetails.venue = list[i]['venue'];
        sportDetails.uni1 = list[i]['uni1'];
        sportDetails.uni2 = list[i]['uni2'];
        sportDetails.winUni = list[i]['winUni'];
        sportDetails.picUrl = list[i]['picUrl'];
        sportDetails.comment = list[i]['comment'];
        data.add(sportDetails);
      } catch (e) {}
    }
    return data;
  }

  Future<List<SportDetails>> getDetails(String date) async {
    print(date);
//    String link = "http://192.248.50.234/slugandroidapi.php";
    String link = "http://demo1738540.mockable.io/api";
    link = link + "?date=" + date;
    print(link);
    List<SportDetails> s = new List<SportDetails>();
    final response = await http.get(link);
    if (response.statusCode == 200) {
      List<SportDetails> res = handleData(response);
      return res;
    } else {
      throw Exception('Failed to load post');
    }
  }
}
