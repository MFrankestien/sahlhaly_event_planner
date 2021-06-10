import 'package:flutter/material.dart';
import 'package:sahlhaly_event_planner/Register/select_gender_page.dart';
import 'package:sahlhaly_event_planner/utils/constants.dart';
import 'package:sahlhaly_event_planner/utils/size_config.dart';

import '../style.dart';


class NamePage extends StatefulWidget {

  String userid;

  NamePage({ this.userid});

  @override
  _NamePageState createState() => _NamePageState( userid);
}

class _NamePageState extends State<NamePage> {
  final _formKeyPI = GlobalKey<FormState>();
  String userid;
  String fName = '';
  String lName = '';
  String phone = '';

  _NamePageState(this.userid);

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF3F51b5),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            children: <Widget>[
              BackButtonPop(),
              SizedBox(
                height: 6.0,
              ),

            ],
          ),
          _topheader(),
          Expanded(
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: 32),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                  color: Colors.grey[50],
                ),
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[

                      Form(
                        key: _formKeyPI,
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 80, left: 50.0, right: 50.0, bottom: 20.0),
                              child: LinearProgressIndicator(
                                backgroundColor: Color(0xFFD7D7D7),
                                valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.green),
                                value: 0.7,
                              ),
                            ),
                            SizedBox(height: 15),
                            Container(
                              height: 56,
                              padding: EdgeInsets.fromLTRB(16, 3, 16, 6),
                              margin: EdgeInsets.all(8),
                              decoration: raisedDecoration,
                              child: Center(
                                child: TextFormField(
                                  validator: (val) =>
                                  val.isEmpty ? 'Enter First Name' : null,
                                  onChanged: (val) {
                                    setState(() => fName = val);
                                  },
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "First Name",
                                      hintStyle: TextStyle(
                                        color: Colors.black38,
                                      )),
                                ),
                              ),
                            ),
                            SizedBox(height: 30),
                            Container(
                              height: 56,
                              padding: EdgeInsets.fromLTRB(16, 3, 16, 6),
                              margin: EdgeInsets.all(8),
                              decoration: raisedDecoration,
                              child: Center(
                                child: TextFormField(
                                  validator: (val) =>
                                  val.isEmpty ? 'Enter Last Name' : null,
                                  onChanged: (val) {
                                    setState(() => lName = val);
                                  },
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Last Name",
                                      hintStyle: TextStyle(
                                        color: Colors.black38,
                                      )),
                                ),
                              ),
                            ),//last name
                            SizedBox(height: 30),

                            Container(
                              height: 56,
                              padding: EdgeInsets.fromLTRB(16, 3, 16, 6),
                              margin: EdgeInsets.all(8),
                              decoration: raisedDecoration,
                              child: Center(
                                child: TextFormField(
                                  validator: (val) =>
                                  val.isEmpty ? 'Enter Phone Number' : null,
                                  onChanged: (val) {
                                    setState(() => phone = val);
                                  },
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Phone',
                                      hintStyle: TextStyle(
                                        color: Colors.black38,
                                      )),
                                ),
                              ),
                            ),// Phone
                            SizedBox(height: 30),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),


                    ],
                  ),
                ),
              )),

        ],
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.navigate_next),
          backgroundColor: Color(0XFF3F51b5),
          onPressed: () {
            if (_formKeyPI.currentState.validate()) {
              print(fName);
              print(lName);
              print(phone);
              print(userid);
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SelectGender(
                      fname: fName,
                      lname: lName,
                      phone: phone,
                      userid: userid)));
            }
          }),
    );
  }
  _topheader() {
    return Padding(
      padding: EdgeInsets.only(left: 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            'Personal Information',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 28,
            ),
          ),

        ],
      ),
    );
  }
}
