import 'package:firebase_auth/firebase_auth.dart';
import 'package:sahlhaly_event_planner/models/user.dart';


class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;


  // auth change user stream
  Stream<AppUser> get user {
    return _auth.authStateChanges()
        .map(_userFromFirebaseUser);
  }


  // create user obj based on firebase user
  AppUser _userFromFirebaseUser(User user) {
    return user != null ? AppUser(uid: user.uid): null;
  }


  // Reset Password
  Future sendPasswordResetEmail(String email) async {
    return _auth.sendPasswordResetEmail(email: email);
  }





// sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (error) {
      print(error.toString());
      return null;
    }
  }
}