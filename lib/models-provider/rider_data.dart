import 'package:flutter/foundation.dart';

import './riderModel.dart';
import './rider_variables.dart';
import './selected_riders_map.dart';

class RiderData with ChangeNotifier {
  RiderVariables riderVar = RiderVariables();

  List<Rider> _rider = [
    //Valentino Rossi
    Rider(
      id: 'rossi',
      image: 'assets/images/rossi.jpg',
      name: 'Valentino Rossi',
      team: 'Yamaha',
    ),
    //Maverick Vinales
    Rider(
      id: 'vinales',
      image: 'assets/images/maverick.jpg',
      name: 'Maverick Vinales',
      team: 'Yamaha',
    ),
    //Marc Marquez
    Rider(
      id: 'marquezM',
      image: 'assets/images/marquezM.jpg',
      name: 'Marc Marquez',
      team: 'Honda',
    ),
    //Alex Marquez
    Rider(
      id: 'marquezA',
      image: 'assets/images/marquezA.jpg',
      name: 'Alex Marquez',
      team: 'Honda',
    ),
    //Adrea Dovizioso
    Rider(
      id: 'dovi',
      image: 'assets/images/dovi.jpg',
      name: 'Andrea Dovizioso',
      team: 'Ducati',
    ),
    //Danilo Petrucci
    Rider(
      id: 'petrucci',
      image: 'assets/images/petrucci.jpg',
      name: 'Danilo Petrucci',
      team: 'Ducati',
    ),
    //Alex Rins
    Rider(
      id: 'rins',
      image: 'assets/images/rins.jpg',
      name: 'Alex Rins',
      team: 'Suzuki',
    ),
    //Joan Mir
    Rider(
      id: 'mir',
      image: 'assets/images/mir.jpg',
      name: 'Joan Mir',
      team: 'Suzuki',
    ), //Aleix Espargaro
    Rider(
      id: 'espargaroA',
      image: 'assets/images/espargaroA.jpg',
      name: 'Aleix Espargaro',
      team: 'Aprilia',
    ),
    //Andrea Iannone
    Rider(
      id: 'iannone',
      image: 'assets/images/iannone.jpg',
      name: 'Andrea Iannone',
      team: 'Aprilia',
    ),
    //Jack Miller
    Rider(
      id: 'miller',
      image: 'assets/images/miller.jpg',
      name: 'Jack Miller',
      team: 'Pramac Racing Ducati',
    ),
    //Francesco Bagnaia
    Rider(
      id: 'bagnaia',
      image: 'assets/images/bagnaia.jpg',
      name: 'Francesco Bagnaia',
      team: 'Pramac Racing Ducati',
    ),
    //Fabio Quartararo
    Rider(
      id: 'quartararo',
      image: 'assets/images/quartararo.jpg',
      name: 'Fabio Quartararo',
      team: 'Petronas Yamaha SRT',
    ),
    //Franco Morbidelli
    Rider(
      id: 'morbidelli',
      image: 'assets/images/morbidelli.jpg',
      name: 'Franco Morbidelli',
      team: 'Petronas Yamaha SRT',
    ),
    //Iker Lecuona
    Rider(
      id: 'lecuona',
      image: 'assets/images/lecuona.jpg',
      name: 'Iker Lecuona',
      team: 'Red Bull KTM Tech 3',
    ),
    //Miguel Oliveira
    Rider(
      id: 'oliveira',
      image: 'assets/images/oliveira.jpg',
      name: 'Miguel Oliveira',
      team: 'Red Bull KTM Tech 3',
    ),
    //Pol Espargaro
    Rider(
      id: 'espargaroP',
      image: 'assets/images/espargaroP.jpg',
      name: 'Pol Espargaro',
      team: 'Red Bull KTM',
    ),
    //Brad Binder
    Rider(
      id: 'binder',
      image: 'assets/images/binder.jpg',
      name: 'Brad Binder',
      team: 'Red Bull KTM',
    ),
    //Cal Crutchlow
    Rider(
      id: 'crutchlow',
      image: 'assets/images/crutchlow.jpg',
      name: 'Cal Crutchlow',
      team: 'LCR Honda CASTROL',
    ),
    //Takaaki Nakagami
    Rider(
      id: 'nakagami',
      image: 'assets/images/nakagami.jpg',
      name: 'Takaaki Nakagami',
      team: 'LCR Honda IDEMITSU',
    ),
    //Johann Zarco
    Rider(
      id: 'zarco',
      image: 'assets/images/zarco.png',
      name: 'Johann Zarco',
      team: 'Reale Avintia Racing',
    ),
    //Tito Rabat
    Rider(
      id: 'rabat',
      image: 'assets/images/rabat.jpg',
      name: 'Tito Rabat',
      team: 'Reale Avintia Racing',
    ),
  ];

  List<Rider> get rider {
    return [..._rider];
  }

  Map<String, SelectedRiderItem> _items = {};

  Map<String, SelectedRiderItem> get items {
    return {..._items};
  }

  List<Rider> _finalGridPicks = List.filled(15, null);

  List<Rider> get finalGridPicks {
    return [..._finalGridPicks];
  }

  void returnRiderToList(
      String id, String name, String image, String team, int index) {
    _rider.insert(
      index,
      Rider(id: id, name: name, image: image, team: team),
    );
  }

  void addRiderToFinalGridList(
      String id, String name, String image, String team, int currentPick) {
    finalGridPicks.insert(
        currentPick, Rider(id: id, name: name, image: image, team: team));
  }

  //Removes rider from list once they've been selected
  void removeRider(String id) {
    _rider.removeWhere((item) => item.id == id);
  }

  void restoreRiderAvailability(String riderId) {
    if (_items.containsKey(riderId)) {
      print(_items);
    }
  }

  void setImage(String id, String name, String image, String team, int gridPick,
      int index) {
    gridSpots(id, name, image, team, gridPick, index);
  }

  void setGridPicks(
      String id, String name, String image, String team, String pick) {}

  void gridSpots(String id, String name, String image, String team,
      int gridPick, int index) {
    int pickNumber = gridPick;
    switch (pickNumber) {
//////////////////////////////////////////////////// 1st Pick ///////////////////////////////////////////////////////
      case 0:
        const int firstPlacePoints = 25;
        {
          if (riderVar.firstPickImage == riderVar.emptyRider) {
            riderVar.firstPickId = id;
            riderVar.firstPickName = name;
            riderVar.firstPickImage = image;
            riderVar.firstPickTeam = team;
            addRiderToFinalGridList(id, name, image, team, 0);
            notifyListeners();
          } else {
            returnRiderToList(riderVar.firstPickId, riderVar.firstPickName,
                riderVar.firstPickImage, riderVar.firstPickTeam, index);
            riderVar.firstPickId = id;
            riderVar.firstPickName = name;
            riderVar.firstPickImage = image;
            riderVar.firstPickTeam = team;

            //Adding Rider to _finalGridList
            addRiderToFinalGridList(id, name, image, team, 0);
            notifyListeners();
          }
          break;
        }
      //}
//////////////////////////////////////////////////// 2nd Pick /////////////////////////////////////////////////////
      case 1:
        {
          if (riderVar.secondPickImage == riderVar.emptyRider) {
            riderVar.secondPickId = id;
            riderVar.secondPickName = name;
            riderVar.secondPickImage = image;
            riderVar.secondPickTeam = team;
            notifyListeners();
          } else {
            //Adds previously selected rider back to the rider list
            returnRiderToList(
              riderVar.secondPickId,
              riderVar.secondPickName,
              riderVar.secondPickImage,
              riderVar.secondPickTeam,
              index,
            );
            riderVar.secondPickId = id;
            riderVar.secondPickName = name;
            riderVar.secondPickImage = image;
            riderVar.secondPickTeam = team;
            notifyListeners();
          }
          break;
        }
//////////////////////////////////////////////////// 3rd Pick /////////////////////////////////////////////////////
      case 2:
        {
          if (riderVar.thirdPickImage == riderVar.emptyRider) {
            riderVar.thirdPickId = id;
            riderVar.thirdPickName = name;
            riderVar.thirdPickImage = image;
            riderVar.thirdPickTeam = team;
            notifyListeners();
          } else {
            //Adds previously selected rider back to the rider list
            returnRiderToList(
              riderVar.thirdPickId,
              riderVar.thirdPickName,
              riderVar.thirdPickImage,
              riderVar.thirdPickTeam,
              index,
            );
            riderVar.thirdPickId = id;
            riderVar.thirdPickName = name;
            riderVar.thirdPickImage = image;
            riderVar.thirdPickTeam = team;
            notifyListeners();
          }
          break;
        }
//////////////////////////////////////////////////// 4th Pick /////////////////////////////////////////////////////
      case 3:
        {
          if (riderVar.fourthPickImage == riderVar.emptyRider) {
            riderVar.fourthPickId = id;
            riderVar.fourthPickName = name;
            riderVar.fourthPickImage = image;
            riderVar.fourthPickTeam = team;
            notifyListeners();
          } else {
            //Adds previously selected rider back to the rider list
            returnRiderToList(
              riderVar.fourthPickId,
              riderVar.fourthPickName,
              riderVar.fourthPickImage,
              riderVar.fourthPickTeam,
              index,
            );
            riderVar.fourthPickId = id;
            riderVar.fourthPickName = name;
            riderVar.fourthPickImage = image;
            riderVar.fourthPickTeam = team;
            notifyListeners();
          }
          break;
        }
//////////////////////////////////////////////////// 5th Pick /////////////////////////////////////////////////////
      case 4:
        {
          if (riderVar.fifthPickImage == riderVar.emptyRider) {
            riderVar.fifthPickId = id;
            riderVar.fifthPickName = name;
            riderVar.fifthPickImage = image;
            riderVar.fifthPickTeam = team;
            notifyListeners();
          } else {
            //Adds previously selected rider back to the rider list
            returnRiderToList(
              riderVar.fifthPickId,
              riderVar.fifthPickName,
              riderVar.fifthPickImage,
              riderVar.fifthPickTeam,
              index,
            );
            riderVar.fifthPickId = id;
            riderVar.fifthPickName = name;
            riderVar.fifthPickImage = image;
            riderVar.fifthPickTeam = team;
            notifyListeners();
          }
          break;
        }
//////////////////////////////////////////////////// 6th Pick /////////////////////////////////////////////////////
      case 5:
        {
          if (riderVar.sixthPickImage == riderVar.emptyRider) {
            riderVar.sixthPickId = id;
            riderVar.sixthPickName = name;
            riderVar.sixthPickImage = image;
            riderVar.sixthPickTeam = team;
            notifyListeners();
          } else {
            //Adds previously selected rider back to the rider list
            returnRiderToList(
              riderVar.sixthPickId,
              riderVar.sixthPickName,
              riderVar.sixthPickImage,
              riderVar.sixthPickTeam,
              index,
            );
            riderVar.sixthPickId = id;
            riderVar.sixthPickName = name;
            riderVar.sixthPickImage = image;
            riderVar.sixthPickTeam = team;
            notifyListeners();
          }
          break;
        }
//////////////////////////////////////////////////// 7th Pick /////////////////////////////////////////////////////
      case 6:
        {
          if (riderVar.seventhPickImage == riderVar.emptyRider) {
            riderVar.seventhPickId = id;
            riderVar.seventhPickName = name;
            riderVar.seventhPickImage = image;
            riderVar.seventhPickTeam = team;
            notifyListeners();
          } else {
            //Adds previously selected rider back to the rider list
            returnRiderToList(
              riderVar.seventhPickId,
              riderVar.seventhPickName,
              riderVar.seventhPickImage,
              riderVar.seventhPickTeam,
              index,
            );
            riderVar.seventhPickId = id;
            riderVar.seventhPickName = name;
            riderVar.seventhPickImage = image;
            riderVar.seventhPickTeam = team;
            notifyListeners();
          }
          break;
        }
//////////////////////////////////////////////////// 8th Pick /////////////////////////////////////////////////////
      case 7:
        {
          if (riderVar.eighthPickImage == riderVar.emptyRider) {
            riderVar.eighthPickId = id;
            riderVar.eighthPickName = name;
            riderVar.eighthPickImage = image;
            riderVar.eighthPickTeam = team;
            notifyListeners();
          } else {
            //Adds previously selected rider back to the rider list
            returnRiderToList(
              riderVar.eighthPickId,
              riderVar.eighthPickName,
              riderVar.eighthPickImage,
              riderVar.eighthPickTeam,
              index,
            );
            riderVar.eighthPickId = id;
            riderVar.eighthPickName = name;
            riderVar.eighthPickImage = image;
            riderVar.eighthPickTeam = team;
            notifyListeners();
          }
          break;
        }
//////////////////////////////////////////////////// 9th Pick /////////////////////////////////////////////////////
      case 8:
        {
          if (riderVar.ninthPickImage == riderVar.emptyRider) {
            riderVar.ninthPickId = id;
            riderVar.ninthPickName = name;
            riderVar.ninthPickImage = image;
            riderVar.ninthPickTeam = team;
            notifyListeners();
          } else {
            //Adds previously selected rider back to the rider list
            returnRiderToList(
              riderVar.ninthPickId,
              riderVar.ninthPickName,
              riderVar.ninthPickImage,
              riderVar.ninthPickTeam,
              index,
            );
            riderVar.ninthPickId = id;
            riderVar.ninthPickName = name;
            riderVar.ninthPickImage = image;
            riderVar.ninthPickTeam = team;
            notifyListeners();
          }
          break;
        }
//////////////////////////////////////////////////// 10th Pick /////////////////////////////////////////////////////
      case 9:
        {
          if (riderVar.tenthPickImage == riderVar.emptyRider) {
            riderVar.tenthPickId = id;
            riderVar.tenthPickName = name;
            riderVar.tenthPickImage = image;
            riderVar.tenthPickTeam = team;
            notifyListeners();
          } else {
            //Adds previously selected rider back to the rider list
            returnRiderToList(
              riderVar.tenthPickId,
              riderVar.tenthPickName,
              riderVar.tenthPickImage,
              riderVar.tenthPickTeam,
              index,
            );
            riderVar.tenthPickId = id;
            riderVar.tenthPickName = name;
            riderVar.tenthPickImage = image;
            riderVar.tenthPickTeam = team;
            notifyListeners();
          }
          break;
        }
//////////////////////////////////////////////////// 11th Pick /////////////////////////////////////////////////////
      case 10:
        {
          if (riderVar.eleventhPickImage == riderVar.emptyRider) {
            riderVar.eleventhPickId = id;
            riderVar.eleventhPickName = name;
            riderVar.eleventhPickImage = image;
            riderVar.eleventhPickTeam = team;
            notifyListeners();
          } else {
            //Adds previously selected rider back to the rider list
            returnRiderToList(
              riderVar.eleventhPickId,
              riderVar.eleventhPickName,
              riderVar.eleventhPickImage,
              riderVar.eleventhPickTeam,
              index,
            );
            riderVar.eleventhPickId = id;
            riderVar.eleventhPickName = name;
            riderVar.eleventhPickImage = image;
            riderVar.eleventhPickTeam = team;
            notifyListeners();
          }
          break;
        }
//////////////////////////////////////////////////// 12th Pick /////////////////////////////////////////////////////
      case 11:
        {
          if (riderVar.twelfthPickImage == riderVar.emptyRider) {
            riderVar.twelfthPickId = id;
            riderVar.twelfthPickName = name;
            riderVar.twelfthPickImage = image;
            riderVar.twelfthPickTeam = team;
            notifyListeners();
          } else {
            //Adds previously selected rider back to the rider list
            returnRiderToList(
              riderVar.twelfthPickId,
              riderVar.twelfthPickName,
              riderVar.twelfthPickImage,
              riderVar.twelfthPickTeam,
              index,
            );
            riderVar.twelfthPickId = id;
            riderVar.twelfthPickName = name;
            riderVar.twelfthPickImage = image;
            riderVar.twelfthPickTeam = team;
            notifyListeners();
          }
          break;
        }
//////////////////////////////////////////////////// 13th Pick /////////////////////////////////////////////////////
      case 12:
        {
          if (riderVar.thirteenthPickImage == riderVar.emptyRider) {
            riderVar.thirteenthPickId = id;
            riderVar.thirteenthPickName = name;
            riderVar.thirteenthPickImage = image;
            riderVar.thirteenthPickTeam = team;
            notifyListeners();
          } else {
            //Adds previously selected rider back to the rider list
            returnRiderToList(
              riderVar.thirteenthPickId,
              riderVar.thirteenthPickName,
              riderVar.thirteenthPickImage,
              riderVar.thirteenthPickTeam,
              index,
            );
            riderVar.thirteenthPickId = id;
            riderVar.thirteenthPickName = name;
            riderVar.thirteenthPickImage = image;
            riderVar.thirteenthPickTeam = team;
            notifyListeners();
          }
          break;
        }
//////////////////////////////////////////////////// 14th Pick /////////////////////////////////////////////////////
      case 13:
        {
          if (riderVar.fourteenthPickImage == riderVar.emptyRider) {
            riderVar.fourteenthPickId = id;
            riderVar.fourteenthPickName = name;
            riderVar.fourteenthPickImage = image;
            riderVar.fourteenthPickTeam = team;
            notifyListeners();
          } else {
            //Adds previously selected rider back to the rider list
            returnRiderToList(
              riderVar.fourteenthPickId,
              riderVar.fourteenthPickName,
              riderVar.fourteenthPickImage,
              riderVar.fourteenthPickTeam,
              index,
            );
            riderVar.fourteenthPickId = id;
            riderVar.fourteenthPickName = name;
            riderVar.fourteenthPickImage = image;
            riderVar.fourteenthPickTeam = team;
            notifyListeners();
          }
          break;
        }
//////////////////////////////////////////////////// 15th Pick /////////////////////////////////////////////////////
      case 14:
        {
          if (riderVar.fifteenthPickImage == riderVar.emptyRider) {
            riderVar.fifteenthPickId = id;
            riderVar.fifteenthPickName = name;
            riderVar.fifteenthPickImage = image;
            riderVar.fifteenthPickTeam = team;
            notifyListeners();
          } else {
            //Adds previously selected rider back to the rider list
            returnRiderToList(
              riderVar.fifteenthPickId,
              riderVar.fifteenthPickName,
              riderVar.fifteenthPickImage,
              riderVar.fifteenthPickTeam,
              index,
            );
            riderVar.fifteenthPickId = id;
            riderVar.fifteenthPickName = name;
            riderVar.fifteenthPickImage = image;
            riderVar.fifteenthPickTeam = team;
            notifyListeners();
          }
          break;
        }
    }
  }
}
