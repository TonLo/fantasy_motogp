import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
import '../models_provider/firebase_actions.dart';
import '../models_provider/grid_provider.dart';
import '../models_provider/calculate_points.dart';

class GridScreen extends StatefulWidget {
  @override
  _GridScreenState createState() => _GridScreenState();
}

class _GridScreenState extends State<GridScreen> {
  DocumentSnapshot finalResults;
  bool lockRiderPicks = false;

  Map finalResultsData = Map();
  List finalResultsList = List.generate(15, (index) => [], growable: true);

  Future<void> _submitPicks() async {
    var _gridProvider = Provider.of<GridProvider>(context, listen: false);
    var _calcPoints = Provider.of<CalculatePoints>(context, listen: false);
    _gridProvider.fullGrid();
    try {
      await Provider.of<FirebaseActions>(context, listen: false)
          .savePicksToServer(context);
      await Provider.of<FirebaseActions>(context, listen: false)
          .retrieveFinalResults(context);
    } on PlatformException catch (error) {
      var errorMessage = 'Could not contact server';
      if (error.message != null) {
        errorMessage = error.message;
      }
      print(errorMessage);
    }

    _calcPoints.compareResults(context,
        _gridProvider.finalUserPickList, _gridProvider.finalResultsList);
  }

  // @override
  // void initState() {
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Picked Riders'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                showDialog(
                    useRootNavigator: false,
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
                                  _submitPicks();
                                  Navigator.pop(context);
                                }),
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
