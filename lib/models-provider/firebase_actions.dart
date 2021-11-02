import 'dart:js';

import 'package:fantasy_motogp/models-provider/authenticate.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'grid_provider.dart';

class FirebaseActions with ChangeNotifier {
  final _firebaseActions = FirebaseFirestore.instance;
  Authenticate auth = Authenticate();
  var _currentUserUid;
  String round;
  

  Future<void> savePicksToServer(BuildContext ctx) async {
    _currentUserUid = auth.getUser();
    var gm = Provider.of<GridProvider>(ctx, listen: false);

    _firebaseActions
        .collection('users')
        .doc(_currentUserUid)
        .collection('picks')
        .doc('round1')
        .set({
      '0': gm.finalGridPositionList[0].id,
      '1': gm.finalGridPositionList[1].id,
      '2': gm.finalGridPositionList[2].id,
      '3': gm.finalGridPositionList[3].id,
      '4': gm.finalGridPositionList[4].id,
      '5': gm.finalGridPositionList[5].id,
      '6': gm.finalGridPositionList[6].id,
      '7': gm.finalGridPositionList[7].id,
      '8': gm.finalGridPositionList[8].id,
      '9': gm.finalGridPositionList[9].id,
      '10': gm.finalGridPositionList[10].id,
      '11': gm.finalGridPositionList[11].id,
      '12': gm.finalGridPositionList[12].id,
      '13': gm.finalGridPositionList[13].id,
      '14': gm.finalGridPositionList[14].id,
    });
  }

  // This will
  void currentRound(int weekend) {
    switch (weekend) {
      case 0:
        {
          round = 'round1';
          return;
        }
    }
  }
}
