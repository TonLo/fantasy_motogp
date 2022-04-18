import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import 'rider_model.dart';

class GridProvider extends ChangeNotifier {
  static const String _emptyRiderImage = 'assets/images/genericPerson.png';
  double pointsTotal = 0;

  // Each rider poistion that will be added to the list
  Rider firstPlaceGridRider = Rider();
  bool _firstPlaceEmpty = true;
  Rider secondPlaceGridRider = Rider();
  bool _secondPlaceEmpty = true;
  Rider thirdPlaceGridRider = Rider();
  bool _thirdPlaceEmpty = true;
  Rider fourthPlaceGridRider = Rider();
  bool _fourthPlaceEmpty = true;
  Rider fifthPlaceGridRider = Rider();
  bool _fifthPlaceEmpty = true;
  Rider sixthPlaceGridRider = Rider();
  bool _sixthPlaceEmpty = true;
  Rider seventhPlaceGridRider = Rider();
  bool _seventhPlaceEmpty = true;
  Rider eighthPlaceGridRider = Rider();
  bool _eighthPlaceEmpty = true;
  Rider ninthPlaceGridRider = Rider();
  bool _ninthPlaceEmpty = true;
  Rider tenthPlaceGridRider = Rider();
  bool _tenthPlaceEmpty = true;
  Rider eleventhPlaceGridRider = Rider();
  bool _eleventhPlaceEmpty = true;
  Rider twelfthPlaceGridRider = Rider();
  bool _twelfthPlaceEmpty = true;
  Rider thirteenthPlaceGridRider = Rider();
  bool _thirteenthPlaceEmpty = true;
  Rider fourteenthPlaceGridRider = Rider();
  bool _fourteenthPlaceEmpty = true;
  Rider fifteenthPlaceGridRider = Rider();
  bool _fifteenthPlaceEmpty = true;
  Rider _emptyRider = Rider();
  Rider _oldRider = Rider();

  List unorderedListOfRiders = [];
  List<Rider> orderedListOfRiders = [];

  List finalResultsList = List.generate(15, (index) => [], growable: true);
  List<Rider> retrievedUserPickList =
      List<Rider>.generate(15, (index) => Rider(), growable: true);

  // List for all selected riders
  var finalUserPickList =
      List<Rider>.generate(15, (index) => Rider(), growable: true);

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
    finalUserPickList.setAll(_oldRider.gridPosition, [_emptyRider]);
  }

  // If a rider was previously selected and is now being moved to a different
  // position on the grid, this method will identify where the old position was.
  // With the previous position identified the list can be updated to remove this rider
  // from the previous position
  void identifyOldRiderPosition(Rider rider) {
    final index = finalUserPickList.indexWhere((e) => e.id == rider.id);
    // Updating _oldRider variable with the currently selected rider's previous
    // position values
    _oldRider = finalUserPickList[index];
  }

  // Check if the currently selected rider has previously been selected in a
  // different grid spot
  bool containsRider(Rider rider) {
    final conatinsRider = finalUserPickList.where((e) => e.id == rider.id);
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
    rider?.gridPosition = gridPosition;
    // Adding rider to the selected grid position
    finalUserPickList.setAll(gridPosition, [rider]);
    updateSelectedRiderPositions(rider, gridPosition, false);
    // Resetting _oldRider variable to prevent accidental data mixing
    _oldRider = _emptyRider;
  }

  void removeSelectedRiderWithoutReplacement(int gridPosition) {
    updateSelectedRiderPositions(null, gridPosition, true);
  }

  _swapRider(Rider currentRider, Rider replacementRider, int gridPosition) {
    currentRider = replacementRider;
    currentRider.gridPosition = gridPosition;
    return currentRider;
  }

  _removeRider(Rider rider) {
    rider.image = _emptyRiderImage;
    rider.gridPosition = -1;
    rider.name = '';
    rider.points = -1;
    rider.team = '';
    return rider;
  }

  // Make sure all grid positions have a rider selected before submitting picks
  bool fullGrid() {
    if (true) {
      return true;
    }
    return false;
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
            firstPlaceGridRider = _removeRider(firstPlaceGridRider);
            _firstPlaceEmpty = true;
            notifyListeners();
            return;
          }
          // Update rider image and their grid position, updating position variables
          // grid position may not be necessary
          firstPlaceGridRider =
              _swapRider(firstPlaceGridRider, rider, gridPosition);
          _firstPlaceEmpty = false;
          notifyListeners();
          return;
        }
      case 1:
        {
          if (onGrid) {
            secondPlaceGridRider = _removeRider(secondPlaceGridRider);
            _secondPlaceEmpty = true;
            notifyListeners();
            return;
          }

          secondPlaceGridRider =
              _swapRider(secondPlaceGridRider, rider, gridPosition);
          _secondPlaceEmpty = false;
          notifyListeners();
          return;
        }
      case 2:
        {
          if (onGrid) {
            thirdPlaceGridRider = _removeRider(thirdPlaceGridRider);
            notifyListeners();
            return;
          }
          thirdPlaceGridRider =
              _swapRider(thirdPlaceGridRider, rider, gridPosition);
          notifyListeners();
          return;
        }
      case 3:
        {
          if (onGrid) {
            fourthPlaceGridRider = _removeRider(fourthPlaceGridRider);
            notifyListeners();
            return;
          }
          fourthPlaceGridRider =
              _swapRider(fourthPlaceGridRider, rider, gridPosition);
          notifyListeners();
          return;
        }
      case 4:
        {
          if (onGrid) {
            fifthPlaceGridRider = _removeRider(fifthPlaceGridRider);
            notifyListeners();
            return;
          }
          fifthPlaceGridRider =
              _swapRider(fifthPlaceGridRider, rider, gridPosition);
          notifyListeners();
          return;
        }
      case 5:
        {
          if (onGrid) {
            sixthPlaceGridRider = _removeRider(sixthPlaceGridRider);
            notifyListeners();
            return;
          }
          sixthPlaceGridRider =
              _swapRider(sixthPlaceGridRider, rider, gridPosition);
          notifyListeners();
          return;
        }
      case 6:
        {
          if (onGrid) {
            seventhPlaceGridRider = _removeRider(seventhPlaceGridRider);
            notifyListeners();
            return;
          }
          seventhPlaceGridRider =
              _swapRider(seventhPlaceGridRider, rider, gridPosition);
          notifyListeners();
          return;
        }
      case 7:
        {
          if (onGrid) {
            eighthPlaceGridRider = _removeRider(eighthPlaceGridRider);
            notifyListeners();
            return;
          }
          eighthPlaceGridRider =
              _swapRider(eighthPlaceGridRider, rider, gridPosition);
          notifyListeners();
          return;
        }
      case 8:
        {
          if (onGrid) {
            ninthPlaceGridRider = _removeRider(ninthPlaceGridRider);
            notifyListeners();
            return;
          }
          ninthPlaceGridRider =
              _swapRider(ninthPlaceGridRider, rider, gridPosition);
          notifyListeners();
          return;
        }
      case 9:
        {
          if (onGrid) {
            tenthPlaceGridRider = _removeRider(tenthPlaceGridRider);
            notifyListeners();
            return;
          }
          tenthPlaceGridRider =
              _swapRider(tenthPlaceGridRider, rider, gridPosition);
          notifyListeners();
          return;
        }
      case 10:
        {
          if (onGrid) {
            eleventhPlaceGridRider = _removeRider(eleventhPlaceGridRider);
            notifyListeners();
            return;
          }
          eleventhPlaceGridRider =
              _swapRider(eleventhPlaceGridRider, rider, gridPosition);
          notifyListeners();
          return;
        }
      case 11:
        {
          if (onGrid) {
            twelfthPlaceGridRider = _removeRider(twelfthPlaceGridRider);
            notifyListeners();
            return;
          }
          twelfthPlaceGridRider =
              _swapRider(twelfthPlaceGridRider, rider, gridPosition);
          notifyListeners();
          return;
        }
      case 12:
        {
          if (onGrid) {
            thirteenthPlaceGridRider = _removeRider(thirteenthPlaceGridRider);
            notifyListeners();
            return;
          }
          thirteenthPlaceGridRider =
              _swapRider(thirteenthPlaceGridRider, rider, gridPosition);
          notifyListeners();
          return;
        }
      case 13:
        {
          if (onGrid) {
            fourteenthPlaceGridRider = _removeRider(fourteenthPlaceGridRider);
            notifyListeners();
            return;
          }
          fourteenthPlaceGridRider =
              _swapRider(fourteenthPlaceGridRider, rider, gridPosition);
          notifyListeners();
          return;
        }
      case 14:
        {
          if (onGrid) {
            fifteenthPlaceGridRider = _removeRider(fifteenthPlaceGridRider);
            notifyListeners();
            return;
          }
          fifteenthPlaceGridRider =
              _swapRider(fifteenthPlaceGridRider, rider, gridPosition);
          notifyListeners();
          return;
        }
    }
  }

  void addGridPositionsToFinalUserPickList() {
    finalUserPickList[0] = firstPlaceGridRider;
    finalUserPickList[1] = secondPlaceGridRider;
    finalUserPickList[2] = thirdPlaceGridRider;
    finalUserPickList[3] = fourthPlaceGridRider;
    finalUserPickList[4] = fifthPlaceGridRider;
    finalUserPickList[5] = sixthPlaceGridRider;
    finalUserPickList[6] = seventhPlaceGridRider;
    finalUserPickList[7] = eighthPlaceGridRider;
    finalUserPickList[8] = ninthPlaceGridRider;
    finalUserPickList[9] = tenthPlaceGridRider;
    finalUserPickList[10] = eleventhPlaceGridRider;
    finalUserPickList[11] = twelfthPlaceGridRider;
    finalUserPickList[12] = thirdPlaceGridRider;
    finalUserPickList[13] = fourteenthPlaceGridRider;
    finalUserPickList[14] = fifteenthPlaceGridRider;
  }
}
