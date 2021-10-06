import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models-provider/riderModel.dart';
import '../models-provider/rider_data.dart';
import '../screens/rider_selected_screen.dart';

class PickRiderItem extends StatelessWidget {
  int currentPick;
  int index;
  // ignore: sort_constructors_first
  PickRiderItem(this.currentPick, this.index);
  @override
  Widget build(BuildContext context) {
    final Rider pickedRider = Provider.of<Rider>(context);
    final RiderData pickedRiderData =
        Provider.of<RiderData>(context);
    final RiderData storeRiderData =
        Provider.of<RiderData>(context);
    return Container(
      child: GestureDetector(
        child: ListTile(
          leading: Image.asset(pickedRider.image),
          title: Text(pickedRider.name),
          subtitle: Text(pickedRider.team),
        ),
        onTap: () {
          //Saving the current riders image to be used as a key
          //so the rider can be added back to the original list
          //if user decides to change their pick
          pickedRiderData.setImage(pickedRider.id, pickedRider.name,
              pickedRider.image, pickedRider.team, currentPick, index);
          //Removes rider from pick list
          pickedRiderData.removeRider(pickedRider.id);
          Navigator.of(context).pop();
          //Navigator.popAndPushandNamed(context, RiderSelectedScreen.routeName);
        },
      ),
    );
  }
}
