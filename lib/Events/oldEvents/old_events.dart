import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../Requsted_event/Evreview.dart';
import 'package:sahlhaly_event_planner/Events/eventsOperations.dart';
import 'package:sahlhaly_event_planner/Events/oldEvents/oldreview.dart';


import 'package:sahlhaly_event_planner/models/event_model.dart';

class Oldevents extends StatefulWidget {
  @override
  _OldeventsState createState() => _OldeventsState();
}

class _OldeventsState extends State<Oldevents> {
  final event = Eoboperation();
List jobs;
bool show =true;


  @override
  void initState() {
    super.initState();

  }

  Widget build(BuildContext context) {
    ListTile makeListTile(EventModel eventModel) => ListTile(
      isThreeLine: true,
      title: Text(
        eventModel.eventName,
        style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

          SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    '📅 Date:',
                    style: TextStyle(
                        fontSize: 15.0, fontWeight: FontWeight.w700),
                  ),
                  Text(
                   eventModel.deadline,
                    style: TextStyle(
                        fontSize: 15.0, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              
            ],
          ),
          SizedBox(
            height: 15.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(

                children: <Widget>[
                  Text(
                    '👥 Audince Num',
                    style: TextStyle(
                        fontSize: 15.0, fontWeight: FontWeight.w700),
                  ),
                  Text(
                    eventModel.audNum,
                    style: TextStyle(
                        fontSize: 15.0, fontWeight: FontWeight.w700),
                  ),
                ],
              ),

            ],
          ),
          Row(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '📋 Event Type:',
                  style: TextStyle(
                      fontSize: 15.0, fontWeight: FontWeight.w700),
                ),
                Text(
                  eventModel.eventCat,
                  style: TextStyle(fontSize: 15.0),
                ),
              ],
            ),
          ],)
        ],
      ),
      trailing:Image(
        width: 100.0,
        height: 100.0,
        image: (eventModel.image!=null)?NetworkImage(eventModel.image):NetworkImage(
          'https://static-s.aa-cdn.net/img/gp/20600003374622/CYx3IJANEy179hrkSj4qfCA7sw2XpO2cjuz3B6pStH74le6s2DzJFWnck_5s35HSouQ=w300?v=1',
        ),
      ),

      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ViewOld(eventModel: eventModel,)));
      },
    );

    Card makeCard(EventModel eventModel) => Card(
      elevation: 8.0,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        height: 200.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: makeListTile(eventModel),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.blue[100],
      body:  StreamBuilder<QuerySnapshot>(
        stream: event.loadoldevents(),
        builder: (context,snapshot) {
          if (snapshot.hasData) {
            List _events = [];

            for (var doc in snapshot.data.docs) {
              Map<String, dynamic> data = doc.data();

              _events.add(EventModel(
                eventId: doc.id,
                image: data['image'],
                eventName:data['EventName'],
                audNum: data['AudinceNum'],
                deadline: data['Deadline'],
                eventAds: data['EventAds'],
                eventBudget: data['EventBudget '],
                eventCat: data['EventCat'],
                eventIdea: data['EventIdea'],
                eventTime: data['EventTime'],
                location: data['Location'],
              ));
             print(_events);
            }
            return ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: _events.length,
              itemBuilder: (BuildContext context, int index) {
                return makeCard(_events[index]);

              },
            );
          }
          else {
            return Center(child: Text('loading ..'));
          }
        }),
            );
  }
}