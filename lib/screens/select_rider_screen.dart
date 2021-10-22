import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models-provider/riderModel.dart';

final teamList = FirebaseFirestore.instance.collection('riders');

class SelectRiderScreen extends StatefulWidget {
  static const routeName = '/pickRiderScreen';

  @override
  _SelectRiderScreenState createState() => _SelectRiderScreenState();
}

class _SelectRiderScreenState extends State<SelectRiderScreen> {
  List<Map> riderPickedList = [];

  void addFirebaseListToLocalList(List list) {
    for (int i = 0; i < list.length; i++) {
      riderPickedList.addAll(list[i]);
    }
  }

  @override
  Widget build(BuildContext context) {
    Rider selectedRider = new Rider();

    void passSelectedRider(Rider rider) {
      Navigator.pop(context, rider);
    }

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
          if(snapshot.hasError){
            print(snapshot.error.toString());
          }
          // Reading all riders from firebase to select from
          final List riderList =
              snapshot.data.docs.map((e) => e.data()).toList();

          // Creating a list of riders to select
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
                    selectedRider = Rider(
                        image: riderList[i]['image'],
                        id: riderList[i]['id'],
                        name: riderList[i]['name'],
                        team: riderList[i]['team']);
                    print(riderPickedList);
                    // Sending rider data back to selected grid position
                    passSelectedRider(selectedRider);
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