import 'package:benchworklogin/api/authapi.dart';
import 'package:flutter/material.dart';

import 'homepage.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _loginformkey = GlobalKey<FormState>();
  AuthService authService = AuthService();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _passController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _cnfPassController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('SIGNUP'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _loginformkey,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: _nameController,
                  validator: (value) {
                    if (value.length < 3) {
                      return 'Name should be of atleast 3 characters.';
                    } else
                      return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'Your Name',
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
                  controller: _phoneController,
                  keyboardType: TextInputType.numberWithOptions(),
                  validator: (value) {
                    if (value.length != 10) {
                      return 'Please Enter a Valid Phone Number.';
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
                  // obscureText: true,
                  controller: _passController,
                  validator: (value) {
                    if (value.length <= 5) {
                      return 'Password should be of minimum 5 characters.';
                    } else if (value.trim() != _cnfPassController.text.trim()) {
                      return 'Password not matched';
                    } else
                      return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'Password',
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
                  controller: _cnfPassController,
                  // obscureText: true,
                  validator: (value) {
                    if (value.trim() != _passController.text.trim()) {
                      return 'Password not matched';
                    } else
                      return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'Confirm Password',
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
                  color: Colors.red[600],
                  child: FlatButton(
                    child: Text(
                      'SignUp',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    onPressed: () {
                      FocusScopeNode currentFocus = FocusScope.of(context);
                      if (_loginformkey.currentState.validate()) {
                        if (!currentFocus.hasPrimaryFocus) {
                          currentFocus.unfocus();
                          authService.register(
                              _phoneController.text.trim(),
                              _passController.text.trim(),
                              _nameController.text.trim(),
                              context);
                        }
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
