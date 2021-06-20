
import 'package:flutter/material.dart';
import 'package:sahlhaly_event_planner/utils/constants.dart';
Color facebookColor = Color(0xFF416BC1);
Color googleColor = Color(0xFFCF4333);
Color twitterColor = Color(0xFF08A0E9);

var raisedDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(12),
    border: Border.all(
      color: Colors.grey[300],
    ),
    boxShadow: [
      BoxShadow(
        color: Colors.black26,
        offset: Offset(5, 2),
        blurRadius: 3.0,
        spreadRadius: 0.0,
      ),
      BoxShadow(
        color: Colors.white,
        offset: Offset(-5, -2),
        blurRadius: 3.0,
        spreadRadius: 0.0,
      ),
    ]);

final kH2WTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 20.0,
);

AppBar header2(context, {bool isAppTitle=false, String titleText,  actions}) {
  return AppBar(
    leading: BackButtonPop2(),
    backgroundColor: Color(0XFF3F51b5),
    title: Text(isAppTitle ? 'Job Portal' : titleText,
      overflow: TextOverflow.ellipsis,
    ),
    actions: actions,
    centerTitle: true,
  );
}
