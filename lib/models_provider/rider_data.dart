import 'package:flutter/foundation.dart';
import 'rider_model.dart';

class RiderData with ChangeNotifier {
  final Map riderData = {
    'bagnaia': Rider(
      id: 'bagnaia',
      name: 'Francesco Bagnaia',
      team: 'Ducati Lenovo Team',
      image: 'assets/images/bagnaia.jpg',
    ),
    'bastianini': Rider(
      id: 'bastianini',
      name: 'Enea Bastianini',
      team: 'Sky VR46 Avintia',
      image: 'assets/images/bastianini.jpg',
    ),
    'binder': Rider(
      id: 'binder',
      name: 'Brad Binder',
      team: 'Red Bull KTM Factory Racing',
      image: 'assets/images/binder.jpg',
    ),
    'espargaroA': Rider(
      id: 'espargaroA',
      name: 'Aleix Espargaro',
      team: 'Aprilia Racing Team Gresini',
      image: 'assets/images/espargaroA.jpg',
    ),
    'savadori': Rider(
      id: 'savadori',
      name: 'Lorenzo Savadori',
      team: 'Aprilia Racing Team Gresini',
      image: 'assets/images/espargaroA.jpg',
    ),
    'espargaroP': Rider(
      id: 'espargaroP',
      name: 'Pol Espargaro',
      team: 'Repsol Honda Team',
      image: 'assets/images/espargaroP.jpg',
    ),
    'rossi': Rider(
      id: 'rossi',
      name: 'Valentino Rossi',
      team: 'Petronas Yamaha SRT',
      image: 'assets/images/rossi.jpg',
    ),
    'dovizioso': Rider(
      id: 'dovizioso',
      name: 'Andrea Dovizioso',
      team: 'Petronas Yamaha SRT',
      image: 'assets/images/rossi.jpg',
    ),
    'marini': Rider(
      id: 'marini',
      name: 'Luca Marini',
      team: 'Sky VR46 Avintia',
      image: 'assets/images/marini.jpg',
    ),
    'marquezM': Rider(
      id: 'marquezM',
      name: 'Marc Marquez',
      team: 'Repsol Honda Team',
      image: 'assets/images/marquezM.jpg',
    ),
    'marquezA': Rider(
      id: 'marquezA',
      name: 'Alex Marquez',
      team: 'LCR Honda CASTROL',
      image: 'assets/images/marquezA.jpg',
    ),
    'martin': Rider(
      id: 'martin',
      name: 'Jorge Martin',
      team: 'Pramac Racing',
      image: 'assets/images/martin.jpg',
    ),
    'miller': Rider(
      id: 'miller',
      name: 'Jack Miller',
      team: 'Ducati Lenovo Team',
      image: 'assets/images/miller.jpg',
    ),
    'mir': Rider(
      id: 'mir',
      name: 'Joan Mir',
      team: 'Team Suzuki ECSTAR',
      image: 'assets/images/mir.jpg',
    ),
    'morbidelli': Rider(
      id: 'morbidelli',
      name: 'Franco Morbidelli',
      team: 'Monster Energy Yamaha MotoGP',
      image: 'assets/images/morbidelli.jpg',
    ),
    'nakagami': Rider(
      id: 'nakagami',
      name: 'Takaaki Nakagami',
      team: 'LCR Honda IDEMITSU',
      image: 'assets/images/nakagami.jpg',
    ),
    'oliveira': Rider(
      id: 'oliveira',
      name: 'Miguel Oliveira',
      team: 'Red Bull KTM Factory Racing',
      image: 'assets/images/oliveira.jpg',
    ),
    'quartararo': Rider(
      id: 'quartararo',
      name: 'Fabio Quartararo',
      team: 'Monster Energy Yamaha MotoGP',
      image: 'assets/images/quartararo.jpg',
    ),
    'rins': Rider(
      id: 'rins',
      name: 'Alex Rins',
      team: 'Team Suzuki ECSTAR',
      image: 'assets/images/rins.jpg',
    ),
    'vinales': Rider(
      id: 'vinales',
      name: 'Maverick Vinales',
      team: 'Aprilia Racing Team Gresini',
      image: 'assets/images/vinales.jpg',
    ),
    'zarco': Rider(
      id: 'zarco',
      name: 'Johann Zarco',
      team: 'Pramac Racing',
      image: 'assets/images/zarco.png',
    ),
    'petrucci': Rider(
      id: 'petrucci',
      name: 'Danilo Petrucci',
      team: 'Tech 3 KTM Factory Racing',
      image: 'assets/images/petrucci.jpg',
    ),
    'lecuona': Rider(
      id: 'lecuona',
      name: 'Iker Lecuona',
      team: 'Tech 3 KTM Factory Racing',
      image: 'assets/images/lecuona.jpg',
    ),
    'pirro': Rider(
      id: 'pirro',
      name: 'Michele Pirro',
      team: 'Ducati Lenovo Team',
      image: 'assets/images/lecuona.jpg',
    ),
    'bradl': Rider(
      id: 'bradl',
      name: 'Stefan Bradl',
      team: 'Team Honda HRC',
      image: 'assets/images/lecuona.jpg',
    ),
  };
}
