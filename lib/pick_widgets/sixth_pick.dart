import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models-provider/rider_data.dart';
import '../screens/pick_rider_screen.dart';

class SixthPick extends StatefulWidget {
  @override
  _SixthPickState createState() => _SixthPickState();
}

class _SixthPickState extends State<SixthPick> {
  int currentPick = 5;
  @override
  Widget build(BuildContext context) {
    final rider = Provider.of<RiderData>(context);

    return Container(
      child: GestureDetector(
        child: Card(
          elevation: 10,
          child: Container(
            width: 100,
            height: 100,
            //Setting rider image from instantiated RiderVariable within RiderData class
            child: Image.asset(rider.riderVar.sixthPickImage),
          ),
        ),
        onTap: () {
          Navigator.of(context).pushNamed(
            PickRiderScreen.routeName,
            arguments: currentPick,
          );
          setState(() {});
        },
        onLongPress: () {},
      ),
    );
  }
}
