import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Authenticate with ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore db = FirebaseFirestore.instance;

  Future<void> login(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } on PlatformException catch (error) {
      var errorMessage = 'Could not authenticate. Pleae try again later.';

      if (error.message != null) {
        errorMessage = error.message;
      }
      print(errorMessage);
    } catch (error) {
      print(error);
    }
  }

  Future<void> signUp(String email, String password, String username) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await db.collection('users').doc(auth.currentUser.uid).set({
        'email': email,
        'username': username,
      });
    } on PlatformException catch (error) {
      var errorMessage = 'Could not authenticate. Pleae try again later.';

      if (error.message != null) {
        errorMessage = error.message;
      }
      print(errorMessage);
    } catch (error) {
      print(error);
    }
  }

  String getUser() {
    return auth.currentUser.uid;
  }
}
