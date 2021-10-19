import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Rider with ChangeNotifier {
  String id;
  String image;
  String name;
  String team;
  int gridPosition;

  set riderId(String riderId){
    id = riderId;
  }

  Rider({
    this.id,
    this.image,
    this.name,
    this.team,
    this.gridPosition
  });

  
}
