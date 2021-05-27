import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/constants.dart';
import 'package:flutter_project/services/firebase_services.dart';
import 'package:flutter_project/tabs/home_tab.dart';
import 'package:flutter_project/tabs/saved_tab.dart';
import 'package:flutter_project/tabs/search_tab.dart';
import 'package:flutter_project/widgets/bottom_tabs.dart';
import 'package:flutter_project/widgets/main_drawer.dart';

class HomePage extends StatefulWidget {
  static const routeName = 'home-page';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FirebaseServices _firebaseServices = FirebaseServices();

  PageController _tabsPageController;
  int _selectedTab = 0;

  @override
  void initState() {

    _tabsPageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _tabsPageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("LookGOOD")),
        body: Column(
          children: [
            Expanded(
              child: PageView(
                controller: _tabsPageController,
                onPageChanged: (num){
                  setState(() {
                    _selectedTab = num;
                  });
                },
                children: [
                  HomeTab(),
                  SearchTab()
                ],
              ),
            ),
            BottomTabs(
              selectedTab: _selectedTab,
              tabPressed: (num){
                _tabsPageController.animateToPage(
                    num,
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeOutCubic);
              },
            ),
          ],
        ) ,
        drawer: MainDrawer()
    );
  }
}
