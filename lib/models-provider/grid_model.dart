import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';


import '../screens/pick_rider_screen.dart';
import 'riderModel.dart';

class GridModel extends ChangeNotifier {
  List<Map> finalGridPositionList = [];
  Rider firstPlaceGridrider = Rider();
  Rider secondPlaceGridrider = Rider();
  Rider thirdPlaceGridrider = Rider();
  Rider fourthPlaceGridrider = Rider();
  Rider fifthPlaceGridrider = Rider();
  Rider sixthPlaceGridrider = Rider();
  Rider seventhPlaceGridrider = Rider();
  Rider eighthPlaceGridrider = Rider();
  Rider ninthPlaceGridrider = Rider();
  Rider tenthPlaceGridrider = Rider();
  Rider eleventhPlaceGridrider = Rider();
  Rider twelfthPlaceGridrider = Rider();
  Rider thirteenthPlaceGridrider = Rider();
  Rider fourteenthPlaceGridrider = Rider();
  Rider fifteenthPlaceGridrider = Rider();

  void goToPickRiderScreen(BuildContext ctx, int gridPosition) async {
    Rider _selectedRider = await Navigator.push(
      ctx,
      MaterialPageRoute(builder: (context) => PickRiderScreen()),
    );
    //rider = _selectedRider;
    //notifyListeners();
    //updateRiderImage();
    //cgl.updateFinalPicksList(_selectedRider, gridPosition);
    //updateGridRider(_selectedRider);
    updateSelectedRiderPositions(_selectedRider, gridPosition);
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

  void updateSelectedRiderPositions(Rider rider, int gridPosition) {
    switch (gridPosition) {
      case 0:
        {
          //_firstPlaceModel.updateGridRider(rider, rider.image);
          firstPlaceGridrider = rider;
          notifyListeners();
          return;
        }
      case 1:
        {
          secondPlaceGridrider = rider;
          notifyListeners();
          return;
        }
        case 2:
        {
          thirdPlaceGridrider = rider;
          notifyListeners();
          return;
        }
        case 3:
        {
          fourthPlaceGridrider = rider;
          notifyListeners();
          return;
        }
        case 4:
        {
          fifthPlaceGridrider = rider;
          notifyListeners();
          return;
        }
        case 5:
        {
          sixthPlaceGridrider = rider;
          notifyListeners();
          return;
        }
        case 6:
        {
          seventhPlaceGridrider = rider;
          notifyListeners();
          return;
        }
        case 7:
        {
          eighthPlaceGridrider = rider;
          notifyListeners();
          return;
        }
        case 8:
        {
          ninthPlaceGridrider = rider;
          notifyListeners();
          return;
        }
        case 9:
        {
          tenthPlaceGridrider = rider;
          notifyListeners();
          return;
        }
        case 10:
        {
          eleventhPlaceGridrider = rider;
          notifyListeners();
          return;
        }
        case 11:
        {
          twelfthPlaceGridrider = rider;
          notifyListeners();
          return;
        }
        case 12:
        {
          thirteenthPlaceGridrider = rider;
          notifyListeners();
          return;
        }
        case 13:
        {
          fourteenthPlaceGridrider = rider;
          notifyListeners();
          return;
        }
        case 14:
        {
          fifteenthPlaceGridrider = rider;
          notifyListeners();
          return;
        }
    }
  }
}
