import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserData with ChangeNotifier {
  List _userList = [];

  List get userList => _userList;

  Future getdata() async {
    var res = await http.get(
      Uri.parse('https://reqres.in/api/users?page=2'),
    );

    var jsondata = jsonDecode(res.body);
    _userList = jsondata['data'];
  }

  // Future getdtas() async {
  //   var ress = await http.get(
  //     Uri.parse('https://reqres.in/api/users/2'),
  //   );

}
