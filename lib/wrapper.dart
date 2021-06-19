
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sahlhaly_event_planner/LoginScreen.dart';

import 'models/user.dart';



class Wrapper extends StatelessWidget {

var id,UserType;

Wrapper({this.id, this.UserType});

@override
  Widget build(BuildContext context) {
  final user = Provider.of<AppUser>(context);
  print(user);

    // return either the Home or Authenticate widget
    if (user == null) {
      print(user);
      print('hi jobs');
      return CircularProgressIndicator();
    }
    else {

      return LoginScreen();

      }



  }
}
