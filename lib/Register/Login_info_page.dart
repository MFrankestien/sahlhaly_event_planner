import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sahlhaly_event_planner/Register/personal_Information.dart';
import 'package:sahlhaly_event_planner/utils/constants.dart';
import 'package:sahlhaly_event_planner/utils/size_config.dart';

import 'package:shared_preferences/shared_preferences.dart';

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
  String UserType;


  saveuser(String userid , String UserType) async {
    SharedPreferences preferences=await SharedPreferences.getInstance();
    preferences.setString("User", userid);
    preferences.setString("UserType", UserType);
  }
  getsaved()async{
    SharedPreferences preferences=await SharedPreferences.getInstance();
    var id=preferences.get("User");
    var UserType=preferences.getString("UserType");
    print(id);
    print(UserType);
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
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Stack(
              children: <Widget>[
                BackgroundWidget(size: size),
                BackButtonPop(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                    alignment: Alignment.center,
                    width: SizeConfig.screenWidth,
                    child: Form(
                      key: _formKey,
                      child: Column(children: <Widget>[
                        SizedBox(
                          height: 150.0,
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
                        Padding(
                          padding: const EdgeInsets.only(top: 50.0),
                          child: PageTitle(
                            titleText: 'login Information',
                            fontSize: 25.0,
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            validator: (val) =>
                                val.isEmpty ? 'Enter an email' : null,
                            onChanged: (val) {
                              setState(() => remail = val);
                            },
                            decoration: InputDecoration(
                              labelText: 'SignIn Email',
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                        PageTitle(
                          titleText: 'password Confirmation',
                          fontSize: 15.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
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
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                              ),
                              labelText: 'Password',
                              labelStyle: TextStyle(fontSize: 15.0),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
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
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                              ),
                              labelText: 'Confirm Password',
                              labelStyle: TextStyle(fontSize: 15.0),
                            ),
                          ),
                        ),
                        SizedBox(height: 12.0),
                        Text(
                          error,
                          style: TextStyle(color: Colors.red, fontSize: 14.0),
                        )
                      ]),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.navigate_next),
          backgroundColor: Colors.blueAccent,
          onPressed: () async {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => NamePage(userid: userid)));
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
}
