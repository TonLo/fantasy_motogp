import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

import 'package:firebase_auth/firebase_auth.dart';

import '../pick_widgets/eighth_pick.dart';
import '../pick_widgets/eleventh_pick.dart';
import '../pick_widgets/fifteenth_pick.dart';
import '../pick_widgets/fifth_pick.dart';
import '../pick_widgets/first_pick.dart';
import '../pick_widgets/fourteenth_pick.dart';
import '../pick_widgets/fourth_pick.dart';
import '../pick_widgets/ninth_pick.dart';
import '../pick_widgets/second_pick.dart';
import '../pick_widgets/seventh_pick.dart';
import '../pick_widgets/sixth_pick.dart';
import '../pick_widgets/tenth_pick.dart';
import '../pick_widgets/third_pick.dart';
import '../pick_widgets/thirteenth_pick.dart';
import '../pick_widgets/twelfth_pick.dart';
import '../models-provider/grid_model.dart';
import '../models-provider/calculate_points.dart';
import '../models-provider/authenticate.dart';

class GridScreen extends StatefulWidget {
  static const routeName = '/riderSelectedScreen';

  @override
  _GridScreenState createState() => _GridScreenState();
}

class _GridScreenState extends State<GridScreen> {
  DocumentSnapshot
      finalResults; //= FirebaseFirestore.instance.collection('results');
  bool lockRiderPicks = false;
  GridModel gridModel = GridModel();
  CalculatePoints gridPoints = CalculatePoints();
  Authenticate auth = Authenticate();
  Map finalResultsData = Map();
  List finalResultsList = List.generate(15, (index) => [], growable: true);
  var _currentUserUid;

  void submitPicks(GridModel gm) {
    gridModel.finalizePoints();
    retrieveFinalResults();
    savePicksToServer(gm);
  }

  void savePicksToServer(GridModel gm) async {
    _currentUserUid = auth.getUser();
    final firestoreUser = await FirebaseFirestore.instance
        .collection('users')
        .doc(_currentUserUid)
        .collection('picks')
        .doc('grandPrixOfQatar')
        .set({
      '0': gm.finalGridPositionList[0].id,
      '1': gm.finalGridPositionList[1].id,
      '2': gm.finalGridPositionList[2].id,
      '3': gm.finalGridPositionList[3].id,
      '4': gm.finalGridPositionList[4].id,
      '5': gm.finalGridPositionList[5].id,
      '6': gm.finalGridPositionList[6].id,
      '7': gm.finalGridPositionList[7].id,
      '8': gm.finalGridPositionList[8].id,
      '9': gm.finalGridPositionList[9].id,
      '10': gm.finalGridPositionList[10].id,
      '11': gm.finalGridPositionList[11].id,
      '12': gm.finalGridPositionList[12].id,
      '13': gm.finalGridPositionList[13].id,
      '14': gm.finalGridPositionList[14].id,
    });
  }

  void retrieveFinalResults() async {
    finalResults = await FirebaseFirestore.instance
        .collection('results')
        .doc('grandPrixOfQatar')
        .get();

    finalResultsData = finalResults.data();
    finalResultsData.entries.forEach((element) =>
        finalResultsList.setAll(int.parse(element.key), [element.value]));
  }

  @override
  Widget build(BuildContext context) {
    GridModel gridModelProvider =
        Provider.of<GridModel>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Picked Riders'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                          title: Text('Save Picks'),
                          content: Text('Are you sure? \nThis save is final!'),
                          actions: [
                            TextButton(
                              child: Text('No'),
                              onPressed: () => Navigator.pop(context),
                            ),
                            TextButton(
                              child: Text('Yes'),
                              onPressed: () {
                                submitPicks(gridModelProvider);
                              },
                            ),
                          ],
                        ));
              })
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.black54),
              child: Text(
                'App Directory',
                style: TextStyle(color: Colors.white, fontSize: 24),
                textAlign: TextAlign.center,
              ),
            ),
            ListTile(
              title: Text('Tracks'),
            ),
            InkWell(
                child: ListTile(
                  title: Text('Logout'),
                ),
                onTap: () {
                  FirebaseAuth.instance.signOut();
                }),
          ],
        ),
      ),
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
      body: ListView(
        children: <Widget>[
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    FirstPick(),
                    Container(
                      child: const Text('1st Place'),
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    Container(height: 30),
                    SecondPick(),
                    Container(
                      child: const Text('2nd Place'),
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    Container(height: 60),
                    ThirdPick(),
                    Container(
                      child: const Text('3rd Place'),
                    )
                  ],
                ),
              ],
            ),
          ),
///////////////////////////////////////////// 2nd Row ////////////////////////////////////////////////////////
          const Divider(
            thickness: 5,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    FourthPick(),
                    Container(
                      child: const Text('4th Place'),
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    Container(height: 30),
                    FifthPick(),
                    Container(
                      child: const Text('5th Place'),
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    Container(height: 60),
                    SixthPick(),
                    Container(
                      child: const Text('6th Place'),
                    )
                  ],
                ),
              ],
            ),
          ),
///////////////////////////////////////////// 3rd Row ////////////////////////////////////////////////////////
          const Divider(
            thickness: 5,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    SeventhPick(),
                    Container(
                      child: const Text('7th Place'),
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    Container(height: 30),
                    EighthPick(),
                    Container(
                      child: const Text('8th Place'),
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    Container(height: 60),
                    NinthPick(),
                    Container(
                      child: const Text('9th Place'),
                    )
                  ],
                ),
              ],
            ),
          ),
///////////////////////////////////////////// 4th Row ////////////////////////////////////////////////////////
          const Divider(
            thickness: 5,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    TenthPick(),
                    Container(
                      child: const Text('10th Place'),
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    Container(height: 30),
                    EleventhPick(),
                    Container(
                      child: const Text('11th Place'),
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    Container(height: 60),
                    TwelfthPick(),
                    Container(
                      child: const Text('12th Place'),
                    )
                  ],
                ),
              ],
            ),
          ),
///////////////////////////////////////////// 5th Row ////////////////////////////////////////////////////////
          const Divider(
            thickness: 5,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    ThirteenthPick(),
                    Container(
                      child: const Text('13th Place'),
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    Container(height: 30),
                    FourteenthPick(),
                    Container(
                      child: const Text('14th Place'),
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    Container(height: 60),
                    FifteenthPick(),
                    Container(
                      child: const Text('15th Place'),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
