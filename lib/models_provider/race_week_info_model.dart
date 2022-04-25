import 'package:flutter/material.dart';

class RaceWeek {
  String id;
  String eventName;
  String trackName;
  String round;
  DateTimeRange raceWeekDateRange;
  DateTime submissionCutoff;
  DateTime raceDay;

  RaceWeek(
      {this.id,
      this.eventName,
      this.trackName,
      this.round,
      this.raceWeekDateRange,
      this.submissionCutoff,
      this.raceDay});
}
