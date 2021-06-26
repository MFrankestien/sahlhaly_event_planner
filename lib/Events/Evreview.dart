import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
    String CompanyName = widget.eventModel.CompanyName;

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
                      image: (widget.eventModel.imageurl!=null)?NetworkImage(widget.eventModel.imageurl):NetworkImage(
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
                          child: (widget.eventModel.name!=null)?Text(
                            widget.eventModel.name,
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
                  child: (widget.eventModel.!=null)?Text(
                    widget.eventModel.nationalid,
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
          /////////////////////////////////////Contact Information/////////////////////////////////////
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top:10.0),
                child: Text(
                    'Contact Information:',
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
              Row(children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Text(
                    '📍 City:',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: (widget.eventModel.City!=null)?Text(
                    widget.eventModel.City,
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
                    '🏢 Address:',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: (widget.eventModel.FullAdress!=null)?Text(
                    widget.eventModel.FullAdress,
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
                  child: (widget.eventModel.Phone!=null)?Text(
                    widget.eventModel.Phone,
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
                  child: (widget.eventModel.Email!=null)?Text(
                    widget.eventModel.Email,
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
          /////////////////////////////////////Career Application/////////////////////////////////////
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top:10.0),
                child: Text(
                  'Career Information:',
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
                    'My Objective:',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: (widget.eventModel.Objective!=null)?Text(
                    widget.eventModel.Objective,
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

          /////////////////////////////////////Education/////////////////////////////////////
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top:10.0),
                child: Text(
                  'Academic Qualifications :',
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
                    'Institute Name:',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: (widget.eventModel.InstituteName!=null)?Text(
                    widget.eventModel.InstituteName,
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
                    'Academic Level:',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: (widget.eventModel.EducationLvl!=null)?Text(
                    widget.eventModel.EducationLvl,
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
                    'Result:',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: (widget.eventModel.Result!=null)?Text(
                    widget.eventModel.Result,
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
                    'Passing Year:',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: (widget.eventModel.PassingYear!=null)?Text(
                    widget.eventModel.PassingYear,
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
          /////////////////////////////////////Employment History/////////////////////////////////////
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top:10.0),
                child: Text(
                  'Employment History :',
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
                    'Company Name:',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: (widget.eventModel.CompanyName!=null)?Text(
                    widget.eventModel.CompanyName,
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
                    'Department:',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: (widget.eventModel.Department!=null)?Text(
                    widget.eventModel.Department,
                    style: TextStyle(fontSize: 18.0),
                  ):
                  Text('Complete your profile to show '),
                ),
              ],),
              SizedBox(height: 10,),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Text(
                      'Responsibilities:',
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: (widget.eventModel.Responsabilities!=null)?Text(
                      widget.eventModel.Responsabilities,
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
                    'Start Year:',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: (widget.eventModel.StartingYear!=null)?Text(
                    widget.eventModel.StartingYear,
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
                    'End Year:',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: (widget.eventModel.EndYear!=null)?Text(
                    widget.eventModel.EndYear,
                    style: TextStyle(fontSize: 18.0),
                  ):
                  Text('Complete your profile to show '),
                ),
              ],),
              SizedBox(height: 10,)
            ],
          ),
          Container(
            width: SizeConfig.screenWidth,
            child: new Divider(color: Colors.blueGrey),
          ),
          SizedBox(height: 20,),
          /////////////////////////////////////Language Proficiency//////////////////////////////////
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top:10.0),
                child: Text(
                  'Language Proficiency :',
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
              Padding(
                padding: EdgeInsets.only(top:10.0),
                child: Text(
                  'First Language',
                  style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.w400),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom:10.0),
                child: Container(
                  width: 170.0,
                  child: new Divider(color: Theme.of(context).primaryColor),
                ),
              ),
              Row(children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Text(
                    'First Language:',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: (widget.eventModel.FirstLangauge!=null)?Text(
                    widget.eventModel.FirstLangauge,
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
                    'Reading Level:',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: (widget.eventModel.FirstLangReadingLvl!=null)?Text(
                    widget.eventModel.FirstLangReadingLvl,
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
                    'Writing Level:',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: (widget.eventModel.FirstLanguageWritingLvl!=null)?Text(
                    widget.eventModel.FirstLanguageWritingLvl,
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
                    'Speaking Level:',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: (widget.eventModel.FirstLanguageSpeakingLvl!=null)?Text(
                    widget.eventModel.FirstLanguageSpeakingLvl,
                    style: TextStyle(fontSize: 18.0),
                  ):
                  Text('Complete your profile to show '),
                ),
              ],),
              SizedBox(height: 20,),
              Padding(
                padding: EdgeInsets.only(top:10.0),
                child: Text(
                  'Second Language',
                  style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.w400),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom:10.0),
                child: Container(
                  width: 170.0,
                  child: new Divider(color: Theme.of(context).primaryColor),
                ),
              ),
              Row(children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Text(
                    'Second Language:',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: (widget.eventModel.SecondLangauge!=null)?Text(
                    widget.eventModel.SecondLangauge,
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
                    'Reading Level:',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: (widget.eventModel.SecondLangReadingLvl!=null)?Text(
                    widget.eventModel.SecondLangReadingLvl,
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
                    'Writing Level:',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: (widget.eventModel.SecondLanguageWritingLvl!=null)?Text(
                    widget.eventModel.SecondLanguageWritingLvl,
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
                    'Speaking Level:',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: (widget.eventModel.SecondLanguageSpeakingLvl!=null)?Text(
                    widget.eventModel.SecondLanguageSpeakingLvl,
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
          Row(
            children: <Widget>[
            Expanded(child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: FlatButton(color: Colors.red, onPressed: (){
                Firestore.instance
                    .collection('Applicants')
                    .document(widget.eventModel.docId).updateData({'Accepted':false});
                CustomLaunch('mailto:$Email?subject=$JobTitle - $CompanyName  &body= Thank you very much $fullname for your interest in employment opportunities with $CompanyName company.\n \nThis message is to inform you that we have selected a candidate who is a match for the job requirements of the position.\n \nWe appreciate you taking the time to apply for employment with our company and wish you the best of luck in your future endeavors.\n \n We have a place for you with us still!!\n\n We have provided a list of feedback on how you can improve yourself down below:\n\n 1-..........\n\n 2-..........\n\n 3-.......... \n\n We wish that you will reach out for us in the future as well after considering our feedback \n\n Best regards,$CompanyName');
              }, child: Text('Reject'),
               ),
            )),
              Expanded(child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FlatButton(color: Colors.green, onPressed: (){

                  Firestore.instance
                      .collection('Applicants')
                      .document(widget.eventModel.docId).updateData({'Accepted':true});
                  CustomLaunch('mailto:$Email?subject=$JobTitle - $CompanyName &body= Hello MR/Mrs $fullname \n \n We extend our gratitude and would like to inform you for being accepted for the position of $JobTitle in $CompanyName.\n \n We are delighted and looking forward to commencing work with you.\n \n Best Regards, $CompanyName');

                }, child: Text('Accept')),
              ))

            ],
          ),

        ],
      ),
    );
    return WillPopScope(
      onWillPop: () => Future.value(true),
      child: Scaffold(
        appBar: CReview(context, titleText: 'C.V Review',docid: widget.eventModel.docId),
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

