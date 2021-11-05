import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models_provider/grid_provider.dart';
import '../models_provider/firebase_actions.dart';

class SixthPick extends StatelessWidget {
  static const int _gridPosition = 5;
  static const int _points = 13;
  final String _emptyImage = 'assets/images/genericPerson.png';

  @override
  Widget build(BuildContext context) {
    GridProvider _gridProvider =
        Provider.of<GridProvider>(context, listen: false);
    FirebaseActions _firebaseActions =
        Provider.of<FirebaseActions>(context, listen: false);
    return Container(
      child: GestureDetector(
        child: Card(
          elevation: 10,
          child: Consumer<GridProvider>(
            builder: (context, _consumerGridProvider, child) {
              return Container(
                width: 100,
                height: 100,
                child: _consumerGridProvider.sixthPlaceGridRider.image == null
                    ? Image.asset(_emptyImage)
                    : Image.asset(
                        _consumerGridProvider.sixthPlaceGridRider.image,
                      ),
              );
            },
          ),
        ),
        onTap: () {
          _firebaseActions.goToPickRiderScreen(context, _gridPosition);
        },
        onLongPress: () {
          _gridProvider.removeSelectedRiderWithoutReplacement(_gridPosition);
        },
      ),
    );
  }
}
