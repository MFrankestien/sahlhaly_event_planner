import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sahlhaly_event_planner/profile_details/upload_photo.dart';
import '../Component/style.dart';
import 'package:sahlhaly_event_planner/utils/constants.dart';
import 'edit_personal_details.dart';

class PersonalDetail extends StatefulWidget {
  String userid;

  PersonalDetail(
      {this.firstName,
      this.lastName,
      this.fatherName,
      this.motherName,
      this.dob,
      this.religion,
      this.gender,
      this.maritalStatus,
      this.nationality,
      this.nid,
      this.userid});

  final String firstName;
  final String lastName;
  final String fatherName;
  final String motherName;
  final String dob;
  final String religion;
  final String gender;
  final String maritalStatus;
  final String nationality;
  final String nid;

  @override
  _PersonalDetailState createState() => _PersonalDetailState(userid);
}

class _PersonalDetailState extends State<PersonalDetail> {
  String userid;

  _PersonalDetailState(this.userid);

  @override
  void initState() {
    getuserdata();
  }

  String fname,lname,natinalid,gender,phone;
  String useremail='';
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future getuserdata() async {
    User userid = auth.currentUser;

    var usertype=await _firestore.collection('Users').doc(userid.uid).get().then
      ((DocumentSnapshot) async {

      setState(() {
        useremail = userid.email;
        phone = DocumentSnapshot.data()['Phone'];
        fname = DocumentSnapshot.data()['FirstName'];
        lname = DocumentSnapshot.data()['LastName'];
        natinalid= DocumentSnapshot.data()['NationalID'];
        gender = DocumentSnapshot.data()['Gender'];
      });

      print("typeroute $gender");
    });}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header2(
        context,
        titleText: "Personal Details",
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            EditPersonalDetails(userid: userid)));
              })
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 120,
                    width: 120,
                    child: CircleAvatar(
                        radius: 50.0,
                        backgroundImage: NetworkImage("https://i.stack.imgur.com/l60Hf.png")
                    ),
                  ),
                ),
                ListTile(
                    title: Text('$fname $lname', textAlign: TextAlign.center),
                    subtitle: Text('$useremail',
                        textAlign: TextAlign.center)),
                SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left: 15.0),
                            child: FieldTitleWithIcon(
                              title: "Date of Birth",
                              icon: Icons.calendar_today,
                            ),
                          ),
                          ProfileInputField(
                            initValue: widget.dob,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left: 15.0),
                            child: FieldTitleWithIcon(
                              title: "Religion",
                              icon: Icons.featured_video,
                            ),
                          ),
                          ProfileInputField(
                            initValue: widget.religion,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
