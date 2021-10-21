import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Rider with ChangeNotifier {
  String id;
  String image;
  String name;
  String team;
  int gridPosition;
  double points;

  Rider(
      {this.id,
      this.image,
      this.name,
      this.team,
      this.gridPosition,
      this.points});
}
