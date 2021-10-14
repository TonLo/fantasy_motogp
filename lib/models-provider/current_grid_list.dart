import 'package:flutter/material.dart';

import './riderModel.dart';
import '../pick_widgets/first_pick.dart';
import '../pick_widgets/second_pick.dart';

class CurrentGridList with ChangeNotifier {
  // List for storing rider picks
  List<Map> finalPicksList = [];
  FirstPick fp = new FirstPick();
  SecondPick secondPick = SecondPick();

  

  void updateFinalPicksList(Rider rider, int gridPosition) {
    // Identifying if a rider has already been selected
    if (finalPicksList.contains(rider.id)) {
      // Finding where on the grid the rider was selected
      var duplicatePick =
          finalPicksList.firstWhere((element) => element['id'] == rider.id);
      // Updated where on the grid the rider has been moved
      // The index of the list stays the same but the map key is updated
      // to know where the rider is being moved
      finalPicksList[finalPicksList.indexOf(duplicatePick)]['gridPosition'] =
          gridPosition;

      // Function for swapping the location of riders on the grid
      swapSelectedRiderPositions(duplicatePick['gridPosition']);

      //return false;
    }
    addRiderToGridPosition(rider, gridPosition);

    //return true;
  }

  void addRiderToGridPosition(Rider rider, int gridPosition) {
    finalPicksList.add({
      'id': rider.id,
      'image': rider.image,
      'name': rider.name,
      'team': rider.team,
      'gridPosition': gridPosition
    });
  }

  void swapSelectedRiderPositions(int gridPosition) {

    switch(gridPosition){
      case 0: {
        
      }
    }
  }
}
