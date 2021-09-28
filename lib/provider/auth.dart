import 'dart:convert';

import 'package:blocks/pages/Home.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Logins with ChangeNotifier {
  Future getApiCall(String email, String password, BuildContext context) async {
    final response = await http.post(
      Uri.parse('https://reqres.in/api/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "email": email,
        "password": password,
      }),
    );

    if (response.statusCode == 200) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Homes()));
      print("kalim");

      Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
      // final token = jsonDecode(response.body).token;
      print("kalim");
      // print(token);
      final SharedPreferences prefs = await _prefs;
      prefs.setString('token', 'token');
    } else {
      throw Exception(' wrong id and password ');
    }
  }
}
