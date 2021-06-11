
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sahlhaly_event_planner/LoginScreen.dart';
import 'package:sahlhaly_event_planner/auth.dart';
import 'package:sahlhaly_event_planner/reset_password.dart';
import 'package:sahlhaly_event_planner/splash_screen/animation_screen.dart';
import 'package:sahlhaly_event_planner/style.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
      ChangeNotifierProvider<Auth>(
    create: (_) => Auth(),
  child: MyApp(),));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Stack(
            children: <Widget>[
              Scaffold(
                  body: LoginScreen()
              ),
              IgnorePointer(
                  child: AnimationScreen(
                      color: Theme.of(context).accentColor
                  )
              )
            ]
        )
    );
  }


}