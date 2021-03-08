import 'package:flutter/cupertino.dart';

class User extends ChangeNotifier {
  String _name;
  String _phone;

  getUser() {
    return [_name, _phone];
  }

  setUser(name, phone) {
    _name = name;
    _phone = phone;
    notifyListeners();
  }
}
