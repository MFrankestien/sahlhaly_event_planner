import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sahlhaly_event_planner/models/event_model.dart';

class Eoboperation {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  addJob(EventModel eventModel) {
    _firestore.collection('Events').add({
      'EventName':eventModel.eventName,
      'EventCategories':eventModel.eventCat,
      'AudinceNum':eventModel.audNum,
      'EventAds': eventModel.eventAds,
      'EventBudget ': eventModel.eventBudget,
      'EventEqu': eventModel.eventEqu,
      'Time': eventModel.eventTime,
      'Deadline': eventModel.deadline,
      'EventIdea': eventModel.eventIdea,
      'Location': eventModel.location,
      'Type': eventModel.type
    });
  }

  Stream<QuerySnapshot> loadevents() {
    return _firestore.collection('Events').snapshots();
  }

  Stream<QuerySnapshot> loadoldevents() {
    return _firestore.collection('OldEvents').snapshots();
  }

  Stream<QuerySnapshot> loadnewevents() {
    return _firestore.collection('UpEvents').snapshots();
  }



  deleteevent(documentId){
    _firestore.collection('Events').doc(documentId).delete();

  }

  editevent(data,documentId){
    _firestore.collection('Events').doc(documentId).update(data);
  }

}