import 'dart:convert';
import 'package:benchworklogin/model/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../homepage.dart';

class AuthService {
  User user = User();
  Future<dynamic> register(
      String phone, String password, String name, context) async {
    var url = Uri.http('192.168.0.181:3000', '/signup');
    try {
      var res = await http.post(
        url,
        body: json.encode({'phone': phone, 'password': password, 'name': name}),
        headers: {"Content-Type": "application/json"},
      );
      print(res.body);
      var response = json.decode(res.body);
      if (response['success']) {
        user.setUser(response['name'], response['phone']);
        Navigator.popUntil(context, ModalRoute.withName('/home'));
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) => Home()));
      }
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> login(String phone, String password, context) async {
    print('object');
    var url = Uri.http('192.168.0.181:3000', '/login');
    try {
      var res = await http.post(
        url,
        body: json.encode({'phone': phone, 'password': password}),
        headers: {"Content-Type": "application/json"},
      );
      var response = json.decode(res.body);
      print(response);
      if (response['success']) {
        user.setUser(response['name'], response['phone']);
        print(user.getUser());
        // print(response['name']);
        // print(response['phone']);
        Navigator.popUntil(context, ModalRoute.withName('/home'));
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) => Home()));
      }
    } catch (e) {
      print(e);
    }
  }
}
