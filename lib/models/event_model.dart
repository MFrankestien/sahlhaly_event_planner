import 'package:cloud_firestore/cloud_firestore.dart';

class EventModel {
  String eventId,
  phone,
      gender,
      fname,
      lname,
      nationalid,
      useremail,
      image,
      eventName,
      eventBudget,
      audNum,
      location,
      eventTime,
      eventCat,
      eventAds,
      deadline,
      eventEqu,
      eventIdea,
      type;
  bool Accepted;

  //Contructor
  EventModel({
    this.phone,
    this.fname,
    this.lname,
    this.nationalid,
    this.gender,
    this.useremail,
    this.Accepted,
    this.eventId,
    this.image,
    this.eventName,
    this.eventBudget,
    this.audNum,
    this.location,
    this.eventTime,
    this.eventCat,
    this.eventAds,
    this.deadline,
    this.eventEqu,
    this.eventIdea,
    this.type
  });

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  addEvent(EventModel eventModel) {
    _firestore.collection('Events').add({
      'Phone':eventModel.phone,
      'FirstName':eventModel.fname,
      'LastName':eventModel.lname,
      'NationalID':eventModel.nationalid,
      'Gender':eventModel.gender,
      'EventName':eventModel.eventName,
      'EventBudget ':eventModel.eventBudget,
      'AudinceNum':eventModel.audNum,
      'Location': eventModel.location,
      'EventTime': eventModel.eventTime,
      'EventCat': eventModel.eventCat,
      'EventAds': eventModel.eventAds,
      'Deadline': eventModel.deadline,
      'EventEqu': eventModel.eventEqu,
      'EventIdea': eventModel.eventIdea,
      'Type': eventModel.type,
      'accepted':eventModel.Accepted
    });
  }

  addnewEvent(EventModel eventModel) {
    _firestore.collection('UpEvents').add({
      'EventName':eventModel.eventName,
      'EventBudget ':eventModel.eventBudget,
      'AudinceNum':eventModel.audNum,
      'Location': eventModel.location,
      'EventTime': eventModel.eventTime,
      'EventCat': eventModel.eventCat,
      'EventAds': eventModel.eventAds,
      'Deadline': eventModel.deadline,
      'EventEqu': eventModel.eventEqu,
      'EventIdea': eventModel.eventIdea,
      'Type': eventModel.type,
    });
  }


  Stream<QuerySnapshot> loadjob() {
    return _firestore.collection('Events').snapshots();
  }



  deleteJob(documentId){
    _firestore.collection('Jobs').doc(documentId).delete();

  }

  editJob(data,documentId){
    _firestore.collection('Jobs').doc(documentId).update(data);
  }
}

final FirebaseFirestore _firestore = FirebaseFirestore.instance;

Future<void>addEvent(EventModel eventModel) {
  _firestore.collection('Events').add({
    'EventName':eventModel.eventName,
    'EventBudget ':eventModel.eventBudget,
    'AudinceNum':eventModel.audNum,
    'Location': eventModel.location,
    'EventTime': eventModel.eventTime,
    'EventCat': eventModel.eventCat,
    'EventAds': eventModel.eventAds,
    'Deadline': eventModel.deadline,
    'EventEqu': eventModel.eventEqu,
    'EventIdea': eventModel.eventIdea,
    'Type': eventModel.type,
  });
}

Stream<QuerySnapshot> loadjob() {
  return _firestore.collection('Events').snapshots();
}



deleteJob(documentId){
  _firestore.collection('Jobs').doc(documentId).delete();

}

editJob(data,documentId){
  _firestore.collection('Jobs').doc(documentId).update(data);
}

// Creating list of dummy data for events list

var events = [
];
