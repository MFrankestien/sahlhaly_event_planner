
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sahlhaly_event_planner/Component/style.dart';
import 'package:sahlhaly_event_planner/Routepage.dart';
import 'package:sahlhaly_event_planner/models/event_model.dart';


class AddNewevent extends StatefulWidget {


  @override
  _AddNeweventState createState() => _AddNeweventState();
}

class _AddNeweventState extends State<AddNewevent> {
  String EventTitle;
  String EventBudget;
  String AudinceNumber;
  String EventEquieoment;
  String EventIdea;
  String EventAds = 'Select Event Ads';
  String city = 'Select City';
  String EventCat = 'Select Event Categories';
  String EventTime = 'Select Event Time';
  final _formkeyNJ = GlobalKey<FormState>();
  final _eventModel = EventModel();
  String type='bm';
  String fname,lname,natinalid,gender,phone;
  String useremail='';
  final FirebaseAuth auth = FirebaseAuth.instance;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future getuseremail() async {
    User userid = auth.currentUser;

      setState(() {
        useremail = userid.email;
      });

      print("$useremail");
    }
  Future getuserdata() async {
    User userid = auth.currentUser;

    var usertype=await _firestore.collection('Users').doc(userid.uid).get().then
      ((DocumentSnapshot) async {

      setState(() {
        phone = DocumentSnapshot.data()['Phone'];
        fname = DocumentSnapshot.data()['FirstName'];
        lname = DocumentSnapshot.data()['LastName'];
        natinalid= DocumentSnapshot.data()['NationalID'];
        gender = DocumentSnapshot.data()['Gender'];
      });

      print("typeroute $type");
    });}
  DateTime _date = DateTime.now();

  Future<Null> selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(1970),
      lastDate: DateTime(2100),
    );
    if (_date != null && picked != _date) {
      setState(() {
        _date = picked;
      });
    }
  }


  @override
  void initState() {
    getuseremail();
    getuserdata();
  }

  @override
  Widget build(BuildContext context) {
    String _formatDate = DateFormat.yMMMd().format(_date);
    return Scaffold(
      appBar: header2(
        context,
        titleText: "Add event",
      ),
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                  minHeight: viewportConstraints.maxHeight,
                  minWidth: viewportConstraints.maxWidth),
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Form(
                    key: _formkeyNJ,
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 10,
                        ),

                        TextFormField(
                            validator: (val) =>
                                val.isEmpty ? 'Enter Event Name' : null,
                            onChanged: (val) {
                              setState(() => EventTitle = val);
                            },
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.teal,
                            ),
                            decoration: InputDecoration(
                              hintText: "Event Name",
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.blueAccent, width: 32.0),
                                  borderRadius: BorderRadius.circular(10.0)),
                            )),
                        Divider(),
                        TextFormField(
                            validator: (val) =>
                                val.isEmpty ? 'Enter Event Budget' : null,
                            onChanged: (val) {
                              setState(() => EventBudget = val);
                            },
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.teal,
                            ),
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: 'Event Budget',
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.blueAccent, width: 32.0),
                                  borderRadius: BorderRadius.circular(10.0)),
                            )),
                        Divider(),
                        TextFormField(
                            keyboardType: TextInputType.number,
                            validator: (val) =>
                                val.isEmpty ? 'Enter Audince Number' : null,
                            onChanged: (val) {
                              setState(() => AudinceNumber = val);
                            },
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.teal,
                            ),
                            decoration: InputDecoration(
                              labelText: 'Audince Number',
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.blueAccent, width: 32.0),
                                  borderRadius: BorderRadius.circular(10.0)),
                            )),
                        Divider(),


                        Divider(),
                        DropdownButton<String>(
                          value: city,
                          icon: Icon(Icons.location_city),
                          iconSize: 20,
                          elevation: 16,
                          style: TextStyle(color: Color(0xFF203354)),
                          underline: Container(
                            height: 2,
                            color: Colors.blueAccent,
                          ),
                          onChanged: (String newValue) {
                            setState(() {
                              city = newValue;
                            });
                          },
                          items: <String>[
                            'Select City',
                            'Cairo',
                            'Alexandria',
                            'Al Gīzah',
                            '6 October',
                            'Zamalek',
                            'Mohandesen',
                            'Nasr city',
                            'Masr El gdeda',
                            'Zayed City',
                            'Rehab',
                            'fifth settlement',
                            'Dokki',
                            'Ismailia',
                            'Port Said',
                            'Luxor',
                            'Sūhāj',
                            'Al Mansurah',
                            'Suez',
                            'Al Minya',
                            'Damanhur',
                            'Bani Suwayf',
                            'Asyuţ',
                            'Tanta',
                            'Al Fayyum',
                            'Aswan',
                            'Qina',
                            'Mallawi',
                            'Al Arish',
                            'Banha',
                            'Kafr EL Shaykh',
                            'Jirja',
                            'Marsa Matruh',
                            'Isna',
                            'Bani Mazar',
                            'Safajah',
                            'Sinai',
                            'Siwah',
                            'Al Alamayn',
                            'Al Sallūm',
                            'Al Ghardaqah',
                            'Rafaḩ',
                            'Shibin al Kawm',
                            'Damietta',
                            'Ash Shaykh Zuwayd',
                            'Az Zaqaziq'
                          ].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(fontSize: 18),
                              ),
                            );
                          }).toList(),
                        ),
                        Divider(),
                        DropdownButton<String>(
                          value: EventTime,
                          icon: Icon(Icons.watch_later_outlined),
                          iconSize: 20,
                          elevation: 16,
                          style: TextStyle(color: Color(0xFF203354)),
                          underline: Container(
                            height: 2,
                            color: Colors.blueAccent,
                          ),
                          onChanged: (String newValue) {
                            setState(() {
                              EventTime = newValue;
                            });
                          },
                          items: <String>[
                            'Select Event Time',
                            'First Quarter',
                            'Middle Quarter',
                            'Second Quarter',
                            'End',
                          ].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(fontSize: 18),
                              ),
                            );
                          }).toList(),
                        ),
                        Divider(),
                        DropdownButton<String>(
                          value: EventCat,
                          icon: Icon(FontAwesomeIcons.briefcase),
                          iconSize: 20,
                          elevation: 16,
                          style: TextStyle(color: Color(0xFF203354)),
                          underline: Container(
                            height: 2,
                            color: Colors.blueAccent,
                          ),
                          onChanged: (String newValue) {
                            setState(() {
                              EventCat = newValue;
                            });
                          },
                          items: <String>[
                            'Select Event Categories',
                            'Personal Event',
                            'Organizational Event',
                            'Management Event',
                            'Culture Event',
                            'Special Planning Event',
                            'Entertainment Event',
                            'Design Event',
                            'Coordinator Event',
                            'Conference Event',
                            'Work Shop ',
                            'Others'
                          ].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(fontSize: 18),
                              ),
                            );
                          }).toList(),
                        ),
                        Divider(),
                        DropdownButton<String>(
                          value: EventAds,
                          icon: Icon(Icons.connected_tv),
                          iconSize: 20,
                          elevation: 16,
                          style: TextStyle(color: Color(0xFF203354)),
                          underline: Container(
                            height: 2,
                            color: Colors.blueAccent,
                          ),
                          onChanged: (String newValue) {
                            setState(() {
                              EventAds = newValue;
                            });
                          },
                          items: <String>[
                            'Select Event Ads',
                            'Facebook',
                            'Google',
                            'Instagram',
                            'Tv',
                            'Area',
                            'Others'
                          ].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(fontSize: 18),
                              ),
                            );
                          }).toList(),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Expanded(
                              child: _InputDropdown(
                                labelText: "Dead Line",
                                valueText: _formatDate,
                                onPressed: () {
                                  selectDate(context);
                                },
                              ),
                            ),
                            SizedBox(width: 8.0),
                          ],
                        ),
                        Divider(),
                        TextFormField(
                            validator: (val) =>
                            val.isEmpty ? 'Enter Event Equieoment' : null,
                            onChanged: (val) {
                              setState(() => EventEquieoment = val);
                            },
                            maxLines: 10,
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.teal,
                            ),
                            decoration: InputDecoration(
                              hintText: 'Event Equieoment',
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.blueAccent, width: 32.0),
                                  borderRadius: BorderRadius.circular(10.0)),
                            )),
                        Divider(),
                        TextFormField(
                            validator: (val) =>
                                val.isEmpty ? 'Enter Event Idea' : null,
                            onChanged: (val) {
                              setState(() => EventIdea = val);
                            },
                            maxLines: 10,
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.teal,
                            ),
                            decoration: InputDecoration(
                              hintText: 'Event Idea',
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.blueAccent, width: 32.0),
                                  borderRadius: BorderRadius.circular(10.0)),
                            )),
                        Divider(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Colors.blueAccent,
          onPressed: () async {
            if (_formkeyNJ.currentState.validate()){
              print(EventTitle);
              print(EventBudget);
              print(AudinceNumber);
              print(city);
              print(EventTime);
              print(EventCat);
              print(EventAds);
              print(_formatDate);
              print(EventIdea);
              print(EventEquieoment);

              _eventModel.addEvent(EventModel(
                phone: phone,
                fname: fname,
                lname: lname,
                nationalid: natinalid,
                useremail: useremail,
                  Accepted: false,
                  eventName: EventTitle,
                  eventBudget:EventBudget,
                  audNum: AudinceNumber,
                  location: city,
                  eventTime: EventTime,
                  eventCat: EventCat,
                  eventAds: EventAds,
                  deadline: _formatDate,
                  eventEqu: EventEquieoment,
                  eventIdea: EventIdea,
                  type: type));
              Fluttertoast.showToast(
                  msg: "Event Added Succefully",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0
              );
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => RoutePage()));
            }
          ;}),
    );
  }
}

class _InputDropdown extends StatelessWidget {
  const _InputDropdown(
      {Key key,
      this.child,
      this.labelText,
      this.valueText,
      this.onPressed,
      this.onChanged})
      : super(key: key);

  final String labelText;
  final String valueText;
  final VoidCallback onPressed;
  final VoidCallback onChanged;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return new InkWell(
      onTap: onPressed,
      child: InputDecorator(
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          labelText: labelText,
        ),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new Text(valueText),
            new Icon(Icons.calendar_today,
                color: Theme.of(context).brightness == Brightness.light
                    ? Colors.grey.shade700
                    : Colors.white70),
          ],
        ),
      ),
    );
  }
}
