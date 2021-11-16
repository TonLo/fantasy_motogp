import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:flutter/rendering.dart';

import '../models_provider/compare_provider.dart';
import '../models_provider/riderModel.dart';
import '../models_provider/firebase_actions.dart';
import '../models_provider/grid_provider.dart';

class CompareResultsScreen extends StatefulWidget {
  static const routeName = '/CompareResultsScreen';
  @override
  _CompareResultsScreenState createState() => _CompareResultsScreenState();
}

class _CompareResultsScreenState extends State<CompareResultsScreen> {
  List<Rider> _userPickList = [];
  List _finalResultsList = [];
  bool _isLeftListLoading = true;
  bool _isRightListLoading = true;

  Future<void> getfirebaseFinalResultsList(BuildContext context) async {
    await Provider.of<FirebaseActions>(context, listen: false)
        .retrieveFinalResults(context);
    var gridProvider = Provider.of<GridProvider>(context, listen: false);

    _finalResultsList = gridProvider.finalResultsList;

    setState(() {
      _isRightListLoading = false;
    });
  }

  Future<void> getFinalUserPicks(BuildContext context) async {
    await Provider.of<FirebaseActions>(context, listen: false)
        .retrieveFinalUserPicks(context);
    var gridProvider = Provider.of<GridProvider>(context, listen: false);

    _userPickList = gridProvider.retrievedUserPickList;

    setState(() {
      _isLeftListLoading = false;
    });
  }

  // LIMITED BOX WIDGET!!!!!!

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    getFinalUserPicks(context);
    getfirebaseFinalResultsList(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Compare Results'),
        actions: <Widget>[Icon(Icons.more_vert_outlined)],
      ),
      body: Stack(
        children: [
          Column(
            //mainAxisAlignment: M,
            children: <Widget>[
              Flexible(
                flex: 1,
                fit: FlexFit.loose,
                child: Container(
                  height: 50,
                  child: ElevatedButton(
                    child: Text('List'),
                    onPressed: () {},
                  ),
                ),
              ),
              Flexible(
                flex: 5,
                fit: FlexFit.tight,
                child: Container(
                  // height: deviceSize.height,
                  // width: deviceSize.width,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          color: Colors.teal,
                          child: _isLeftListLoading
                              ? Center(child: CircularProgressIndicator())
                              : ListView.builder(
                                  itemCount: _userPickList.length,
                                  itemBuilder: (context, i) {
                                    return Card(
                                      child: ListTile(
                                        //Debug firebaseActions to see how user's picks are being read from database
                                        //retrieveFinalUserPicks() function
                                        leading:
                                            Text('${_userPickList[i].name}'),
                                      ),
                                    );
                                  },
                                ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Container(
                            color: Colors.orange,
                            child: _isRightListLoading
                                ? Center(child: CircularProgressIndicator())
                                : ListView.builder(
                                    itemCount: _finalResultsList.length,
                                    itemBuilder: (context, i) {
                                      return Card(
                                        child: ListTile(
                                          leading:
                                              Text('${_finalResultsList[i]}'),
                                        ),
                                      );
                                    },
                                  ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
