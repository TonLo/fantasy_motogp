import 'package:fantasy_motogp/models_provider/race_week_info_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models_provider/rider_model.dart';
import '../models_provider/firebase_actions.dart';
import '../models_provider/calculate_points.dart';
import '../models_provider/race_week_provider.dart';

class CompareResultsScreen extends StatefulWidget {
  static const routeName = '/CompareResultsScreen';
  @override
  _CompareResultsScreenState createState() => _CompareResultsScreenState();
}

class _CompareResultsScreenState extends State<CompareResultsScreen> {
  List _resultsList = List.generate(15, (index) => [], growable: true);
  List<Rider> _userPicksList =
      List<Rider>.generate(15, (index) => Rider(), growable: true);
  bool _isLeftListLoading = true;
  bool _isRightListLoading = true;
  double _totalPoints = 0;
  String _dropdownValue;
  bool _pointsCalculated = false;

  CalculatePoints _calcPoints = CalculatePoints();

  Future<void> _getPicksAndResultsData(
      BuildContext context, String currentRound) async {
    _resultsList = await Future.any([
      _getFirebaseFinalResultsList(context, currentRound),
    ]);

    _userPicksList = await Future.any([
      _getUserPicks(context, currentRound),
    ]);

    for (int i = 0; i < _userPicksList.length; i++) {
      _userPicksList[i].correctPick = false;
      _userPicksList[i].points = 0;
    }

    _getPickResults(_userPicksList, _resultsList);
  }

  Future<List> _getFirebaseFinalResultsList(
      BuildContext context, String currentRound) async {
    return await Provider.of<FirebaseActions>(context, listen: false)
        .getFinalResults(context, currentRound);
  }

  Future<List<Rider>> _getUserPicks(
      BuildContext context, String currentRound) async {
    return await Provider.of<FirebaseActions>(context, listen: false)
        .getUserPicks(context, currentRound);
  }

  void _getPickResults(List userPicks, List finalResults) {
    _userPicksList =
        List.from(_calcPoints.compareResults(userPicks, finalResults));

    _getPointsTotal();
  }

  void _getPointsTotal() {
    _pointsCalculated = false;
    _totalPoints = 0;
    for (int i = 0; i < _userPicksList.length; i++) {
      _totalPoints += _userPicksList[i].points;
    }

    setState(() {
      _pointsCalculated = true;
      _isLeftListLoading = false;
      _isRightListLoading = false;
    });
  }

  get eventName {}

  Widget _dropDownBoxWidget(BuildContext context) {
    return DropdownButton<String>(
      value: _dropdownValue,
      elevation: 10,
      isExpanded: true,
      onChanged: (newValue) {
        setState(() {
          _dropdownValue = newValue;
        });
        _getPicksAndResultsData(context, _dropdownValue);
      },
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurple[800],
      ),
      items: <String>[
        'round1',
        'round2',
        'round3',
        'round4',
        'round5',
        'round6',
        'round7',
        'round8',
        'round9',
        'round10',
        'round11',
        'round12',
        'round13',
        'round14',
        'round15',
        'round16',
        'round17',
        'round18',
        'round19',
        'round20',
        'round21',
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(_setGPName(value)),
        );
      }).toList(),
    );
  }

  String _setGPName(String round) {
    RaceWeekProvider _rwp = RaceWeekProvider();
    RaceWeek _raceWeek = RaceWeek();
    _raceWeek = _rwp.eventData[round];
    switch (round) {
      case 'round1':
        {
          return 'Round ${_raceWeek.round}: ${_raceWeek.trackName}';
        }
      case 'round2':
        {
          return 'Round ${_raceWeek.round}: ${_raceWeek.trackName}';
        }
      case 'round3':
        {
          return 'Round ${_raceWeek.round}: ${_raceWeek.trackName}';
        }
      case 'round4':
        {
          return 'Round ${_raceWeek.round}: ${_raceWeek.trackName}';
        }
      case 'round5':
        {
          return 'Round ${_raceWeek.round}: ${_raceWeek.trackName}';
        }
      case 'round6':
        {
          return "Round ${_raceWeek.round}: ${_raceWeek.trackName}";
        }
      case 'round7':
        {
          return 'Round ${_raceWeek.round}: ${_raceWeek.trackName}';
        }
      case 'round8':
        {
          return 'Round ${_raceWeek.round}: ${_raceWeek.trackName}';
        }
      case 'round9':
        {
          return 'Round ${_raceWeek.round}: ${_raceWeek.trackName}';
        }
      case 'round10':
        {
          return 'Round ${_raceWeek.round}: ${_raceWeek.trackName}';
        }
      case 'round11':
        {
          return 'Round ${_raceWeek.round}: ${_raceWeek.trackName}';
        }
      case 'round12':
        {
          return 'Round ${_raceWeek.round}: ${_raceWeek.trackName}';
        }
      case 'round13':
        {
          return 'Round ${_raceWeek.round}: ${_raceWeek.trackName}';
        }
      case 'round14':
        {
          return 'Round ${_raceWeek.round}: ${_raceWeek.trackName}';
        }
      case 'round15':
        {
          return 'Round ${_raceWeek.round}: ${_raceWeek.trackName}';
        }
      case 'round16':
        {
          return "Round ${_raceWeek.round}: ${_raceWeek.trackName}";
        }
      case 'round17':
        {
          return 'Round ${_raceWeek.round}: ${_raceWeek.trackName}';
        }
      case 'round18':
        {
          return 'Round ${_raceWeek.round}: ${_raceWeek.trackName}';
        }
      case 'round19':
        {
          return 'Round ${_raceWeek.round}: ${_raceWeek.trackName}';
        }
      case 'round20':
        {
          return 'Round ${_raceWeek.round}: ${_raceWeek.trackName}';
        }
      case 'round21':
        {
          return 'Round ${_raceWeek.round}: ${_raceWeek.trackName}';
        }
      default:
        return 'No GP';
    }
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Compare Results'),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Icon(Icons.more_vert_outlined),
          )
        ],
      ),
      body: Stack(
        children: [
          Column(
            children: <Widget>[
              Center(
                child: Container(
                  width: 300,
                  child: _dropDownBoxWidget(context),
                ),
              ),
              Flexible(
                flex: 5,
                fit: FlexFit.tight,
                child: Container(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          color: Colors.deepPurple[800],
                          child: _isLeftListLoading
                              ? Center(child: CircularProgressIndicator())
                              : ListView.builder(
                                  itemCount: _userPicksList.length,
                                  itemBuilder: (context, i) {
                                    return Card(
                                      color:
                                          _userPicksList[i].correctPick == true
                                              ? Colors.green
                                              : Colors.red,
                                      child: ListTile(
                                        leading: Text('${i + 1}'),
                                        title:
                                            Text('${_userPicksList[i].name}'),
                                      ),
                                    );
                                  },
                                ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Container(
                            color: Colors.orange[800],
                            child: _isRightListLoading
                                ? Center(child: CircularProgressIndicator())
                                : ListView.builder(
                                    itemCount: _resultsList.length,
                                    itemBuilder: (context, i) {
                                      return Card(
                                        child: ListTile(
                                          leading: Text('${i + 1}'),
                                          title: Text('${_resultsList[i]}'),
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
              Container(
                child: _pointsCalculated
                    ? Text('Total points this round: $_totalPoints')
                    : Text('Calculating Points...'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
