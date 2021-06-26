
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sahlhaly_event_planner/utils/constants.dart';
Color facebookColor = Color(0xFF416BC1);
Color googleColor = Color(0xFFCF4333);
Color twitterColor = Color(0xFF08A0E9);

const mainTitleStyle = TextStyle(
  fontWeight: FontWeight.w700,
  color: Colors.white,
  fontSize: 32,
);

const mainSubtitleStyle = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w300,
  color: Colors.white,
);

const searchBarColor = Color(0XFF21243C);

var searchBarDecoration = BoxDecoration(
    color: searchBarColor,
    borderRadius: BorderRadius.circular(40),
    boxShadow: [
      BoxShadow(
        offset: Offset(0, 10),
        blurRadius: 15,
        color: Colors.black54,
      )
    ]);

var distanceBoxDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.only(
      bottomLeft: Radius.circular(20),
      bottomRight: Radius.circular(20),
    ),
    boxShadow: [
      BoxShadow(
        offset: Offset(0, 5),
        blurRadius: 5,
        spreadRadius: 5,
        color: searchBarColor.withOpacity(.2),
      )
    ]);


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
AppBar Review(context, {String titleText,String docid} ) {

  Widget customSearchBar = Text(
    titleText,
    style: TextStyle(
      fontSize: 25.0,
      color: Colors.white,
    ),
  );
  return AppBar(
    automaticallyImplyLeading: false,
    title: customSearchBar,
    actions: <Widget>[
      Hero(
        tag: 'profileImage',
        child: Padding(
          padding: const EdgeInsets.only(left:10.0,right: 10.0),
        ),
      ),
      IconButton(
        onPressed: () {
          Fluttertoast.showToast(
              msg: "The Cv Deleted Successfully",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 10,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 20.0
          );

        },
        icon: Icon(FontAwesomeIcons.trashAlt),
      ),

    ],
    elevation: 3,
  );
}
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
