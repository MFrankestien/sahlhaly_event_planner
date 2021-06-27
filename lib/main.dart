import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sahlhaly_event_planner/models/user.dart';
import 'package:sahlhaly_event_planner/services/auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'Screens/splash_screen/animation_screen.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
      MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<AppUser>.value(
      value: AuthService().user,
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: IgnorePointer(
            child: Material(
              type: MaterialType.transparency,
              child: AnimationScreen(
                  color: Theme.of(context).accentColor
              ),
            )
        )
      ),
    );
  }
}
