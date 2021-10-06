import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models-provider/riderModel.dart';
import '../screens/pick_rider_screen.dart';

class SecondPick extends StatefulWidget {
  @override
  _SecondPickState createState() => _SecondPickState();
}

class _SecondPickState extends State<SecondPick> {
  int currentPick = 1;
  String emptyPick = 'assets/images/genericPerson.png';
  String _pickImage;
  String _pickId;

  void moveToPickRiderScreen() async {
    await Navigator.push(
        context, MaterialPageRoute(builder: (context) => PickRiderScreen()));
  }

  void setPickData(String image, String id) {}

  @override
  Widget build(BuildContext context) {
    final Rider pickedRider = Provider.of<Rider>(context);
    _pickId = pickedRider.id;
    _pickImage = pickedRider.image;

    return Container(
      child: GestureDetector(
        child: Card(
          elevation: 10,
          child: Container(
            width: 100,
            height: 100,
            //Setting rider image from instantiated RiderVariable within RiderData class
            child: _pickImage == null
                ? Image.asset(emptyPick)
                : Image.asset(_pickImage),
          ),
        ),
        onTap: () {
          moveToPickRiderScreen();
          setState(() {});
        },
      ),
    );
  }
}
