import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl_standalone.dart';

import '../screens/pick_rider_screen.dart';
import 'riderModel.dart';

class GridModel extends ChangeNotifier {
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

  var finalGridPositionList = List<Rider>.generate(15, (index) => Rider());

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

  void removeGridSpotImage(Rider rider) {
    updateSelectedRiderPositions(rider, rider.gridPosition, true);
  }

  void removeRiderFromGridPositionList(Rider rider) {
    finalGridPositionList.removeAt(rider.gridPosition);
  }

  void addRiderToGridPositionList(Rider rider, int gridPosition) {
    if (finalGridPositionList.contains(rider)) {
      removeRiderFromGridPositionList(rider);
      removeGridSpotImage(rider);
    }
    rider.gridPosition = gridPosition;
    finalGridPositionList.setAll(gridPosition, [rider]);
    updateSelectedRiderPositions(rider, gridPosition, false);
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
            firstPlaceGridrider.image = 'assets/images/genericPerson.png';
            notifyListeners();
            return;
          }
          firstPlaceGridrider = rider;
          firstPlaceGridrider.gridPosition = gridPosition;
          notifyListeners();
          return;
        }
      case 1:
        {
          if (onGrid) {
            secondPlaceGridrider.image = 'assets/images/genericPerson.png';
            notifyListeners();
            return;
          }
          secondPlaceGridrider = rider;
          notifyListeners();
          return;
        }
      case 2:
        {
          if (onGrid) {
            thirdPlaceGridrider.image = 'assets/images/genericPerson.png';
            notifyListeners();
            return;
          }
          thirdPlaceGridrider = rider;
          notifyListeners();
          return;
        }
      case 3:
        {
          if (onGrid) {
            fourthPlaceGridrider.image = 'assets/images/genericPerson.png';
            notifyListeners();
            return;
          }
          fourthPlaceGridrider = rider;
          notifyListeners();
          return;
        }
      case 4:
        {
          if (onGrid) {}
          fifthPlaceGridrider = rider;
          notifyListeners();
          return;
        }
      case 5:
        {
          if (onGrid) {}
          sixthPlaceGridrider = rider;
          notifyListeners();
          return;
        }
      case 6:
        {
          if (onGrid) {}
          seventhPlaceGridrider = rider;
          notifyListeners();
          return;
        }
      case 7:
        {
          if (onGrid) {}
          eighthPlaceGridrider = rider;
          notifyListeners();
          return;
        }
      case 8:
        {
          if (onGrid) {}
          ninthPlaceGridrider = rider;
          notifyListeners();
          return;
        }
      case 9:
        {
          if (onGrid) {}
          tenthPlaceGridrider = rider;
          notifyListeners();
          return;
        }
      case 10:
        {
          if (onGrid) {}
          eleventhPlaceGridrider = rider;
          notifyListeners();
          return;
        }
      case 11:
        {
          if (onGrid) {}
          twelfthPlaceGridrider = rider;
          notifyListeners();
          return;
        }
      case 12:
        {
          if (onGrid) {}
          thirteenthPlaceGridrider = rider;
          notifyListeners();
          return;
        }
      case 13:
        {
          if (onGrid) {}
          fourteenthPlaceGridrider = rider;
          notifyListeners();
          return;
        }
      case 14:
        {
          if (onGrid) {}
          fifteenthPlaceGridrider = rider;
          notifyListeners();
          return;
        }
    }
  }
}
