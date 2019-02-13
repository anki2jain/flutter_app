import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';
class Crud {
  bool isloggedIn() {
    if (FirebaseAuth.instance.currentUser() != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> addData(data) async {
    if (isloggedIn()) {
      Firestore.instance.collection('subject').add(data).catchError((e) {
        print(e);
      });
    }
  }



  
}





