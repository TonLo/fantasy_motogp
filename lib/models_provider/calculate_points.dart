import 'package:flutter/material.dart';

import './riderModel.dart';

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
  final double eighthNinthInRange = 7.5;

  final double tenth = 9;
  final double tenthInRange = 7.5;
  final double eleventh = 7.5;
  final double eleventhInRange = 5;
  final double twelfth = 5;
  final double twelfthInRange = 3;

  final double thirteenth = 5;
  final double fourteenth = 5;
  final double fifteenth = 5;
  final double lastRowRange = 3;

  double pointsTotal = 0;

  double compareResults(List<Rider> userPicks, List finalResults) {
    // Podium comparisons
    if (userPicks[0].id == finalResults[0]) {
      pointsTotal += first;
    }
    if (userPicks[1].id == finalResults[1]) {
      pointsTotal += second;
    }
    if (userPicks[2].id == finalResults[2]) {
      pointsTotal += third;
    }

    // 4th pick (2nd row), exact or in range??
    if (userPicks[3].id == finalResults[3]) {
      pointsTotal += fourth; // Exact
    } else if (userPicks[3].id == finalResults[4] ||
        userPicks[3].id == finalResults[5]) {
      pointsTotal += fourthInRange; // In Range
    }

    // 5th pick (2nd row), exact or in range??
    if (userPicks[4].id == finalResults[4]) {
      pointsTotal += fifth; // Exact
    } else if (userPicks[4].id == finalResults[3] ||
        userPicks[4].id == finalResults[5]) {
      pointsTotal += fifthSixthInRange; // In Range
    }

    // 6th pick (2nd row), exact or in range??
    if (userPicks[5].id == finalResults[5]) {
      pointsTotal += sixth; // Exact
    } else if (userPicks[5].id == finalResults[4] ||
        userPicks[5].id == finalResults[3]) {
      pointsTotal += fifthSixthInRange; // In Range
    }

    // 7th pick (3rd row), exact or in range??
    if (userPicks[6].id == finalResults[6]) {
      pointsTotal += seventh; // Exact
    } else if (userPicks[6].id == finalResults[7] ||
        userPicks[6].id == finalResults[8]) {
      pointsTotal += seventhInRange; // In Range
    }

    // 8th pick (3rd row), exact or in range??
    if (userPicks[7].id == finalResults[7]) {
      pointsTotal += eighth; // Exact
    } else if (userPicks[7].id == finalResults[6] ||
        userPicks[7].id == finalResults[8]) {
      pointsTotal += eighthNinthInRange; // In Range
    }

    // 9th pick (3rd row), exact or in range??
    if (userPicks[8].id == finalResults[8]) {
      pointsTotal += ninth; // Exact
    } else if (userPicks[8].id == finalResults[6] ||
        userPicks[8].id == finalResults[7]) {
      pointsTotal += eighthNinthInRange; // In Range
    }

    // 10th pick (4rd row), exact or in range??
    if (userPicks[9].id == finalResults[9]) {
      pointsTotal += tenth; // Exact
    } else if (userPicks[9].id == finalResults[10] ||
        userPicks[9].id == finalResults[11]) {
      pointsTotal += tenthInRange; // In Range
    }

    // 11th pick (4rd row), exact or in range??
    if (userPicks[10].id == finalResults[10]) {
      pointsTotal += eleventh; // Exact
    } else if (userPicks[10].id == finalResults[9] ||
        userPicks[10].id == finalResults[11]) {
      pointsTotal += eleventhInRange; // In Range
    }

    // 12th pick (4rd row), exact or in range??
    if (userPicks[11].id == finalResults[11]) {
      pointsTotal += twelfth; // Exact
    } else if (userPicks[11].id == finalResults[9] ||
        userPicks[11].id == finalResults[10]) {
      pointsTotal += twelfthInRange; // In Range
    }

    // 13th pick (5rd row), exact or in range??
    if (userPicks[12].id == finalResults[12]) {
      pointsTotal += thirteenth; // Exact
    } else if (userPicks[12].id == finalResults[13] ||
        userPicks[12].id == finalResults[14]) {
      pointsTotal += lastRowRange; // In Range
    }

    // 14th pick (5rd row), exact or in range??
    if (userPicks[13].id == finalResults[13]) {
      pointsTotal += fourteenth; // Exact
    } else if (userPicks[13].id == finalResults[12] ||
        userPicks[13].id == finalResults[14]) {
      pointsTotal += lastRowRange; // In Range
    }

    // 15th pick (5rd row), exact or in range??
    if (userPicks[14].id == finalResults[14]) {
      pointsTotal += fifteenth; // Exact
    } else if (userPicks[14].id == finalResults[12] ||
        userPicks[14].id == finalResults[13]) {
      pointsTotal += lastRowRange; // In Range
    }

    return pointsTotal;
  }
}
