import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart'as http;
import 'package:flutter/widgets.dart';
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

class Authp with ChangeNotifier{


  Future<void> _auth(String email, String password,String urlseg) async {

    final url =Uri.parse("https://identitytoolkit.googleapis.com/v1/accounts:$urlseg?key=AIzaSyBKzLK88ifh6mYYwwuIjSslJLvu8q6tEUg");
    try {
      final res = await http.post(url ,body: json.encode({
        'email': email,
        'password': password,
        'returnSecureToken':true
      }));
      print(res);}

    catch(e) {
      print(e);
    }
  }

  Future<void> signup(String email, String password) async {

   return _auth(email,password,'signUp');

  }

  Future<void> signIn(String email, String password) async {
    return _auth(email,password,'signInWithPassword');

  }


}