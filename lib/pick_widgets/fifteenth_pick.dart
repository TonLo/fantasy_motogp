import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models_provider/grid_provider.dart';
import '../models_provider/firebase_actions.dart';

class FifteenthPick extends StatelessWidget {
  static const int _gridPosition = 14;
  static const int _points = 5;
  final String _emptyImage = 'assets/images/genericPerson.png';

  @override
  Widget build(BuildContext context) {
    FirebaseActions _firebaseActions =
        Provider.of<FirebaseActions>(context, listen: false);
    GridProvider _gridProvider =
        Provider.of<GridProvider>(context, listen: false);
    return Container(
      child: GestureDetector(
        child: Card(
          elevation: 10,
          child: Consumer<GridProvider>(
            builder: (context, _consumerGridProvider, child) {
              return Container(
                width: 100,
                height: 100,
                child:
                    _consumerGridProvider.fifteenthPlaceGridRider.image == null
                        ? Image.asset(_emptyImage)
                        : Image.asset(
                            _consumerGridProvider.fifteenthPlaceGridRider.image,
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
