import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl_standalone.dart';

import '../screens/pick_rider_screen.dart';
import 'riderModel.dart';

class GridModel extends ChangeNotifier {
  Rider firstPlaceGridRider = Rider();
  Rider secondPlaceGridRider = Rider();
  Rider thirdPlaceGridRider = Rider();
  Rider fourthPlaceGridRider = Rider();
  Rider fifthPlaceGridRider = Rider();
  Rider sixthPlaceGridRider = Rider();
  Rider seventhPlaceGridRider = Rider();
  Rider eighthPlaceGridRider = Rider();
  Rider ninthPlaceGridRider = Rider();
  Rider tenthPlaceGridRider = Rider();
  Rider eleventhPlaceGridRider = Rider();
  Rider twelfthPlaceGridRider = Rider();
  Rider thirteenthPlaceGridRider = Rider();
  Rider fourteenthPlaceGridRider = Rider();
  Rider fifteenthPlaceGridRider = Rider();
  Rider _emptyRider = Rider();
  Rider _oldRider = Rider();

  var finalGridPositionList =
      List<Rider>.generate(15, (index) => Rider(), growable: true);

  void goToPickRiderScreen(BuildContext ctx, int gridPosition) async {
    Rider _selectedRider = await Navigator.push(
      ctx,
      MaterialPageRoute(builder: (context) => PickRiderScreen()),
    );
    
    addRiderToGridPositionList(_selectedRider, gridPosition);
    //updateSelectedRiderPositions(_selectedRider, gridPosition);
  }

  // Returns a the
  int getCurrentRiderGridPosition(Rider rider) =>
      finalGridPositionList.indexOf(rider);

  void removeGridSpotImage() {
    updateSelectedRiderPositions(_oldRider, _oldRider.gridPosition, true);
  }

  void removeRiderFromGridPositionList() {
    //finalGridPositionList.removeAt(_oldRider.gridPosition);
    finalGridPositionList.setAll(_oldRider.gridPosition, [_emptyRider]);
  }

  void identifyOldRiderPosition(Rider rider) {
    final index = finalGridPositionList.indexWhere((e) => e.id == rider.id);
    _oldRider = finalGridPositionList[index];
    //_oldRider = rider;
  }

  bool containsRider(Rider rider) {
    final conatinsRider = finalGridPositionList.where((e) => e.id == rider.id);

    if (conatinsRider.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  void addRiderToGridPositionList(Rider rider, int gridPosition) {
    if (containsRider(rider) == true) {
      identifyOldRiderPosition(rider);
      removeRiderFromGridPositionList();
      removeGridSpotImage();
    }
    rider.gridPosition = gridPosition;
    finalGridPositionList.setAll(gridPosition, [rider]);
    updateSelectedRiderPositions(rider, gridPosition, false);
    _oldRider = _emptyRider;
    print(finalGridPositionList[gridPosition].name);
    // finalGridPositionList.add({
    //   'id': rider.id,
    //   'image': rider.image,
    //   'name': rider.name,
    //   'team': rider.team,
    //   'gridPosition': gridPosition
    // });
    // finalGridPositionList.setRange(
    //   gridPosition,
    //   gridPosition,
    //   [
    //     {
    //       'id': rider.id,
    //       'name': rider.name,
    //       'image': rider.image,
    //       'team': rider.team,
    //       'gridPosition': rider.gridPosition
    //     }
    //   ],
    // );
  }

  void updateSelectedRiderPositions(
      Rider rider, int gridPosition, bool onGrid) {
    switch (gridPosition) {
      case 0:
        {
          if (onGrid) {
            firstPlaceGridRider.image = 'assets/images/genericPerson.png';
            notifyListeners();
            return;
          }
          firstPlaceGridRider = rider;
          firstPlaceGridRider.gridPosition = gridPosition;
          notifyListeners();
          return;
        }
      case 1:
        {
          if (onGrid) {
            secondPlaceGridRider.image = 'assets/images/genericPerson.png';
            notifyListeners();
            return;
          }
          secondPlaceGridRider = rider;
          secondPlaceGridRider.gridPosition = gridPosition;
          notifyListeners();
          return;
        }
      case 2:
        {
          if (onGrid) {
            thirdPlaceGridRider.image = 'assets/images/genericPerson.png';
            notifyListeners();
            return;
          }
          thirdPlaceGridRider = rider;
          thirdPlaceGridRider.gridPosition = gridPosition;
          notifyListeners();
          return;
        }
      case 3:
        {
          if (onGrid) {
            fourthPlaceGridRider.image = 'assets/images/genericPerson.png';
            notifyListeners();
            return;
          }
          fourthPlaceGridRider = rider;
          fourthPlaceGridRider.gridPosition = gridPosition;
          notifyListeners();
          return;
        }
      case 4:
        {
          if (onGrid) {
            fifthPlaceGridRider.image = 'assets/images/genericPerson.png';
            notifyListeners();
            return;
          }
          fifthPlaceGridRider = rider;
          fifthPlaceGridRider.gridPosition = gridPosition;
          notifyListeners();
          return;
        }
      case 5:
        {
          if (onGrid) {
            sixthPlaceGridRider.image = 'assets/images/genericPerson.png';
            notifyListeners();
            return;
          }
          sixthPlaceGridRider = rider;
          sixthPlaceGridRider.gridPosition = gridPosition;
          notifyListeners();
          return;
        }
      case 6:
        {
          if (onGrid) {
            seventhPlaceGridRider.image = 'assets/images/genericPerson.png';
            notifyListeners();
            return;
          }
          seventhPlaceGridRider = rider;
          seventhPlaceGridRider.gridPosition = gridPosition;
          notifyListeners();
          return;
        }
      case 7:
        {
          if (onGrid) {
            eighthPlaceGridRider.image = 'assets/images/genericPerson.png';
            notifyListeners();
            return;
          }
          eighthPlaceGridRider = rider;
          eighthPlaceGridRider.gridPosition = gridPosition;
          notifyListeners();
          return;
        }
      case 8:
        {
          if (onGrid) {
            ninthPlaceGridRider.image = 'assets/images/genericPerson.png';
            notifyListeners();
            return;
          }
          ninthPlaceGridRider = rider;
          ninthPlaceGridRider.gridPosition = gridPosition;
          notifyListeners();
          return;
        }
      case 9:
        {
          if (onGrid) {
            tenthPlaceGridRider.image = 'assets/images/genericPerson.png';
            notifyListeners();
            return;
          }
          tenthPlaceGridRider = rider;
          tenthPlaceGridRider.gridPosition = gridPosition;
          notifyListeners();
          return;
        }
      case 10:
        {
          if (onGrid) {
            eleventhPlaceGridRider.image = 'assets/images/genericPerson.png';
            notifyListeners();
            return;
          }
          eleventhPlaceGridRider = rider;
          eleventhPlaceGridRider.gridPosition = gridPosition;
          notifyListeners();
          return;
        }
      case 11:
        {
          if (onGrid) {
            twelfthPlaceGridRider.image = 'assets/images/genericPerson.png';
            notifyListeners();
            return;
          }
          twelfthPlaceGridRider = rider;
          twelfthPlaceGridRider.gridPosition = gridPosition;
          notifyListeners();
          return;
        }
      case 12:
        {
          if (onGrid) {
            thirteenthPlaceGridRider.image = 'assets/images/genericPerson.png';
            notifyListeners();
            return;
          }
          thirteenthPlaceGridRider = rider;
          thirteenthPlaceGridRider.gridPosition = gridPosition;
          notifyListeners();
          return;
        }
      case 13:
        {
          if (onGrid) {
            fourteenthPlaceGridRider.image = 'assets/images/genericPerson.png';
            notifyListeners();
            return;
          }
          fourteenthPlaceGridRider = rider;
          fourteenthPlaceGridRider.gridPosition = gridPosition;
          notifyListeners();
          return;
        }
      case 14:
        {
          if (onGrid) {
            fifteenthPlaceGridRider.image = 'assets/images/genericPerson.png';
            notifyListeners();
            return;
          }
          fifteenthPlaceGridRider = rider;
          fifteenthPlaceGridRider.gridPosition = gridPosition;
          notifyListeners();
          return;
        }
    }
  }
}
