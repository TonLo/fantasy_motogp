import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models-provider/riderModel.dart';

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

  Rider selectedRider = new Rider();

  void passSelectedRider(Rider rider) {
    Navigator.pop(context, rider);
  }

  @override
  Widget build(BuildContext context) {

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

          return ListView.builder(
            itemCount: riderList.length,
            itemBuilder: (ctx, i) {
              return Card(
                child: ListTile(
                  leading:
                      Image.asset('${riderList[i]['image']}'),
                  title: Text(
                    '${riderList[i]['name']}',
                  ),
                  onTap: () {
                    selectedRider = Rider(
                        image: riderList[i]['image'],
                        id: riderList[i]['id'],
                        name: riderList[i]['name'],
                        team: riderList[i]['team']);

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

//FutureBuilder<QuerySnapshot>(
  //      future: teamList.get(),
    //    builder: (context, snapshot) {
      //    if (!snapshot.hasData) {
        //    return Container(
          //      alignment: Alignment.center,
            //    child: CircularProgressIndicator());
          //}
          //final List riderList =
            //    snapshot.data.docs.map((e) => e.data()).toList();