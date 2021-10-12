import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models-provider/rider_data.dart';
import '../screens/pick_rider_screen.dart';
import '../models-provider/riderModel.dart';

class FirstPick extends StatefulWidget {
  @override
  _FirstPickState createState() => _FirstPickState();
}

class _FirstPickState extends State<FirstPick> {
  final int points = 25;
  final int currentPick = 0;
  String pickedRiderImage = 'assets/images/genericPerson.png';
  @override
  Widget build(BuildContext context) {
    final pickedRider = Provider.of<Rider>(context);

    final rider = Provider.of<RiderData>(context);

    Future<String> goToSelectRiderScreen() async {
      final Rider selectedRider = await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PickRiderScreen()),
      );
      setState(() {
        pickedRiderImage = selectedRider.image;
      });

      return pickedRiderImage;
    }

    return Container(
      child: GestureDetector(
        child: Card(
          elevation: 10,
          child: Container(
              width: 100,
              height: 100,
              //Setting rider image from instantiated RiderVariable within RiderData class
              child: Image.asset(pickedRiderImage)),
        ),
        onTap: () {
          goToSelectRiderScreen();
        },
      ),
    );
  }
}
