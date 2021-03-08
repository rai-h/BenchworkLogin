import 'package:benchworklogin/login.dart';
import 'package:benchworklogin/model/user.dart';
import 'package:benchworklogin/signup.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [ChangeNotifierProvider<User>(create: (_) => User())],
        child: MaterialApp(
          routes: {
            '/home': (BuildContext context) => Home(),
          },
          title: 'BenchWork Login',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: MainPage(
            title: 'BenchWork',
          ),
        ));
  }
}

class MainPage extends StatefulWidget {
  MainPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: size.width * 0.6,
              color: Colors.blue[600],
              child: FlatButton(
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => Login()));
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: size.width * 0.6,
              color: Colors.red[600],
              child: FlatButton(
                child: Text('SignUp',
                    style: TextStyle(color: Colors.white, fontSize: 18)),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => SignUp()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
