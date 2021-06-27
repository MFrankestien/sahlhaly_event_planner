
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../Screens/payment.dart';
import 'package:sahlhaly_event_planner/profile_details/personal_details.dart';
import 'package:sahlhaly_event_planner/services/auth.dart';
import 'package:sahlhaly_event_planner/wrapper.dart';


class MainDrawer extends StatefulWidget {
  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  String name='';
  String lname='';
  String image;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future getusername() async {
    User userid = auth.currentUser;

    var usertype=await _firestore.collection('Users').doc(userid.uid).get().then
      ((DocumentSnapshot) async {

      setState(() {
        name = DocumentSnapshot.data()['FirstName'];
        lname = DocumentSnapshot.data()['LastName'];
        image =DocumentSnapshot.data()['image'];
      });

      print(name);
    });}

  @override
  void initState() {
    getusername();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Container(
          decoration: BoxDecoration( gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors:  [Color(0xff1a84b8), Color(0xff2b6ff7)])),
          child: Padding(
            padding: EdgeInsets.only(top: 50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                CircleAvatar(
                    radius: 50.0,
                    backgroundImage:(image!=null)?NetworkImage(image):NetworkImage(
                      'https://i.stack.imgur.com/l60Hf.png',
                )),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  "$name $lname",
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),

                Divider(
                  color: Colors.blue,
                  thickness: 1.0,
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        //Now let's Add the button for the Menu
        //and let's copy that and modify it
        ListTile(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PersonalDetail(
                    )));

          },
          leading: Icon(
            Icons.person,
            color: Colors.black,
          ),
          title: Text("Your Profile"),
        ),

        ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MasterCard()),
            );
          },
          leading: Icon(
            Icons.credit_card,
            color: Colors.black,
          ),
          title: Text("Manage payment info"),
        ),

        ListTile(
          onTap: () {},
          leading: Icon(
            Icons.info,
            color: Colors.black,
          ),
          title: Text("About Us"),
        ),

        ListTile(
          onTap: () {},
          leading: Icon(
            Icons.mail,
            color: Colors.black,
          ),
          title: Text("Contact Us"),
        ),

        ListTile(
          onTap: () {},
          leading: Icon(
            Icons.settings,
            color: Colors.black,
          ),
          title: Text("Settings"),
        ),

        ListTile(
          onTap: () {
            AuthService().signOut();
            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                Wrapper()), (Route<dynamic> route) => false);
          },
          leading: Icon(
            Icons.logout,
            color: Colors.black,
          ),
          title: Text("LogOut"),
        ),


      ]),
    );
  }
}
