import 'package:fantasy_motogp/models_provider/race_dates.dart';
import 'package:flutter/material.dart';
import './race_week_info_model.dart';

class RaceWeekProvider extends ChangeNotifier {
  final CurrentTime = DateTime.now();
  final raceDates = RaceDates();

  String getRaceWeek(DateTime currentDate) {
    if (currentDate.isAfter(raceDates.qatarRaceWeek.start) &&
        currentDate.isBefore(raceDates.qatarRaceWeek.end)) {
      return 'round1';
    } else if (currentDate.isAfter(raceDates.indonesiaRaceWeek.start) &&
        currentDate.isBefore(raceDates.indonesiaRaceWeek.end)) {
      return 'round2';
    } else if (currentDate.isAfter(raceDates.argentinaRaceWeek.start) &&
        currentDate.isBefore(raceDates.argentinaRaceWeek.end)) {
      return 'round3';
    } else if (currentDate.isAfter(raceDates.americasRaceWeek.start) &&
        currentDate.isBefore(raceDates.americasRaceWeek.end)) {
      return 'round4';
    } else if (currentDate.isAfter(raceDates.portugalRaceWeek.start) &&
        currentDate.isBefore(raceDates.portugalRaceWeek.end)) {
      return 'round5';
    } else if (currentDate.isAfter(raceDates.jerezRaceWeek.start) &&
        currentDate.isBefore(raceDates.jerezRaceWeek.end)) {
      return 'round6';
    } else if (currentDate.isAfter(raceDates.frenchRaceWeek.start) &&
        currentDate.isBefore(raceDates.frenchRaceWeek.end)) {
      return 'round7';
    } else if (currentDate.isAfter(raceDates.mugelloRaceWeek.start) &&
        currentDate.isBefore(raceDates.mugelloRaceWeek.end)) {
      return 'round8';
    } else if (currentDate.isAfter(raceDates.catalunyaRaceWeek.start) &&
        currentDate.isBefore(raceDates.catalunyaRaceWeek.end)) {
      return 'round9';
    } else if (currentDate.isAfter(raceDates.germanRaceWeek.start) &&
        currentDate.isBefore(raceDates.germanRaceWeek.end)) {
      return 'round10';
    } else if (currentDate.isAfter(raceDates.assenRaceWeek.start) &&
        currentDate.isBefore(raceDates.assenRaceWeek.end)) {
      return 'round11';
    }
  }

  final Map eventData = {
    'round1': RaceWeek(
      id: 'round1',
      eventName: 'Grand Prix of Qatar',
      raceWeekDateRange: DateTimeRange(
        start: DateTime(2022, 3, 3),
        end: DateTime(2022, 3, 7),
      ),
      submissionCutoff: DateTime(2022, 3, 6, 11),
    )
  };
}
