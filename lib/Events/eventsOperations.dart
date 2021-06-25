import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sahlhaly_event_planner/models/event_model.dart';

class Eoboperation {
  final Firestore _firestore = Firestore.instance;

  addJob(EventModel eventModel) {
    _firestore.collection('Events').add({
      'Job Nature':jobsHot.JobNature,
      'Job Categories':jobsHot.JobCat,
      'FirmID':jobsHot.firmid,
      'FirmName': jobsHot.companyName,
      'JobTitle': jobsHot.title,
      'JobRequirements': jobsHot.requirement,
      'Salary': jobsHot.salary,
      'Deadline': jobsHot.deadline,
      'JobDescription': jobsHot.description,
      'Education': jobsHot.education,
      'Imageurl': jobsHot.image,
      'Location': jobsHot.location,
      'Vacancy': jobsHot.vacancies
    });
  }

  Stream<QuerySnapshot> loadvents() {
    return _firestore.collection('Events').snapshots();
  }



  deleteJob(documentId){
    _firestore.collection('Events').document(documentId).delete();

  }

  editJob(data,documentId){
    _firestore.collection('Events').document(documentId).updateData(data);
  }

}