
import 'package:flutter/material.dart';
import 'package:sahlhaly_event_planner/payment.dart';


class MainDrawer extends StatelessWidget {
  const MainDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        child: Padding(
          padding: EdgeInsets.only(top: 50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage("assets/football.jpg")
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                "name",
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
                thickness: 2.0,
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
        onTap: () {},
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
        onTap: () {},
        leading: Icon(
          Icons.logout,
          color: Colors.black,
        ),
        title: Text("LogOut"),
      ),


    ]);
  }
}