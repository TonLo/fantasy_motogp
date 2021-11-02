import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models-provider/grid_provider.dart';

class FirstPick extends StatelessWidget {
  static const int _gridPosition = 0;
  static const int _points = 25;
  final String _emptyImage = 'assets/images/genericPerson.png';

  @override
  Widget build(BuildContext context) {
    GridProvider _gridProvider =
        Provider.of<GridProvider>(context, listen: false);
    return Container(
      child: GestureDetector(
        child: Card(
          elevation: 10,
          child: Consumer<GridProvider>(
            builder: (context, _model, child) {
              return Container(
                  width: 100,
                  height: 100,
                  child: _model.firstPlaceGridRider.image == null
                      ? Image.asset(_emptyImage)
                      : Image.asset(_model.firstPlaceGridRider.image));
            },
          ),
        ),
        onTap: () {
          _gridProvider.goToPickRiderScreen(context, _gridPosition);
        },
        onLongPress: () {
          _gridProvider
              .removeSelectedRiderWithoutReplacement(_gridPosition);
        },
      ),
    );
  }
}
