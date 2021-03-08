import 'package:benchworklogin/api/authapi.dart';
import 'package:flutter/material.dart';

import 'homepage.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _loginformkey = GlobalKey<FormState>();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _passController = TextEditingController();
  AuthService authService = AuthService();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('LOGIN'),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15.0, 25.0, 15.0, 10.0),
        child: Form(
          key: _loginformkey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _phoneController,
                keyboardType: TextInputType.numberWithOptions(),
                validator: (value) {
                  if (value.length != 10) {
                    return 'Please Enter a Valid Phone Number';
                  } else
                    return null;
                },
                decoration: InputDecoration(
                  hintText: 'Enter Your Phone',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      borderSide:
                          BorderSide(color: Colors.blueAccent, width: 3)),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                obscureText: true,
                controller: _passController,
                validator: (value) {
                  if (value.length <= 5) {
                    return 'Password should be of minimum 5 characters.';
                  } else
                    return null;
                },
                decoration: InputDecoration(
                  hintText: 'Enter Your Password',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      borderSide:
                          BorderSide(color: Colors.blueAccent, width: 3)),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: size.width * 0.6,
                color: Colors.blue[600],
                child: FlatButton(
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  onPressed: () {
                    FocusScopeNode currentFocus = FocusScope.of(context);
                    if (_loginformkey.currentState.validate()) {
                      if (!currentFocus.hasPrimaryFocus) {
                        currentFocus.unfocus();
                        authService.login(_phoneController.text.trim(),
                            _passController.text.trim(), context);
                      }
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
