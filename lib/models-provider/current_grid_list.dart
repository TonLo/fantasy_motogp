
import 'package:flutter/material.dart';

import './riderModel.dart';
import '../screens/pick_rider_screen.dart';
import 'grid_model.dart';

class CurrentGridList with ChangeNotifier {
  // List for storing rider picks
  List<Map> finalGridPositionList = [];
  //var _firstPlaceModel = FirstPlaceModel();

  // this will be the parent class of all the pick model classes
  // this will hold the list of picks and in the switch statement
  // will pass the selected rider to each corresponding pick

  Future<void> goToPickRiderScreen(BuildContext ctx, int gridPosition) async {
    final Rider _selectedRider = await Navigator.push(
      ctx,
      MaterialPageRoute(builder: (context) => PickRiderScreen()),
    );
    
    updateFinalPicksList(_selectedRider, gridPosition);
  }

  void updateFinalPicksList(Rider rider, int gridPosition) {
    // Identifying if a rider has already been selected
    if (finalGridPositionList.contains(rider.id)) {
      // Finding where on the grid the rider was selected
      var duplicatePick = finalGridPositionList
          .firstWhere((element) => element['id'] == rider.id);
      // Updated where on the grid the rider has been moved
      // The index of the list stays the same but the map key is updated
      // to know where the rider is being moved
      finalGridPositionList[finalGridPositionList.indexOf(duplicatePick)]
          ['gridPosition'] = gridPosition;

      // Function for swapping the location of riders on the grid
      updateSelectedRiderPositions(rider, duplicatePick['gridPosition']);

      //return false;
    }
    addRiderToGridPositionList(rider, gridPosition);
    updateSelectedRiderPositions(rider, gridPosition);

    //return true;
  }

  void addRiderToGridPositionList(Rider rider, int gridPosition) {
    finalGridPositionList.add({
      'id': rider.id,
      'image': rider.image,
      'name': rider.name,
      'team': rider.team,
      'gridPosition': gridPosition
    });
  }

  void moveRiderToDifferentGridPosition(){

  }

  void updateSelectedRiderPositions(Rider rider, int gridPosition) {
    switch (gridPosition) {
      case 0:
        {
          //_firstPlaceModel.updateGridRider(rider, rider.image);
        }
    }
  }
}
