import 'package:flutter/material.dart';
import './race_week_info_model.dart';
import './race_dates.dart';

class RaceWeekProvider extends ChangeNotifier {
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
    } else if (currentDate.isAfter(raceDates.finlandRaceWeek.start) &&
        currentDate.isBefore(raceDates.finlandRaceWeek.end)) {
      return 'round12';
    } else if (currentDate.isAfter(raceDates.britishRaceWeek.start) &&
        currentDate.isBefore(raceDates.britishRaceWeek.end)) {
      return 'round13';
    } else if (currentDate.isAfter(raceDates.austrianRaceWeek.start) &&
        currentDate.isBefore(raceDates.austrianRaceWeek.end)) {
      return 'round14';
    } else if (currentDate.isAfter(raceDates.misanoRaceWeek.start) &&
        currentDate.isBefore(raceDates.misanoRaceWeek.end)) {
      return 'round15';
    } else if (currentDate.isAfter(raceDates.aragonRaceWeek.start) &&
        currentDate.isBefore(raceDates.aragonRaceWeek.end)) {
      return 'round16';
    } else if (currentDate.isAfter(raceDates.japanRaceWeek.start) &&
        currentDate.isBefore(raceDates.japanRaceWeek.end)) {
      return 'round17';
    } else if (currentDate.isAfter(raceDates.thailandRaceWeek.start) &&
        currentDate.isBefore(raceDates.thailandRaceWeek.end)) {
      return 'round18';
    } else if (currentDate.isAfter(raceDates.australianRaceWeek.start) &&
        currentDate.isBefore(raceDates.australianRaceWeek.end)) {
      return 'round19';
    } else if (currentDate.isAfter(raceDates.malaysianRaceWeek.start) &&
        currentDate.isBefore(raceDates.malaysianRaceWeek.end)) {
      return 'round20';
    } else if (currentDate.isAfter(raceDates.valenciaRaceWeek.start) &&
        currentDate.isBefore(raceDates.valenciaRaceWeek.end)) {
      return 'round21';
    } else {
      return 'No Race';
    }
  }

  final Map eventData = {
    'round1': RaceWeek(
      id: 'round1',
      eventName: 'Grand Prix of Qatar',
      trackName: 'Losail International Circuit',
      round: '01',
      raceWeekDateRange: DateTimeRange(
        start: DateTime(2022, 3, 3),
        end: DateTime(2022, 3, 7),
      ),
      submissionCutoff: DateTime(2022, 3, 6, 11),
    ),
    'round2': RaceWeek(
      id: 'round2',
      eventName: 'Pertamina Grand Prix of Indonesia',
      trackName: 'Pertamina Mandalika Circuit',
      round: '02',
      raceWeekDateRange: DateTimeRange(
        start: DateTime(2022, 3, 17),
        end: DateTime(2022, 3, 21),
      ),
      submissionCutoff: DateTime(2022, 3, 20, 11),
    ),
    'round3': RaceWeek(
      id: 'round3',
      eventName: 'Gran Premio Michelin® de la República Argentina',
      trackName: 'Termas de Río Honda',
      round: '03',
      raceWeekDateRange: DateTimeRange(
        start: DateTime(2022, 3, 31),
        end: DateTime(2022, 4, 3),
      ),
      submissionCutoff: DateTime(2022, 4, 2, 11),
    ),
    'round4': RaceWeek(
      id: 'round4',
      eventName: 'Red Bull Grand Prix of the Americas',
      trackName: 'Circuit of the Americas',
      round: '04',
      raceWeekDateRange: DateTimeRange(
        start: DateTime(2022, 4, 7),
        end: DateTime(2022, 4, 11),
      ),
      submissionCutoff: DateTime(2022, 4, 10, 11),
    ),
    'round5': RaceWeek(
      id: 'round5',
      eventName: 'Grande Prémio Tissot de Portugal',
      trackName: 'Algarve',
      round: '05',
      raceWeekDateRange: DateTimeRange(
        start: DateTime(2022, 4, 21),
        end: DateTime(2022, 4, 25),
      ),
      submissionCutoff: DateTime(2022, 4, 24, 11),
    ),
    'round6': RaceWeek(
      id: 'round6',
      eventName: 'Gran Premio Red Bull de España',
      trackName: 'Jerez',
      round: '06',
      raceWeekDateRange: DateTimeRange(
        start: DateTime(2022, 4, 28),
        end: DateTime(2022, 5, 2),
      ),
      submissionCutoff: DateTime(2022, 5, 1, 11),
    ),
    'round7': RaceWeek(
      id: 'round7',
      eventName: 'SHARK Grand Prix de France',
      trackName: 'Le Mans',
      round: '07',
      raceWeekDateRange: DateTimeRange(
        start: DateTime(2022, 5, 12),
        end: DateTime(2022, 5, 16),
      ),
      submissionCutoff: DateTime(2022, 5, 15, 11),
    ),
    'round8': RaceWeek(
      id: 'round8',
      eventName: "Gran Premio d'Italia Oakley",
      trackName: 'Mugello',
      round: '08',
      raceWeekDateRange: DateTimeRange(
        start: DateTime(2022, 5, 26),
        end: DateTime(2022, 5, 30),
      ),
      submissionCutoff: DateTime(2022, 5, 29, 11),
    ),
    'round9': RaceWeek(
      id: 'round9',
      eventName: 'Gran Premi Monster Energy de Catalunya',
      trackName: 'Catalunya',
      round: '09',
      raceWeekDateRange: DateTimeRange(
        start: DateTime(2022, 6, 2),
        end: DateTime(2022, 6, 6),
      ),
      submissionCutoff: DateTime(2022, 6, 5, 11),
    ),
    'round10': RaceWeek(
      id: 'round10',
      eventName: 'Liqui Moly Motorrad Grand Prix Deutschland',
      trackName: 'Sachsenring',
      round: '10',
      raceWeekDateRange: DateTimeRange(
        start: DateTime(2022, 6, 16),
        end: DateTime(2022, 6, 20),
      ),
      submissionCutoff: DateTime(2022, 6, 19, 11),
    ),
    'round11': RaceWeek(
      id: 'round11',
      eventName: 'Motul TT Assen',
      trackName: 'Assen',
      round: '11',
      raceWeekDateRange: DateTimeRange(
        start: DateTime(2022, 6, 23),
        end: DateTime(2022, 6, 27),
      ),
      submissionCutoff: DateTime(2022, 6, 26, 11),
    ),
    'round12': RaceWeek(
      id: 'round12',
      eventName: 'Grand Prix of Finland',
      trackName: 'KimiRing',
      round: '12',
      raceWeekDateRange: DateTimeRange(
        start: DateTime(2022, 7, 7),
        end: DateTime(2022, 7, 11),
      ),
      submissionCutoff: DateTime(2022, 7, 10, 11),
    ),
    'round13': RaceWeek(
      id: 'round13',
      eventName: 'British Grand Prix',
      trackName: 'Silverstone',
      round: '13',
      raceWeekDateRange: DateTimeRange(
        start: DateTime(2022, 8, 4),
        end: DateTime(2022, 8, 8),
      ),
      submissionCutoff: DateTime(2022, 8, 7, 11),
    ),
    'round14': RaceWeek(
      id: 'round14',
      eventName: 'Motorrad Grand Prix von Österreich',
      trackName: 'Red Bull Ring',
      round: '14',
      raceWeekDateRange: DateTimeRange(
        start: DateTime(2022, 8, 18),
        end: DateTime(2022, 8, 22),
      ),
      submissionCutoff: DateTime(2022, 8, 21, 11),
    ),
    'round15': RaceWeek(
      id: 'round15',
      eventName: 'Gran Premio di San Marino e della Riviera di Rimini',
      trackName: 'Misano',
      round: '15',
      raceWeekDateRange: DateTimeRange(
        start: DateTime(2022, 9, 1),
        end: DateTime(2022, 9, 5),
      ),
      submissionCutoff: DateTime(2022, 9, 4, 11),
    ),
    'round16': RaceWeek(
      id: 'round16',
      eventName: 'Gran Premio de Aragón',
      trackName: 'Aragón',
      round: '16',
      raceWeekDateRange: DateTimeRange(
        start: DateTime(2022, 9, 15),
        end: DateTime(2022, 9, 19),
      ),
      submissionCutoff: DateTime(2022, 9, 18, 11),
    ),
    'round17': RaceWeek(
      id: 'round17',
      eventName: 'Motul Grand Prix of Japan',
      trackName: 'Motegi',
      round: '17',
      raceWeekDateRange: DateTimeRange(
        start: DateTime(2022, 9, 22),
        end: DateTime(2022, 9, 26),
      ),
      submissionCutoff: DateTime(2022, 9, 25, 11),
    ),
    'round18': RaceWeek(
      id: 'round18',
      eventName: 'Thailand Grand Prix',
      trackName: 'Chang International Circuit',
      round: '18',
      raceWeekDateRange: DateTimeRange(
        start: DateTime(2022, 9, 29),
        end: DateTime(2022, 10, 3),
      ),
      submissionCutoff: DateTime(2022, 10, 2, 11),
    ),
    'round19': RaceWeek(
      id: 'round19',
      eventName: 'Australian Motorcycle Grand Prix',
      trackName: 'Phillip Island',
      round: '19',
      raceWeekDateRange: DateTimeRange(
        start: DateTime(2022, 10, 13),
        end: DateTime(2022, 10, 17),
      ),
      submissionCutoff: DateTime(2022, 10, 16, 11),
    ),
    'round20': RaceWeek(
      id: 'round20',
      eventName: 'PETRONAS Grand Prix of Malaysia',
      trackName: 'Sepang International Circuit',
      round: '20',
      raceWeekDateRange: DateTimeRange(
        start: DateTime(2022, 10, 20),
        end: DateTime(2022, 10, 24),
      ),
      submissionCutoff: DateTime(2022, 10, 23, 11),
    ),
    'round21': RaceWeek(
      id: 'round21',
      eventName: 'Gran Premio Motul de la Comunitat Valenciana',
      trackName: 'Valencia',
      round: '21',
      raceWeekDateRange: DateTimeRange(
        start: DateTime(2022, 11, 3),
        end: DateTime(2022, 11, 7),
      ),
      submissionCutoff: DateTime(2022, 11, 6, 11),
    ),
  };
}
