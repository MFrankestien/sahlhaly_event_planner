
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sahlhaly_event_planner/Component/app_bar.dart';
import 'package:sahlhaly_event_planner/Component/draweradmin.dart';
import 'package:sahlhaly_event_planner/HomePage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Component/bottom_nav_bar.dart';
import 'Component/drawer.dart';
class RoutePage extends StatefulWidget {
  @override
  _RoutePageState createState() => _RoutePageState();
}

class _RoutePageState extends State<RoutePage> {
  PageController pageController;
  int pageIndex = 0;
  SharedPreferences preferences;
  String type;
  onPageChanged(int pageIndex) {
    setState(() {
      this.pageIndex = pageIndex;
    });
  }

  onItemSelected(int pageIndex) {
    pageController.animateToPage(
      pageIndex,
      duration: Duration(milliseconds: 100),
      curve: Curves.easeInOut,
    );
  }
  final FirebaseAuth auth = FirebaseAuth.instance;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future getusertype() async {
    User userid = auth.currentUser;

    var usertype=await _firestore.collection('Users').doc(userid.uid).get().then
      ((DocumentSnapshot) async {

        setState(() {
          type = DocumentSnapshot.data()['UserType'];
        });

      print("typeroute $type");
    });}
  @override
  void initState() {
    super.initState();
     getusertype();
    pageController = PageController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    getusertype();
    pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    if (type=="user"){
      return Scaffold(
        extendBodyBehindAppBar: true,
        drawer:Drawer(
          child:  MainDrawer()  ,
        )

        ,bottomNavigationBar: BottomNavBar(
        onItemSelected: onItemSelected,
        items: [
          BottomNavBarItem(
            icon: Icon(Icons.apps),
            title: Text('Home'),
            activeColor: Colors.red,
          ),
          BottomNavBarItem(
              icon: Icon(Icons.whatshot),
              title: Text('Hot Events'),
              activeColor: Colors.teal),

        ],
      ),
        appBar: buildAppBar(context,isTransparent: true),
        backgroundColor: Colors.white,
        body:PageView(
          controller: pageController,
          physics: NeverScrollableScrollPhysics(),
          onPageChanged: onPageChanged,
          children: [
            HomePage(),

          ],
        ),);

    }
    else{
      return Scaffold(
        extendBodyBehindAppBar: true,
        drawer:Drawer(
          child:  MainDrawera()  ,
        )

        ,bottomNavigationBar: BottomNavBar(
        onItemSelected: onItemSelected,
        items: [
          BottomNavBarItem(
            icon: Icon(Icons.apps),
            title: Text('Home'),
            activeColor: Colors.red,
          ),
          BottomNavBarItem(
              icon: Icon(Icons.whatshot),
              title: Text('Hot Events'),
              activeColor: Colors.teal),

        ],
      ),
        appBar: buildAppBar(context,isTransparent: true),
        backgroundColor: Colors.white,
        body:PageView(
          controller: pageController,
          physics: NeverScrollableScrollPhysics(),
          onPageChanged: onPageChanged,
          children: [
            HomePage(),

          ],
        ),);

    }

  }
}
