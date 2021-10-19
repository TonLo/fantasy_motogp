import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models-provider/grid_model.dart';

class FirstPick extends StatelessWidget {
  static const int _gridPosition = 0;
  static const int _points = 20;
  String _emptyImage = 'assets/images/genericPerson.png';

  @override
  Widget build(BuildContext context) {
    GridModel gridModelProvider =
        Provider.of<GridModel>(context, listen: false);
    return Container(
      child: GestureDetector(
        child: Card(
          elevation: 10,
          child: Consumer<GridModel>(
            builder: (context, _model, child) {
              return Container(
                  width: 100,
                  height: 100,
                  child: _model.firstPlaceGridrider.image == null
                      ? Image.asset(_emptyImage)
                      : Image.asset(_model.firstPlaceGridrider.image));
            },
          ),
        ),
        onTap: () {
          gridModelProvider.goToPickRiderScreen(context, _gridPosition);
        },
      ),
    );
  }
}
