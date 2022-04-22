import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import './grid_provider.dart';
import './authenticate.dart';
import 'rider_model.dart';
import './rider_data.dart';
import '../screens/select_rider_screen.dart';

class FirebaseActions with ChangeNotifier {
  final _firebaseActions = FirebaseFirestore.instance;
  Authenticate _auth = Authenticate();
  Map _retrievedResultsData = Map();

  // Go to PickRiderScreen and retrieve selected rider and
  // add selected rider to the grid
  void goToPickRiderScreen(BuildContext ctx, int gridPosition) async {
    var _gridProvider = Provider.of<GridProvider>(ctx, listen: false);
    _gridProvider.unorderedListOfRiders = await getFirebaseRiderList();

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

  Future getFirebaseRiderList() async {
    var teamList;
    try {
      teamList = await FirebaseFirestore.instance.collection('riders').get();
      return teamList.docs.map((e) => e.data()).toList();
    } on PlatformException catch (error) {
      String errorMessage = 'Could not contact server. Pleae try again later.';
      if (error.message != null) {
        errorMessage = error.message;
      }
      print(errorMessage);
    } catch (error) {
      print(error);
    }
  }

  Future<List> getFinalResults(BuildContext ctx, String currentRound) async {
    List _resultsList = List.generate(15, (index) => [], growable: true);
    try {
      var retrieveResults = await FirebaseFirestore.instance
          .collection('2021Results')
          .doc(currentRound)
          .get();
      _retrievedResultsData = retrieveResults.get('raceResults');
      _retrievedResultsData.entries.forEach(
        (element) => _resultsList.setAll(
          int.parse(element.key),
          [element.value],
        ),
      );
    } on PlatformException catch (error) {
      String errorMessage = 'Could not contact server. Pleae try again later.';
      if (error.message != null) {
        errorMessage = error.message;
      }
      print(errorMessage);
    } catch (error) {
      print(error);
    }
    return _resultsList;
  }

  getUserPicks(BuildContext ctx, String currentRound) async {
    var _rider = Provider.of<RiderData>(ctx, listen: false);

    List<Rider> _tempUserPicksList =
        List<Rider>.generate(15, (index) => Rider(), growable: true);
    Map _getUserPicksData = {};
    try {
      var _getUserPicks = await FirebaseFirestore.instance
          .collection('users')
          .doc(_auth.getUser())
          .collection('picks')
          .doc(currentRound)
          .get();
      _getUserPicksData = _getUserPicks.data();
      _getUserPicksData.entries.forEach((element) {
        _tempUserPicksList[int.parse(element.key)] =
            _rider.riderData['${element.value}'];
      });
      return _tempUserPicksList;
    } on PlatformException catch (error) {
      var errorMessage = 'Could not contact server. Pleae try again later.';
      if (error.message != null) {
        errorMessage = error.message;
      }
      print(errorMessage);
    } catch (error) {
      print(error);
    }
    return _tempUserPicksList;
  }

  Future<void> savePicksToServer(BuildContext ctx, String currentRound) async {
    var _gridProvider = Provider.of<GridProvider>(ctx, listen: false);

    _firebaseActions
        .collection('users')
        .doc(_auth.getUser())
        .collection('picks')
        .doc(currentRound)
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
}
