import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './grid_provider.dart';
import './authenticate.dart';
import './riderModel.dart';
import '../screens/select_rider_screen.dart';

class FirebaseActions with ChangeNotifier {
  final _firebaseActions = FirebaseFirestore.instance;
  Authenticate _auth = Authenticate();
  Map retrievedResultsData = Map();
  Map finalUserPicksData = Map();

  String _round;

  // Go to PickRiderScreen and retrieve selected rider and
  // add selected rider to the grid
  void goToPickRiderScreen(BuildContext ctx, int gridPosition) async {
    var _gridProvider = Provider.of<GridProvider>(ctx, listen: false);
    _gridProvider.unorderedListOfRiders = await getFirebaseRiderList();
    // _gridProvider.orderedListOfRiders =
    //     orderRiderList(_gridProvider.unorderedListOfRiders);

    Rider _selectedRider = await Navigator.push(
      ctx,
      MaterialPageRoute(builder: (context) => SelectRiderScreen()),
    );
    // Sends currently selected rider and grid position data
    _gridProvider.addRiderToGridPositionList(_selectedRider, gridPosition);
  }

  List orderRiderList(List unorderedList) {
    Rider rider = Rider();
    List orderedList = [];
    for (int i = 0; i < unorderedList.length; i++) {
      rider = Rider(
        id: unorderedList[i]['id'],
        name: unorderedList[i]['name'],
        image: unorderedList[i]['image'],
        team: unorderedList[i]['team'],
      );
      orderedList.add(rider);
    }

    return orderedList;
  }

  Future<List> getFirebaseRiderList() async {
    var teamList = await FirebaseFirestore.instance.collection('riders').get();
    return teamList.docs.map((e) => e.data()).toList();
  }

  Future<void> retrieveFinalResults(BuildContext ctx) async {
    var _gridProvider = Provider.of<GridProvider>(ctx, listen: false);

    var retrieveResults = await FirebaseFirestore.instance
        .collection('2021Results')
        .doc('round2')
        .get();

    retrievedResultsData = retrieveResults.get('raceResults');
    retrievedResultsData.entries.forEach(
      (element) => _gridProvider.finalResultsList.setAll(
        int.parse(element.key),
        [element.value],
      ),
    );
  }

  void retrieveFinalUserPicks(BuildContext ctx) async {
    var _gridProvider = Provider.of<GridProvider>(ctx, listen: false);

    var retrieveUserPicks = await FirebaseFirestore.instance
        .collection('users')
        .doc('round1')
        .get();

    var riderList =
        await FirebaseFirestore.instance.collection('riders').doc().get();

    finalUserPicksData = retrieveUserPicks.data();
    finalUserPicksData.entries.forEach(
      (element) => _gridProvider.finalUserPickList.setAll(
        int.parse(element.key),
        [element.value],
      ),
    );
  }

  Future<void> savePicksToServer(BuildContext ctx) async {
    var _gridProvider = Provider.of<GridProvider>(ctx, listen: false);

    _firebaseActions
        .collection('users')
        .doc(_auth.getUser())
        .collection('picks')
        .doc('round1')
        .set({
      '0': _gridProvider.finalUserPickList[0].id,
      '1': _gridProvider.finalUserPickList[1].id,
      '2': _gridProvider.finalUserPickList[2].id,
      '3': _gridProvider.finalUserPickList[3].id,
      '4': _gridProvider.finalUserPickList[4].id,
      '5': _gridProvider.finalUserPickList[5].id,
      '6': _gridProvider.finalUserPickList[6].id,
      '7': _gridProvider.finalUserPickList[7].id,
      '8': _gridProvider.finalUserPickList[8].id,
      '9': _gridProvider.finalUserPickList[9].id,
      '10': _gridProvider.finalUserPickList[10].id,
      '11': _gridProvider.finalUserPickList[11].id,
      '12': _gridProvider.finalUserPickList[12].id,
      '13': _gridProvider.finalUserPickList[13].id,
      '14': _gridProvider.finalUserPickList[14].id,
    });
  }

  // This will
  void currentRound(int weekend) {
    switch (weekend) {
      case 0:
        {
          _round = 'round1';
          return;
        }
    }
  }
}
