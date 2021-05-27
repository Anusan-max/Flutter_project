
import 'package:flutter/material.dart';
import 'package:flutter_project/screens/child_page.dart';
import 'package:flutter_project/screens/home_page.dart';
import 'package:flutter_project/screens/landing_page.dart';
import 'package:flutter_project/screens/login_page.dart';
import 'package:flutter_project/screens/mens_page.dart';
import 'package:flutter_project/screens/womens_page.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final appTitle = 'Drawer Demo';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      theme: ThemeData(

          accentColor: Color(0xFFFF1E00)
      ),
      routes: {
        '/': (_) => LandingPage(),
        HomePage.routeName : (_) => HomePage(),
        MensPage.routeName : (_) => MensPage(),
        WomensPage.routeName : (_) => WomensPage(),
        ChildPage.routeName : (_) => ChildPage(),
        LoginPage.routeName : (_) => LoginPage(),
        LandingPage.routerName : (_) => LandingPage()
      },

    );
  }
}

