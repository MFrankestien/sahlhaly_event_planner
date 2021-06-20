import 'package:flutter/material.dart';
import 'package:sahlhaly_event_planner/Component/app_bar.dart';
import 'package:sahlhaly_event_planner/HomePage.dart';
import 'Component/bottom_nav_bar.dart';
import 'Component/drawer.dart';
class Route extends StatefulWidget {
  @override
  _RouteState createState() => _RouteState();
}

class _RouteState extends State<Route> {
  PageController pageController;
  int pageIndex = 0;
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

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      drawer: Drawer(
        child: MainDrawer(),
      ),bottomNavigationBar: BottomNavBar(
      onItemSelected: onItemSelected,
      items: [
        BottomNavBarItem(
          icon: Icon(Icons.apps),
          title: Text('Home'),
          activeColor: Colors.red,
        ),
        BottomNavBarItem(
            icon: Icon(Icons.whatshot),
            title: Text('Hot Jobs'),
            activeColor: Colors.teal),
        BottomNavBarItem(
            icon: Icon(Icons.ac_unit),
            title: Text('More'),
            activeColor: Colors.blueGrey),
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
