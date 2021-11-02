import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models-provider/grid_provider.dart';

class FourthPick extends StatelessWidget {
  static const int _gridPosition = 3;
  static const int _points = 16;
  final String _emptyImage = 'assets/images/genericPerson.png';

  @override
  Widget build(BuildContext context) {
    GridProvider _gridProvider = Provider.of<GridProvider>(context, listen: false);
    return Container(
      child: GestureDetector(
        child: Card(
          elevation: 10,
          child: Consumer<GridProvider>(
            builder: (context, model, child) {
              return Container(
                  width: 100,
                  height: 100,
                  child: model.fourthPlaceGridRider.image == null
                      ? Image.asset(_emptyImage)
                      : Image.asset(model.fourthPlaceGridRider.image));
            },
          ),
        ),
        onTap: () {
          _gridProvider.goToPickRiderScreen(context, _gridPosition);
        },
      ),
    );
  }
}
