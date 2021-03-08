import 'package:benchworklogin/model/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    User user = User();
    List<String> userProvider =
        Provider.of<User>(context, listen: false).getUser();
    print(userProvider[0]);
    print('<<<<<<<<${user.getUser()}>>>>>>>>');
    return Scaffold(
      appBar: AppBar(
        title: Text('home'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('Name: ${user.getUser()[0]}'),
            Text('phone: ${user.getUser()[1]}')
          ],
        ),
      ),
    );
  }
}
