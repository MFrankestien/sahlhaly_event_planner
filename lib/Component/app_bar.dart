import 'package:flutter/material.dart';


AppBar buildAppBar(BuildContext context,
    {bool isTransparent = false, String title}) {
  return AppBar(
    iconTheme: IconThemeData(color: Color(0xFF5E5E5E)),
    backgroundColor: isTransparent ? Colors.transparent : Colors.white,
    elevation: 0,
    title: ! isTransparent
        ? Text(
            isTransparent ? "" : title,
            style: TextStyle(color: Color(0xFF3F4168)),
          )
        : null,
    centerTitle: true,
    actions: [
      IconButton(
        icon: ClipOval(child: Image.asset("assets/dance.jpg")),
        onPressed: () {},
      )
    ],
  );
}
