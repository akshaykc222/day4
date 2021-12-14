import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:seed_sales/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginProvider with ChangeNotifier {
  bool loading = false;
  Future<bool> loign(String username, String password) async {
    loading = true;
    notifyListeners();
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    final body = {
      'email': username,
      'password': password,
    };
    final jsonString = json.encode(body);
    final uri = Uri.https(baseUrl, '/api/v1/rest-auth/login/');
    final headers = {HttpHeaders.contentTypeHeader: 'application/json'};
    final response = await http.post(uri, headers: headers, body: jsonString);
    // print(response.body);
    try {
      Map<String, dynamic> data = json.decode(response.body);
      if (data.containsKey("key")) {
        log(data['key']);
        _prefs.setString('token', data['key']);
        loading = false;
        return true;
      } else {
        loading = false;
        return false;
      }
    } catch (e) {
      loading = false;
      return false;
    }
  }
}
