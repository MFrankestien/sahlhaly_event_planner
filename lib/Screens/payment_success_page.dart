import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sahlhaly_event_planner/Routepage.dart';
import 'package:sahlhaly_event_planner/profile_details/personal_details.dart';



class PaySuccessPage extends StatefulWidget {
  String userid;

  PaySuccessPage({this.userid});

  @override
  _PaySuccessPageState createState() => _PaySuccessPageState();
}

class _PaySuccessPageState extends State<PaySuccessPage> {

  _PaySuccessPageState();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        body: ListView(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              child: Column(
                children: <Widget>[
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            IconButton(
                              icon: new Icon(Icons.arrow_back),
                              iconSize: 35.0,
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 70.0,
                        ),
                        Image(
                          image: AssetImage('assets/medal_badge.png'),
                          height: 200.0,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Congratulations',
                            style: TextStyle(
                              fontSize: 30.0,
                            ),
                          ),
                          SizedBox(
                            height: 30.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Text(
                              'Your Payment for this event has been compeleted.',
                              style: TextStyle(
                                fontSize: 20.0,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text('Please check your Email to find your ticket ',style: TextStyle(
                            fontSize: 20.0,
                          ),)

                        ],
                      )),
                      SizedBox(
                        height: 30.0,
                      ),
                      Container(
                        width: 360.0,
                        height: 70.0,
                        child: Column(
                          children: <Widget>[
                            GestureDetector(
                              onTap: () async {

                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            RoutePage()));

                              },
                              child: Card(
                                color: Color(0xFF2E64A4),
                                child: ListTile(
                                  leading: Icon(
                                    FontAwesomeIcons.home,
                                    color: Colors.white,
                                    size: 30.0,
                                  ),
                                  title: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 50.0),
                                      child: Text(
                                        'Home Page',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
