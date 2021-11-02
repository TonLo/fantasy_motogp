import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models-provider/grid_provider.dart';

class SeventhPick extends StatelessWidget {
  static const int _gridPosition = 6;
  static const int _points = 11;
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
                  child: model.seventhPlaceGridRider.image == null
                      ? Image.asset(_emptyImage)
                      : Image.asset(model.seventhPlaceGridRider.image));
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
