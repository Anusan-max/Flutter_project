import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/constants.dart';
import 'package:flutter_project/screens/cart_page.dart';
import 'package:flutter_project/services/firebase_services.dart';

class CustomActionBar extends StatelessWidget {
  final String title;
  final bool hasBackArrow;
  final bool hasTitle;
  final bool hasBackground;
  CustomActionBar({this.title, this.hasBackArrow, this.hasTitle, this.hasBackground});

  FirebaseServices _firebaseServices = FirebaseServices();

  final CollectionReference _usersRef = FirebaseFirestore
      .instance
      .collection("Users");

  User _user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    bool _hasBackArrow = hasBackArrow ?? false;
    bool _hasTitle = hasTitle ?? true;
    bool _hasBackGround = hasBackground ?? true;



    return Container(
      decoration: BoxDecoration(
          gradient: _hasBackGround ? LinearGradient(
            colors: [
              Colors.white,
              Colors.white.withOpacity(0),
            ],
            begin: Alignment(0,0),
            end: Alignment(0,1),
          ): null
      ),
      padding: EdgeInsets.only(
        top: 56.0,
        left: 24.0,
        right: 24.0,
        bottom: 42.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if(_hasBackArrow)
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                width: 42.0,
                height: 42.0,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                alignment: Alignment.center,

                child: Image(
                  image: AssetImage(
                      "assets/images/back_arrow.png"
                  ),
                  color: Colors.white,
                  width: 16.0,
                  height: 16.0,
                ),
              ),
            ),
          if(_hasTitle)
            Text(
              title ?? "Action Bar",
              style: Constants.boldHeading,
            ),
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder:(context) => CartPage(),
              ));
            } ,
            child: Container(
              width: 42.0,
              height: 42.0,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(8.0),
              ),
              alignment: Alignment.center,
              child: StreamBuilder(
                stream: _usersRef.doc(_user.uid).collection("Cart").snapshots(),
                builder: (context, snapshot){
                  int _totalItems = 0;

                  if(snapshot.connectionState == ConnectionState.active){
                    List _documents = snapshot.data.docs;
                    _totalItems = _documents.length;
                  }

                  return  Text(
                      "$_totalItems" ?? "0",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      )
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
