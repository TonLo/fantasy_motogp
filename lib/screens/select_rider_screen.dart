import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

import '../models_provider/rider_model.dart';
import '../models_provider/grid_provider.dart';

class SelectRiderScreen extends StatefulWidget {
  static const routeName = '/pickRiderScreen';

  @override
  _SelectRiderScreenState createState() => _SelectRiderScreenState();
}

class _SelectRiderScreenState extends State<SelectRiderScreen> {
  Rider selectedRider = new Rider();

  void passSelectedRider(Rider rider) {
    Navigator.pop(context, rider);
  }

  @override
  Widget build(BuildContext context) {
    final _gridProvider = Provider.of<GridProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Rider'),
      ),
      body: ListView.builder(
        itemCount: _gridProvider.unorderedListOfRiders.length,
        itemBuilder: (ctx, i) {
          return Card(
            child: ListTile(
              leading: Image.asset(
                  '${_gridProvider.unorderedListOfRiders[i]['image']}'),
              title: Text(
                '${_gridProvider.unorderedListOfRiders[i]['name']}',
              ),
              onTap: () {
                selectedRider = Rider(
                  image: _gridProvider.unorderedListOfRiders[i]['image'],
                  id: _gridProvider.unorderedListOfRiders[i]['id'],
                  name: _gridProvider.unorderedListOfRiders[i]['name'],
                  team: _gridProvider.unorderedListOfRiders[i]['team'],
                );
                // Sending rider data back to selected grid position
                passSelectedRider(selectedRider);
              },
            ),
          );
        },
      ),
    );
  }
}
