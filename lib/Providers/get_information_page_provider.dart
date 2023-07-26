import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Database/database_service.dart';

class GetInformationProvider extends ChangeNotifier {
  DatabaseService databaService = DatabaseService();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController gender = TextEditingController();
  var urlDataPost;
  var urlDataGet;
  bool check = false;
  String id = '';
  postInformation(Function(bool) callback) async {
    var url = Uri.parse(
        "https://crudcrud.com/api/3d18a6eebc604d2a806a988ae1be051f/aswin");
    var response = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'name': name.text,
          'email': email.text,
          'mobile': mobile.text,
          'gender': gender.text
        }));
    urlDataPost = await jsonDecode(response.body);
    check = true;
    callback(check);
    notifyListeners();
  }
}
