import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sahlhaly_event_planner/Register/personal_Information.dart';
import 'package:sahlhaly_event_planner/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sahlhaly_event_planner/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../style.dart';

class PasswordPage extends StatefulWidget {



  @override
  _PasswordPageState createState() => _PasswordPageState();
}

class _PasswordPageState extends State<PasswordPage> {
  String userid;

  _PasswordPageState();

  final _formKey = GlobalKey<FormState>();

  bool passwordVisible;
  bool passwordVisibleConfirm;
  String remail;
  String rpassword;
  String repassword;
  String error = '';
  final AuthService auth = AuthService();


  saveuser(String userid , String UserType) async {
    SharedPreferences preferences=await SharedPreferences.getInstance();
    preferences.setString("User", userid);

  }
  getsaved()async{
    SharedPreferences preferences=await SharedPreferences.getInstance();
    var id=preferences.get("User");
    print(id);

  }

  @override
  void initState() {
    // TODO: implement initState
    passwordVisible = false;
    passwordVisibleConfirm = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Color(0XFF3F51b5),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: <Widget>[
                BackButtonPop(),
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
                          key: _formKey,
                          child: Column(children: <Widget>[
                            SizedBox(
                              height: 50.0,
                            ),
                            Padding(
                              padding:
                              const EdgeInsets.only(left: 50.0, right: 50.0),
                              child: LinearProgressIndicator(
                                backgroundColor: Color(0xFFD7D7D7),
                                valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.green),
                                value: 0.3,
                              ),
                            ),

                            SizedBox(
                              height: 30,
                            ),
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
                                    setState(() => remail = val);
                                  },
                                  decoration: InputDecoration(

                                      border: InputBorder.none,
                                      hintText: 'SignIn Email',
                                      hintStyle: TextStyle(
                                        color: Colors.black38,
                                      )),
                                ),
                              ),
                            ),
                            PageTitle(
                              titleText: 'password Confirmation',
                              fontSize: 15.0,
                            ),
                            Container(
                              height: 56,
                              padding: EdgeInsets.fromLTRB(16, 3, 16, 6),
                              margin: EdgeInsets.all(8),
                              decoration: raisedDecoration,
                              child: Center(
                                child: TextFormField(
                                  validator: (val) => val.length < 6
                                      ? 'Enter a password 6+ chars long'
                                      : null,
                                  onChanged: (val) {
                                    setState(() => rpassword = val);
                                  },
                                  obscureText: !passwordVisible,
                                  decoration: InputDecoration(
                                      suffixIcon: IconButton(
                                        icon: Icon(passwordVisible
                                            ? Icons.visibility
                                            : Icons.visibility_off),
                                        onPressed: () {
                                          setState(() {
                                            passwordVisible = !passwordVisible;
                                          });
                                        },
                                      ),
                                      border: InputBorder.none,
                                      hintText: 'Password',
                                      hintStyle: TextStyle(
                                        color: Colors.black38,
                                      )),
                                ),
                              ),// password
                            ),//password

                            Container(
                              height: 56,
                              padding: EdgeInsets.fromLTRB(16, 3, 16, 6),
                              margin: EdgeInsets.all(8),
                              decoration: raisedDecoration,
                              child: Center(
                                child: TextFormField(
                                  validator: (val) =>
                                  val != rpassword ? 'not match' : null,
                                  onChanged: (val) {
                                    setState(() => repassword = val);
                                  },
                                  obscureText: !passwordVisibleConfirm,
                                  decoration: InputDecoration(
                                      suffixIcon: IconButton(
                                        icon: Icon(passwordVisibleConfirm
                                            ? Icons.visibility
                                            : Icons.visibility_off),
                                        onPressed: () {
                                          setState(() {
                                            passwordVisibleConfirm =
                                            !passwordVisibleConfirm;
                                          });
                                        },
                                      ),
                                      border: InputBorder.none,
                                      hintText: 'Confirm Password',
                                      hintStyle: TextStyle(
                                        color: Colors.black38,
                                      )),
                                ),
                              ),
                            ),// confirm pass
                            SizedBox(height: 12.0),

                            Text(
                              error,
                              style: TextStyle(color: Colors.red, fontSize: 14.0),
                            )
                          ]),
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
          onPressed: () async {
          if (_formKey.currentState.validate()) {
            print(remail);
            print(rpassword);
            print(repassword);

              dynamic result = await auth.registerWithEmailAndPassword(
            remail.trim(), rpassword.toLowerCase());
            if (result == null) {
            setState(() {
            error = 'Please supply a valid email';
            });
            } else {
              await AuthService(uid: result.uid)
                  .updateUserData('Complete your info', 'Complete your info', 'Complete your info', 'Complete your info','Complete your info');
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NamePage(userid: result.uid)));

    }



    }

           /* if (_formKey.currentState.validate()) {
              dynamic result = await _auth.registerWithEmailAndPassword(
                  remail.trim(), rpassword.toLowerCase());
              if (result == null) {
                setState(() {
                  error = 'Please supply a valid email';
                });
              } else {
                if (comefrom == true) {
                  userid = result.uid;
                  UserType='Jobseeker';
                  saveuser(userid, UserType);
                  await DatabaseService(uid: result.uid)
                      .updateUserData('job', 'seeker', 'Jobseeker', 'nodata');
                 getsaved();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SkillPage(userid: userid)));
                } else {
                  userid = result.uid;
                  UserType='Firm';
                  saveuser(userid, UserType);
                  await DatabaseService(uid: result.uid)
                      .updateFirmData('firm', 'Side', '326262', 'Firm');
                getsaved();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FirmNamePage(
                                userid: userid,
                              )));
                }
              }
            }*/
          },
        ));
  }
  _topheader() {
    return Padding(
      padding: EdgeInsets.only(left: 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            'login Information',
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
