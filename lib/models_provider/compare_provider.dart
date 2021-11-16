import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import './firebase_actions.dart';

class CompareProvider with ChangeNotifier {
  final firebaseActions = FirebaseActions();
  List firebaseRiderList = [];

  Future<List> getRiderList() async {
    return await firebaseActions.getFirebaseRiderList();
  }
}
