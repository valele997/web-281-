import 'package:flutter/material.dart';
import 'dart:io';
import 'package:best_flutter_ui_templates/app_theme.dart';
import 'package:flutter/services.dart';
import 'navigation_home_screen.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
//import 'package:seges/pages/side_bar.dart';
import 'package:best_flutter_ui_templates/Principal.dart';
import 'package:flutter/widgets.dart';
import 'Principal.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]).then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mi App',
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.cyan[900],
        body: Stack(children: [
          bgcolor(),
          Container(
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Color.fromARGB(96, 7, 6, 6),
                      blurRadius: 25.0,
                      spreadRadius: 5.0,
                      offset: Offset(15.0, 15.0))
                ],
                borderRadius: BorderRadius.circular(20),
                color: Colors.blueGrey[50]),
            margin: EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 50),
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    height: 60,
                  ),
                  TextField(
                    controller: email,
                    decoration:
                        InputDecoration(hintText: "username@correo.com"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: password,
                    obscureText: true,
                    decoration: InputDecoration(hintText: "Password"),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 70),
                    width: 200,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10)),
                    child: FloatingActionButton(
                      child: Text(
                        "Login",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Principal()));
                      },
                    ),
                  ),
                  SizedBox(
                    height: 80,
                  ),
                  Text(
                    "Dont have an account? Sign Up",
                    style: TextStyle(
                      color: Colors.blueGrey,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),
          )
        ]));
  }
}

Widget bgcolor() {
  return Container(
    decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(
                "https://images.unsplash.com/photo-1492321936769-b49830bc1d1e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fGFycXVpdGVjdHVyYXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=600&q=60"),
            fit: BoxFit.cover)),
  );
}

/*Widget login() {
  var email;
  var password;
  return Container();
}*/
