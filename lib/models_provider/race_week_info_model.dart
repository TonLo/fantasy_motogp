import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class RaceWeek {
  String id;
  String eventName;
  DateTimeRange raceWeekDateRange;
  DateTime submissionCutoff;
  DateTime raceDay;

  RaceWeek(
      {this.id,
      this.eventName,
      this.raceWeekDateRange,
      this.submissionCutoff,
      this.raceDay});
}
