import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sahlhaly_event_planner/style.dart';

import 'package:sahlhaly_event_planner/utils/constants.dart';

class ResetPage extends StatefulWidget {
  @override
  _ResetPageState createState() => _ResetPageState();
}

class _ResetPageState extends State<ResetPage> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  // text field state
  String email = '';
  String warning;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0XFF3F51b5),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Stack(
            children: [
              BackButtonPop(),
            ],
          ),

          SizedBox(
            height: 40,
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
                      SizedBox(height: 20),
                      _labelText('Email:'),
                      Form(
                        key: _formKey,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: Column(
                            children: <Widget>[


                              _inputTextField('example@email.com', false),
                              SizedBox(height: 30),
                              GestureDetector(
                                onTap: () {
                                  if (_formKey.currentState.validate()) {
                                    warning =
                                    "A password reset link has been sent to $email";
                                    submit();
                                  }
                                },
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                    height: 46,
                                    width: 160,
                                    child: RaisedButton(
                                      onPressed: () {
                                        print('reset');
                                        showAlert();
                                      },
                                      child: Text(
                                        'Reset',
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
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      showAlert(),


                    ],
                  ),
                ),
              )),



        ],
      ),
    );
  }
  _inputTextField(hintText, bool obscuretext) {
    return Container(
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
          obscureText: obscuretext,
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: TextStyle(
                color: Colors.black38,
              )),
        ),
      ),
    );
  }
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
  void submit() async {
    await auth.sendPasswordResetEmail(email: email);
  }
  _topheader() {
    return Padding(
      padding: EdgeInsets.only(left: 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            'Reset Your Password',
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

  Widget showAlert() {
    if (warning != null) {
      return Container(
        color: Colors.amber,
        width: double.infinity,
        padding: EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Icon(Icons.error_outline),
            ),
            Expanded(
              child: Text(
                warning,
                maxLines: 3,
                style: TextStyle(fontSize: 18),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  setState(() {
                    warning = null;
                  });
                },
              ),
            )
          ],
        ),
      );
    }
    return SizedBox(
      height: 0,
    );
  }


}
