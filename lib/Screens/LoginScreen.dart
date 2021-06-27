import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sahlhaly_event_planner/Register/Login_info_page.dart';
import 'package:sahlhaly_event_planner/Routepage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Register/reset_password.dart';
import '../Component/style.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email = '';
  String password = '';
  String error = '';
  final _formKey = GlobalKey<FormState>();
  final FirebaseAuth auth = FirebaseAuth.instance;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String type,id;


  getusertype() async{
   User userid = await auth.currentUser;
    id=userid.uid;
    var usertype=await _firestore.collection('Users').doc(userid.uid).get().then
      ((DocumentSnapshot) async {
      type = DocumentSnapshot.data()['UserType'];
      SharedPreferences preferences=await SharedPreferences.getInstance();
      preferences.setString("id", id);
      preferences.setString("UserType",DocumentSnapshot.data()['UserType'] );
      print("type $type");
    });}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF3F51b5),

      // persist create account link at the bottom of screen
      bottomNavigationBar: _createAccountLink(),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 70,
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
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 40),
                        _labelText('Email:'),
                    Container(
                      height: 56,
                      padding: EdgeInsets.fromLTRB(16, 3, 16, 6),
                      margin: EdgeInsets.all(8),
                      decoration: raisedDecoration,
                      child: Center(
                        child: TextFormField(
                          validator: (val) =>
                          val.isEmpty ? 'Enter an email' : null,
                          onChanged: (val) {
                            setState(() => email = val);
                          },

                          decoration: InputDecoration(
                              border: InputBorder.none,

                              hintText: 'Enter Your Email',
                              hintStyle: TextStyle(
                                color: Colors.black38,
                              )),
                        ),
                      ),
                    ),// email
                        SizedBox(height: 16),
                        _labelText('Password:'),
                        Container(
                          height: 56,
                          padding: EdgeInsets.fromLTRB(16, 3, 16, 6),
                          margin: EdgeInsets.all(8),
                          decoration: raisedDecoration,
                          child: Center(
                            child: TextFormField(
                              obscureText: true,
                              validator: (val) => val.length < 6
                                  ? 'Enter a password 6+ chars long'
                                  : null,
                              onChanged: (val) {
                                setState(() => password = val);
                              },

                              decoration: InputDecoration(
                                  border: InputBorder.none,

                                  hintText: 'Password',
                                  hintStyle: TextStyle(
                                    color: Colors.black38,
                                  )),
                            ),
                          ),
                        ),// password,
                        SizedBox(height: 12),
                        Align(
                          alignment: Alignment.centerRight,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ResetPage()));
                            },
                            child: Text(
                              'Forgot Password ?',
                              style: TextStyle(
                                color: Colors.blue[900],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          error,
                          style: TextStyle(color: Colors.red, fontSize: 14.0),
                        ),
                        SizedBox(height: 20),
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            height: 46,
                            width: 160,
                            child: RaisedButton(
                              onPressed: () async {
                                if (_formKey.currentState.validate()) {
                                 try{
                                   dynamic result =
                                   await auth.signInWithEmailAndPassword(email: email.trim(), password: password.toLowerCase());
                                   await getusertype().then(
                                       Navigator.pushReplacement(
                                           context,
                                           MaterialPageRoute(
                                               builder: (context) => RoutePage()))

                                   );



                                 }catch(e){
                                   print(e);
                                   if (e!=null){
                                     setState(() {
                                       error =
                                       'Could not sign in with those credentials wrong Email or Password';
                                     });
                                   }
                                 }


                                }
                              },
                              child: Text(
                                'Login',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              color: Color(0XFF303f9f),
                              textColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 12),

                      ],
                    ),
                  ),
                ),
              )),
        ],
      ),
    );

  }

  _createAccountLink() {
    return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PasswordPage()));
        },
      child: Container(
        color: Colors.grey[50],
        padding: EdgeInsets.only(bottom: 16),
        height: 60,
        child: Center(
          child: Text(
            'Don\'t have account ? Sign Up Now',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: facebookColor,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }

  //button to login in using scial media,



  _labelText(title) {
    return Padding(
      padding: EdgeInsets.only(left: 24),
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          color: Colors.black,
          fontSize: 16,
        ),
      ),
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
            'Login\nWith Your\nAccount',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 28,
            ),
          ),
          Image.asset(
            'assets/gbimage.png',
            height: 170,
            fit: BoxFit.fitHeight,
          )
        ],
      ),
    );
  }
}

