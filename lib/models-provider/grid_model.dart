import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import '../screens/pick_rider_screen.dart';
import 'riderModel.dart';
import 'grid_points.dart';

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
  GridPoints gridPoints = GridPoints();

  // List for all selected riders
  var finalGridPositionList =
      List<Rider>.generate(15, (index) => Rider(), growable: true);

  // Go to PickRiderScreen and retrieve selected rider and
  // add selected rider to the grid
  void goToPickRiderScreen(BuildContext ctx, int gridPosition) async {
    Rider _selectedRider = await Navigator.push(
      ctx,
      MaterialPageRoute(builder: (context) => PickRiderScreen()),
    );
    // Sends currently selected rider and grid position data
    addRiderToGridPositionList(_selectedRider, gridPosition);
  }

  // Changed the grid position variable's image to and empty rider image
  // Grid position variable is mainly created to hold the rider image and
  // will technically still be holding all the information of the previously
  // selected rider after method execution, the previously selected rider will
  // simply have the image updated to empty rider
  void removeGridSpotImage() {
    updateSelectedRiderPositions(_oldRider, _oldRider.gridPosition, true);
  }

  // Removes rider from old grid position if they were previously selected
  // and are now being moved to a new position
  void removeRiderFromGridPositionList() {
    // Sets the rider at this specific index to an empty rider...all null values
    finalGridPositionList.setAll(_oldRider.gridPosition, [_emptyRider]);
  }

  // If a rider was previously selected and is now being moved to a different
  // position on the grid, this method will identify where the old position was.
  // With the previous position identified the list can be updated to remove this rider
  // from the previous position
  void identifyOldRiderPosition(Rider rider) {
    final index = finalGridPositionList.indexWhere((e) => e.id == rider.id);
    // Updating _oldRider variable with the currently selected rider's previous
    // position values
    _oldRider = finalGridPositionList[index];
  }

  // Check if the currently selected rider has previously been selected in a
  // different grid spot
  bool containsRider(Rider rider) {
    final conatinsRider = finalGridPositionList.where((e) => e.id == rider.id);
    if (conatinsRider.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  // Method that calls all other methods to update grid postions and images correctly
  // This method also adds a rider that has been selected for the first time to the 
  // grid list
  void addRiderToGridPositionList(Rider rider, int gridPosition) {
    if (containsRider(rider) == true) {
      identifyOldRiderPosition(rider);
      removeRiderFromGridPositionList();
      removeGridSpotImage();
    }
    rider.gridPosition = gridPosition;
    // Adding rider to the selected grid position
    finalGridPositionList.setAll(gridPosition, [rider]);
    updateSelectedRiderPositions(rider, gridPosition, false);
    // Resetting _oldRider variable to prevent accidental data mixing
    _oldRider = _emptyRider;
  }

  // Switch to identify which position is being updated with which rider data
  void updateSelectedRiderPositions(
      Rider rider, int gridPosition, bool onGrid) {
    switch (gridPosition) {
      case 0:
        {
          // If rider was previously selected at another grid position onGrid will
          // be true and will change the rider image to an empty rider.
          if (onGrid) {
            firstPlaceGridRider.image = 'assets/images/genericPerson.png';
            notifyListeners();
            return;
          }
          // Update rider image and their grid position, updating position variables
          // grid position may not be necessary
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
