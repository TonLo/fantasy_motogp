import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models-provider/rider_data.dart';
import '../models-provider/riderModel.dart';
import '../widgets/pick_rider_item.dart';

final teamList = FirebaseFirestore.instance.collection('riders');

class PickRiderScreen extends StatefulWidget {
  static const routeName = '/pickRiderScreen';

  @override
  _PickRiderScreenState createState() => _PickRiderScreenState();
}

class _PickRiderScreenState extends State<PickRiderScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final currentPick = ModalRoute.of(context).settings.arguments as int;
    final riderData = Provider.of<RiderData>(context);
    final riders = riderData.rider;
    List riderPickedList = [];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Rider'),
      ),
      body: FutureBuilder<QuerySnapshot>(
        future: teamList.get(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Container(
                alignment: Alignment.center,
                child: CircularProgressIndicator());
          }
          final List riderList =
              snapshot.data.docs.map((e) => e.data()).toList();

          //print(teamsList);
          return ListView.builder(
            itemCount: riderList.length,
            itemBuilder: (ctx, i) {
              return Card(
                child: ListTile(
                  leading: Image.asset('${riderList[i]['image']}'),
                  title: Text(
                    '${riderList[i]['name']}',
                  ),
                  onTap: () {
                    Navigator.of(context).pop(
                      Rider(
                          image: riderList[i]['image'],
                          id: riderList[i]['id'],
                          name: riderList[i]['name'],
                          team: riderList[i]['team']),
                    );
                    riderPickedList.add(riderList[i]);
                    riderList.remove(i);
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
