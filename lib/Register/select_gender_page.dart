
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sahlhaly_event_planner/Register/success_page.dart';
import 'package:sahlhaly_event_planner/services/auth.dart';
import 'package:sahlhaly_event_planner/utils/constants.dart';
import 'package:sahlhaly_event_planner/utils/size_config.dart';


class SelectGender extends StatefulWidget {
  String userid;
  String fname, lname, phone,nid;

  SelectGender(
      {this.fname, this.lname, this.phone, this.userid,this.nid});

  @override
  _SelectGenderState createState() =>
      _SelectGenderState(fname, lname, phone,  userid,nid);
}

class _SelectGenderState extends State<SelectGender> {
  List<String> _selectGender = ['♂ Male', '♀ Female'];
  int _defaultChoiceIndex;
  String choice = '';
  String fname, lname, phone,  userid,nid;

  _SelectGenderState(
      this.fname, this.lname, this.phone,  this.userid,this.nid);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _defaultChoiceIndex = 0;
  }

  Widget selectGender() {
    return Expanded(
      child: ListView.builder(
          itemCount: _selectGender.length,
          itemBuilder: (BuildContext context, int index) {
            return Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    width: SizeConfig.screenWidth,
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(
                        left: 25.0, right: 25.0, top: 5.0, bottom: 5.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        ChoiceChip(
                          label: Container(
                            width: SizeConfig.screenWidth,
                            child: Text(
                              _selectGender[index],
                              style: TextStyle(
                                  color: Colors.white, fontSize: 25.0),
                            ),
                          ),
                          backgroundColor: Colors.black26,
                          padding: EdgeInsets.all(15.0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                          selected: _defaultChoiceIndex == index,
                          selectedColor: Theme.of(context).primaryColor,
                          onSelected: (bool selected) {
                            setState(() {
                              _defaultChoiceIndex = selected ? index : 0;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0XFF3F51b5),
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            children: <Widget>[
              BackButtonPop(),
              SizedBox(
                height: 5.0,
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

                      Container(
                        alignment: Alignment.center,
                        height: size.height/2,
                        width: size.width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 50.0, right: 50.0, top: 70.0),
                              child: LinearProgressIndicator(
                                backgroundColor: Color(0xFFD7D7D7),
                                valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                                value: 0.7,
                              ),
                            ),

                            selectGender(),
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
          onPressed: () async {
            if (_defaultChoiceIndex == 0) {
              choice = 'Male';
              print(choice);
              await AuthService(uid: userid).updateUserData(
                  fname, lname, phone,  choice,nid,"user");
            } else {
              choice = 'Female';
              print(choice);
              print(fname);
              print(lname);
              print(phone);
              print(nid);

              await AuthService(uid: userid).updateUserData(
                  fname, lname, phone,  choice,nid,"user");
            }
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => SuccessPage(
                          userid: userid,
                        )));
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
            'Gender',
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
