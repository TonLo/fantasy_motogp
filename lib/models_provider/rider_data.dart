import 'package:flutter/foundation.dart';
import 'rider_model.dart';

class RiderData with ChangeNotifier {
  
  final Map riderData = {
// Aprilia Racing
    'espargaroA': Rider(
      id: 'espargaroA',
      name: 'Aleix Espargaro',
      team: 'Aprilia Racing',
      image: 'assets/images/espargaroA.png',
    ),
    'vinales': Rider(
      id: 'vinales',
      name: 'Maverick Vinales',
      team: 'Aprilia Racing',
      image: 'assets/images/vinales.png',
    ),

    // Ducati Lenovo Team
    'bagnaia': Rider(
      id: 'bagnaia',
      name: 'Francesco Bagnaia',
      team: 'Ducati Lenovo Team',
      image: 'assets/images/bagnaia.png',
    ),
    'miller': Rider(
      id: 'miller',
      name: 'Jack Miller',
      team: 'Ducati Lenovo Team',
      image: 'assets/images/miller.png',
    ),
    'pirro': Rider(
      id: 'pirro',
      name: 'Michele Pirro',
      team: 'Ducati Lenovo Team',
      image: 'assets/images/pirro.png',
    ),

    // Gresini Racing MotoGP
    'bastianini': Rider(
      id: 'bastianini',
      name: 'Enea Bastianini',
      team: 'Gresini Racing MotoGP',
      image: 'assets/images/bastianini.png',
    ),
    'diGiannantonio': Rider(
      id: 'diGiannantonio',
      name: 'Fabio Di Giannantonio',
      team: 'Gresini Racing MotoGP',
      image: 'assets/images/diGiannantonio.png',
    ),

    // LCR Honda
    'marquezA': Rider(
      id: 'marquezA',
      name: 'Alex Marquez',
      team: 'LCR Honda',
      image: 'assets/images/marquezA.png',
    ),
    'nakagami': Rider(
      id: 'nakagami',
      name: 'Takaaki Nakagami',
      team: 'LCR Honda',
      image: 'assets/images/nakagami.png',
    ),

    // Monster Energy Yamaha MotoGP
    'morbidelli': Rider(
      id: 'morbidelli',
      name: 'Franco Morbidelli',
      team: 'Monster Energy Yamaha MotoGP',
      image: 'assets/images/morbidelli.png',
    ),
    'quartararo': Rider(
      id: 'quartararo',
      name: 'Fabio Quartararo',
      team: 'Monster Energy Yamaha MotoGP',
      image: 'assets/images/quartararo.png',
    ),

    // Mooney VR46 Racing Team
    'marini': Rider(
      id: 'marini',
      name: 'Luca Marini',
      team: 'Mooney VR46 Racing Team',
      image: 'assets/images/marini.png',
    ),
    'bezzecchi': Rider(
      id: 'bezzecchi',
      name: 'Marco Bezzecchi',
      team: 'Mooney VR46 Racing Team',
      image: 'assets/images/bezzecchi.png',
    ),

    // Pramac Racing
    'martin': Rider(
      id: 'martin',
      name: 'Jorge Martin',
      team: 'Pramac Racing',
      image: 'assets/images/martin.png',
    ),
    'zarco': Rider(
      id: 'zarco',
      name: 'Johann Zarco',
      team: 'Pramac Racing',
      image: 'assets/images/zarco.png',
    ),

    // Red Bull KTM Factory Racing
    'binderB': Rider(
      id: 'binderB',
      name: 'Brad Binder',
      team: 'Red Bull KTM Factory Racing',
      image: 'assets/images/binderB.png',
    ),
    'oliveira': Rider(
      id: 'oliveira',
      name: 'Miguel Oliveira',
      team: 'Red Bull KTM Factory Racing',
      image: 'assets/images/oliveira.png',
    ),

    // Repsol Honda Team
    'espargaroP': Rider(
      id: 'espargaroP',
      name: 'Pol Espargaro',
      team: 'Repsol Honda Team',
      image: 'assets/images/espargaroP.png',
    ),
    'marquezM': Rider(
      id: 'marquezM',
      name: 'Marc Marquez',
      team: 'Repsol Honda Team',
      image: 'assets/images/marquezM.png',
    ),
    'bradl': Rider(
      id: 'bradl',
      name: 'Stefan Bradl',
      team: 'Team Honda HRC',
      image: 'assets/images/bradl.png',
    ),

    // Team Suzuki ECSTAR
    'mir': Rider(
      id: 'mir',
      name: 'Joan Mir',
      team: 'Team Suzuki ECSTAR',
      image: 'assets/images/mir.png',
    ),
    'rins': Rider(
      id: 'rins',
      name: 'Alex Rins',
      team: 'Team Suzuki ECSTAR',
      image: 'assets/images/rins.png',
    ),

    // Tech3 KTM Factory Racing
    'fernandez': Rider(
      id: 'fernandez',
      name: 'Raul Fernandez',
      team: 'Tech3 KTM Factory Racing',
      image: 'assets/images/fernandez.png',
    ),
    'gardner': Rider(
      id: 'gardner',
      name: 'Remy Gardner',
      team: 'Tech3 KTM Factory Racing',
      image: 'assets/images/gardner.png',
    ),

    // WithU Yamaha RNF MotoGP Team
    'binderD': Rider(
      id: 'binderD',
      name: 'Darryn Binder',
      team: 'WithU Yamaha RNF MotoGP Team',
      image: 'assets/images/binderD.png',
    ),
    'dovizioso': Rider(
      id: 'dovizioso',
      name: 'Andrea Dovizioso',
      team: 'WithU Yamaha RNF MotoGP Team',
      image: 'assets/images/dovizioso.png',
    ),
  };
  
}
