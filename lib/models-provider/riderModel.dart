import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Rider with ChangeNotifier {
  final String id;
   String image;
  final String name;
  final String team;

  Rider({
    this.id,
    this.image,
    this.name,
    this.team,
  });
}
