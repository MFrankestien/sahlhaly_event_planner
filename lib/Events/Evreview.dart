import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sahlhaly_event_planner/Component/style.dart';
import 'package:sahlhaly_event_planner/models/event_model.dart';
import 'package:sahlhaly_event_planner/utils/constants.dart';
import 'package:sahlhaly_event_planner/utils/size_config.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';

class Viewreq extends StatefulWidget {
  final EventModel eventModel;
  Viewreq({this.eventModel});
  @override
  _ViewreqState createState() => _ViewreqState();
}

class _ViewreqState extends State<Viewreq> {


  Future<void> CustomLaunch(command) async {
    if (await canLaunch(command) != null){
    await launch (command);

    } else {print('Couldnt Launch $command');}
  }


  var myFormat = DateFormat('d-MM-yyyy');



  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String Email=widget.eventModel.useremail;
    String fullname=widget.eventModel.fname+widget.eventModel.lname;
    String Nationalid = widget.eventModel.nationalid;
    String Gender = widget.eventModel.gender;

    final topContentText = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 5.0, top: 10.0),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Image(
                      width: 100.0,
                      height: 100.0,
                      image: (widget.eventModel.image!=null)?NetworkImage(widget.eventModel.image):NetworkImage(
                        'https://i.stack.imgur.com/l60Hf.png',
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: SizeConfig.screenWidth,
                          child: new Divider(color: Colors.blueGrey),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: (widget.eventModel.eventName!=null)?Text(
                            widget.eventModel.eventName,
                            style: TextStyle(
                                fontSize: 20.0, color: Colors.white),
                          ):  SizedBox(
                            child: CircularProgressIndicator(),
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
    );

    final topContent = Stack(
      children: <Widget>[
        ClipPath(
          clipBehavior: Clip.antiAlias,
          clipper: HomeClipper2(),
          child:  Container(
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(color: Theme.of(context).primaryColor),
            child: Center(
              child: topContentText,
            ),
          ),
        ),

      ],
    );

    final bottomContentText = Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ////Personal Information
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top:10.0),
                child: Text(
                    'Personal Information:',
                    style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.w700)
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom:10.0),
                child: Container(
                  width: 250.0,
                  child: new Divider(color: Theme.of(context).primaryColor),
                ),
              ),
              Row(
                children: <Widget>[

                  Expanded(
                    flex: 2,
                    child: Text(
                      '📅 Date:',
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: (widget.eventModel.deadline!=null)?Text(
                    widget.eventModel.deadline,
                      style: TextStyle(fontSize: 18.0),
                    ):
                    Text('Complete your profile to show '),
                  ),
                ],),
              SizedBox(height: 10,),
              Row(children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Text(
                    '👨👩 Audiance Number:',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: (widget.eventModel.audNum!=null)?Text(
                    widget.eventModel.audNum,
                    style: TextStyle(fontSize: 18.0),
                  ):
                  Text('Complete your profile to show '),
                ),
              ],),
              SizedBox(height: 10,),
              Row(children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Text(
                    ' 📍 Location:',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: (widget.eventModel.location!=null)?Text(
                    widget.eventModel.location,
                    style: TextStyle(fontSize: 18.0),
                  ):
                  Text('Complete your profile to show '),
                ),
              ],),
              SizedBox(height: 10,),


            ],
          ),
          Container(
            width: SizeConfig.screenWidth,
            child: new Divider(color: Colors.blueGrey),
          ),
          SizedBox(height: 20,),
          /////////////////////////////////////Personal Information/////////////////////////////////////
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top:10.0),
                child: Text(
                    'Personal Information:',
                    style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.w700)
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom:10.0),
                child: Container(
                  width: 250.0,
                  child: new Divider(color: Theme.of(context).primaryColor),
                ),
              ),
              Expanded(
                flex: 2,
                child: (fullname!=null)?Text(
                  fullname,
                  style: TextStyle(fontSize: 18.0),
                ):
                Text('Complete your profile to show '),
              ),
              Row(children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Text(
                    '👨👩 Gender:',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: (widget.eventModel.gender!=null)?Text(
                    widget.eventModel.gender,
                    style: TextStyle(fontSize: 18.0),
                  ):
                  Text('Complete your profile to show '),
                ),
              ],),//gender
              Row(children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Text(
                    ' ║▌ National ID:',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: (widget.eventModel.nationalid!=null)?Text(
                    widget.eventModel.nationalid,
                    style: TextStyle(fontSize: 18.0),
                  ):
                  Text('Complete your profile to show '),
                ),
              ],),

              SizedBox(height: 10,),
              Row(children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Text(
                    '📞 Phone:',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: (widget.eventModel.phone!=null)?Text(
                    widget.eventModel.phone,
                    style: TextStyle(fontSize: 18.0),
                  ):
                  Text('Complete your profile to show '),
                ),
              ],),
              SizedBox(height: 10,),
              Row(children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Text(
                    '📧 E-mail:',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: (widget.eventModel.useremail!=null)?Text(
                    widget.eventModel.useremail,
                    style: TextStyle(fontSize: 18.0),
                  ):
                  Text('Complete your profile to show '),
                ),
              ],),
            ],
          ),
          Container(
            width: SizeConfig.screenWidth,
            child: new Divider(color: Colors.blueGrey),
          ),
          SizedBox(height: 20,),
          ///////////////////////////////////// More info /////////////////////////////////////
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top:10.0),
                child: Text(
                  'More information about event:',
                  style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.w700),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom:10.0),
                child: Container(
                  width: 250.0,
                  child: new Divider(color: Theme.of(context).primaryColor),
                ),
              ),
              Row(children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Text(
                    'Event idea:',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: (widget.eventModel.eventIdea!=null)?Text(
                    widget.eventModel.eventIdea,
                    style: TextStyle(fontSize: 18.0),
                  ):
                  Text('Complete your profile to show '),
                ),
              ],),
              SizedBox(height: 10,),
              Row(children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Text(
                    'Event Time:',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: (widget.eventModel.eventTime!=null)?Text(
                    widget.eventModel.eventTime,
                    style: TextStyle(fontSize: 18.0),
                  ):
                  Text('Complete your profile to show '),
                ),
              ],),
              Row(children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Text(
                    'Event Ads:',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: (widget.eventModel.eventAds!=null)?Text(
                    widget.eventModel.eventAds,
                    style: TextStyle(fontSize: 18.0),
                  ):
                  Text('Complete your profile to show '),
                ),
              ],),
              Row(children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Text(
                    'Event Ads:',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: (widget.eventModel.eventBudget!=null)?Text(
                    widget.eventModel.eventBudget,
                    style: TextStyle(fontSize: 18.0),
                  ):
                  Text('Complete your profile to show '),
                ),
              ],),

            ],
          ),


        ],
      ),
    );
    return WillPopScope(
      onWillPop: () => Future.value(true),
      child: Scaffold(
        appBar: Review(context, titleText: 'C.V Review',docid: widget.eventModel.eventId),
        body: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            children: <Widget>[topContent, bottomContentText],
          ),
        ),
      ),
    );
  }


}

