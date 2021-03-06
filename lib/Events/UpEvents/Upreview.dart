import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sahlhaly_event_planner/Component/style.dart';
import 'package:sahlhaly_event_planner/Screens/payment.dart';
import 'package:sahlhaly_event_planner/models/event_model.dart';
import 'package:sahlhaly_event_planner/utils/constants.dart';
import 'package:sahlhaly_event_planner/utils/size_config.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';

class ViewUp extends StatefulWidget {
  final EventModel eventModel;
  ViewUp({this.eventModel});
  @override
  _ViewUpState createState() => _ViewUpState();
}

class _ViewUpState extends State<ViewUp> {


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


    final topContentText = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 5.0,),
          child: Column(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Image(
                    width: 350,
                    height: 250,
                    image: (widget.eventModel.image!=null)?NetworkImage(widget.eventModel.image):NetworkImage(
                      'https://static-s.aa-cdn.net/img/gp/20600003374622/CYx3IJANEy179hrkSj4qfCA7sw2XpO2cjuz3B6pStH74le6s2DzJFWnck_5s35HSouQ=w300?v=1',
                    ),
                  ),

                ],
              ),
              Column(
                children: <Widget>[

                  Padding(
    padding: const EdgeInsets.only(left: 40.0,),
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
            height: MediaQuery.of(context).size.height * 0.5,
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
              ///////////////////////////////////// More info /////////////////////////////////////
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top:10.0),
                child: Text(
                  'information about event:',
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
              SizedBox(height: 30),
              Row(
                children: <Widget>[

                  Expanded(
                    flex: 2,
                    child: Text(
                      'Date:',
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
              SizedBox(height: 30),
              Row(children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Text(
                    ' Audiance Num:',
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
              SizedBox(height: 30),
              Row(children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Text(
                    '  Location:',
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
              SizedBox(height: 30),
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
              SizedBox(height: 30),
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
              SizedBox(height: 30),
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
    SizedBox(height: 30),
              Row(children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Text(
                    'Budget:',
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
              SizedBox(height: 30),
              Row(
                children: <Widget>[
                  Expanded(child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FlatButton(color: Colors.green, onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MasterCard()),
                      );

                    }, child: Text('Join')),
                  ))

                ],
              ),


            ],
          ),


        ],
      ),
    ]));
    return WillPopScope(
      onWillPop: () => Future.value(true),
      child: Scaffold(
        appBar: Review(context, titleText: 'Event Review',docid: widget.eventModel.eventId),
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

