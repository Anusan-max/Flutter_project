import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/screens/child_page.dart';
import 'package:flutter_project/screens/home_page.dart';
import 'package:flutter_project/screens/mens_page.dart';
import 'package:flutter_project/screens/womens_page.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            title: Text('Home'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
              Navigator.of(context).pushNamed(HomePage.routeName);
            },
          ),
          ListTile(
            title: Text('Men'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
              Navigator.of(context).pushNamed(MensPage.routeName);

            },
          ),
          ListTile(
            title: Text('Women'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
              Navigator.of(context).pushNamed(WomensPage.routeName);
            },
          ),
          ListTile(
            title: Text('Child'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
              Navigator.of(context).pushNamed(ChildPage.routeName);
            },
          ),
        ],
      ),
    );
  }
}