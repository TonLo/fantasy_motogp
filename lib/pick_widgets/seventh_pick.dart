import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models-provider/grid_model.dart';

class SeventhPick extends StatelessWidget {
  static const int _gridPosition = 6;
  static const int _points = 20;
  String _emptyImage = 'assets/images/genericPerson.png';

  @override
  Widget build(BuildContext context) {
    GridModel fpm = Provider.of<GridModel>(context, listen: false);
    return Container(
      child: GestureDetector(
        child: Card(
          elevation: 10,
          child: Consumer<GridModel>(
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
          fpm.goToPickRiderScreen(context, _gridPosition);
        },
      ),
    );
  }
}
