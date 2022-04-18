import 'package:flutter/material.dart';

import 'rider_model.dart';

class CalculatePoints extends ChangeNotifier {
  final double first = 25;
  final double second = 20;
  final double third = 16;

  final double fourth = 16;
  final double fourthInRange = 13;
  final double fifth = 13;
  final double sixth = 13;
  final double fifthSixthInRange = 11;

  final double seventh = 11;
  final double seventhInRange = 9;
  final double eighth = 9;
  final double ninth = 9;
  final double tenth = 9;
  final double eighthNinthTenthInRange = 7.5;

  final double eleventh = 7.5;
  final double eleventhInRange = 5;
  final double twelfth = 5;
  final double thirteenth = 5;
  final double fourteenth = 5;
  final double fifteenth = 5;
  final double lastFourInRange = 3;

  double pointsTotal = 0;

  List compareResults(List<Rider> userPicks, List finalResults) {
    int _count = 0;
    while (_count < userPicks.length) {
      // Podium comparisons
      if (userPicks[0].id == finalResults[0]) {
        userPicks[0].correctPick = true;
        pointsTotal += first;
        userPicks[0].points = first;
      }
      if (userPicks[1].id == finalResults[1]) {
        userPicks[1].correctPick = true;
        userPicks[1].points = second;
      }
      if (userPicks[2].id == finalResults[2]) {
        userPicks[2].correctPick = true;
        userPicks[2].points = third;
      }

      // 4th pick (2nd row), exact or in range??
      if (userPicks[3].id == finalResults[3]) {
        userPicks[3].correctPick = true;
        userPicks[3].points = fourth;
        pointsTotal += fourth; // Exact
      } else if (userPicks[3].id == finalResults[4] ||
          userPicks[3].id == finalResults[5]) {
        userPicks[3].correctPick = true;
        userPicks[3].points = fourthInRange; // In Range
      }

      // 5th pick (2nd row), exact or in range??
      if (userPicks[4].id == finalResults[4]) {
        userPicks[4].correctPick = true;
        userPicks[4].points = fifth; // Exact
      } else if (userPicks[4].id == finalResults[3] ||
          userPicks[4].id == finalResults[5]) {
        userPicks[4].correctPick = true;
        userPicks[4].points = fifthSixthInRange; // In Range
      }

      // 6th pick (2nd row), exact or in range??
      if (userPicks[5].id == finalResults[5]) {
        userPicks[5].correctPick = true;
        userPicks[5].points = sixth; // Exact
      } else if (userPicks[5].id == finalResults[4] ||
          userPicks[5].id == finalResults[3]) {
        userPicks[5].correctPick = true;
        userPicks[5].points = fifthSixthInRange; // In Range
      }

      // 7th pick (3rd row), exact or in range??
      if (userPicks[6].id == finalResults[6]) {
        userPicks[6].correctPick = true;
        userPicks[6].points = seventh; // Exact
      } else if (userPicks[6].id == finalResults[7] ||
          userPicks[6].id == finalResults[8] ||
          userPicks[6].id == finalResults[9]) {
        userPicks[6].correctPick = true;
        userPicks[6].points = seventhInRange; // In Range
      }

      // 8th pick (3rd row), exact or in range??
      if (userPicks[7].id == finalResults[7]) {
        userPicks[7].correctPick = true;
        userPicks[7].points = eighth; // Exact
      } else if (userPicks[7].id == finalResults[6] ||
          userPicks[7].id == finalResults[8] ||
          userPicks[7].id == finalResults[9]) {
        userPicks[7].correctPick = true;
        userPicks[7].points = eighthNinthTenthInRange; // In Range
      }

      // 9th pick (3rd row), exact or in range??
      if (userPicks[8].id == finalResults[8]) {
        userPicks[8].correctPick = true;
        userPicks[8].points = ninth; // Exact
      } else if (userPicks[8].id == finalResults[6] ||
          userPicks[8].id == finalResults[7] ||
          userPicks[8].id == finalResults[9]) {
        userPicks[8].correctPick = true;
        userPicks[8].points = eighthNinthTenthInRange; // In Range
      }

      // 10th pick (4rd row), exact or in range??
      if (userPicks[9].id == finalResults[9]) {
        userPicks[9].correctPick = true;
        userPicks[9].points = tenth; // Exact
      } else if (userPicks[9].id == finalResults[6] ||
          userPicks[9].id == finalResults[7] ||
          userPicks[9].id == finalResults[8]) {
        userPicks[9].correctPick = true;
        userPicks[9].points = eighthNinthTenthInRange; // In Range
      }

      // 11th pick (4rd row), exact or in range??
      if (userPicks[10].id == finalResults[10]) {
        userPicks[10].correctPick = true;
        userPicks[10].points = eleventh; // Exact
      } else if (userPicks[10].id == finalResults[11] ||
          userPicks[10].id == finalResults[12] ||
          userPicks[10].id == finalResults[13] ||
          userPicks[10].id == finalResults[14]) {
        userPicks[10].correctPick = true;
        userPicks[10].points = eleventhInRange; // In Range
      }

      // 12th pick (4rd row), exact or in range??
      if (userPicks[11].id == finalResults[11]) {
        userPicks[11].correctPick = true;
        userPicks[11].points = twelfth; // Exact
      } else if (userPicks[11].id == finalResults[10] ||
          userPicks[11].id == finalResults[12] ||
          userPicks[11].id == finalResults[13] ||
          userPicks[11].id == finalResults[14]) {
        userPicks[11].correctPick = true;
        userPicks[11].points = lastFourInRange; // In Range
      }

      // 13th pick (5rd row), exact or in range??
      if (userPicks[12].id == finalResults[12]) {
        userPicks[12].correctPick = true;
        userPicks[12].points = thirteenth; // Exact
      } else if (userPicks[12].id == finalResults[10] ||
          userPicks[12].id == finalResults[11] ||
          userPicks[12].id == finalResults[13] ||
          userPicks[12].id == finalResults[14]) {
        userPicks[12].correctPick = true;
        userPicks[12].points = lastFourInRange; // In Range
      }

      // 14th pick (5rd row), exact or in range??
      if (userPicks[13].id == finalResults[13]) {
        userPicks[13].correctPick = true;
        userPicks[13].points = fourteenth; // Exact
      } else if (userPicks[13].id == finalResults[10] ||
          userPicks[13].id == finalResults[11] ||
          userPicks[13].id == finalResults[12] ||
          userPicks[13].id == finalResults[14]) {
        userPicks[13].correctPick = true;
        userPicks[13].points = lastFourInRange; // In Range
      }

      // 15th pick (5rd row), exact or in range??
      if (userPicks[14].id == finalResults[14]) {
        userPicks[14].correctPick = true;
        userPicks[14].points = fifteenth; // Exact
      } else if (userPicks[14].id == finalResults[10] ||
          userPicks[14].id == finalResults[11] ||
          userPicks[14].id == finalResults[12] ||
          userPicks[14].id == finalResults[13]) {
        userPicks[14].correctPick = true;
        userPicks[14].points = lastFourInRange; // In Range
      }
      _count++;
    }

    return userPicks;
  }
}
