import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sahlhaly_event_planner/events_details_page.dart';

import 'package:sahlhaly_event_planner/models/event_model.dart';

class Upcommingevents extends StatefulWidget {
  @override
  _UpcommingeventsState createState() => _UpcommingeventsState();
}

class _UpcommingeventsState extends State<Upcommingevents> {
  final _job = Joboperation();
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
          Text(
            job.companyName,
            style: TextStyle(fontSize: 15.0),
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
                    '📅 Deadline:',
                    style: TextStyle(
                        fontSize: 15.0, fontWeight: FontWeight.w700),
                  ),
                  Text(
                    job.deadline,
                    style: TextStyle(
                        fontSize: 15.0, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Text(
                    '👥 Vacancies',
                    style: TextStyle(
                        fontSize: 15.0, fontWeight: FontWeight.w700),
                  ),
                  Text(
                      job.vacancies+ ' Positions available ',
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
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '🎓 Education:',
                      style: TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.w700),
                    ),
                    Text(
                      job.education,
                      style: TextStyle(fontSize: 15.0),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '📋 Job Nature:',
                      style: TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.w700),
                    ),
                    Text(
                      job.JobNature,
                      style: TextStyle(fontSize: 15.0),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      trailing: Image(
        width: 40.0,
        height: 40.0,
        image: (job.image!=null)?NetworkImage(job.image):AssetImage(
            'assets/images/jobdefault.png'),
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => EventsDetailsPage(eventModel: eventModel,show:show)));
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
          child: makeListTile(job),
        ),
      ),
    );

    return Scaffold(
      appBar: JobSeekerHeader(context, titleText: 'Hot Jobs'),
      body:  StreamBuilder<QuerySnapshot>(
        stream: _job.loadjob(),
        builder: (context,snapshot) {
          if (snapshot.hasData) {
            List _jobs = [];
            for (var doc in snapshot.data.documents) {
              var data = doc.data;

             _jobs.add(JobsHot(
                 jobId: doc.documentID,
                 firmid: data['FirmID'],
                 JobNature: data['Job Nature'],
                  companyName: data['FirmName'],
                  title: data['JobTitle'],
                  requirement: data['JobRequirements'],
                  salary: data['Salary'],
                  deadline: data['Deadline'],
                  description: data['JobDescription'],
                  education: data['Education'],
                  image: data['Imageurl'],
                  location: data['Location'],
                  vacancies: data['Vacancy']));
             print(_jobs);
             print('jobs');
            }
            return ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: _jobs.length,
              itemBuilder: (BuildContext context, int index) {
                return makeCard(_jobs[index]);

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