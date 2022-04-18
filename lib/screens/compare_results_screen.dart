import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models_provider/rider_model.dart';
import '../models_provider/firebase_actions.dart';
import '../models_provider/calculate_points.dart';

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

  Future<void> getPicksAndResultsData(
      BuildContext context, String currentRound) async {
    _resultsList = await Future.any([
      getFirebaseFinalResultsList(context, currentRound),
    ]);

    _userPicksList = await Future.any([
      getUserPicks(context, currentRound),
    ]);

    for (int i = 0; i < _userPicksList.length; i++) {
      _userPicksList[i].correctPick = false;
      _userPicksList[i].points = 0;
    }

    _getPickResults(_userPicksList, _resultsList);
  }

  Future<List> getFirebaseFinalResultsList(
      BuildContext context, String currentRound) async {
    return await Provider.of<FirebaseActions>(context, listen: false)
        .getFinalResults(context, currentRound);
  }

  Future<List<Rider>> getUserPicks(
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

  Widget dropDownBoxWidget(BuildContext context) {
    return DropdownButton<String>(
      value: _dropdownValue,
      elevation: 10,
      isExpanded: true,
      onChanged: (newValue) {
        setState(() {
          _dropdownValue = newValue;
        });
        getPicksAndResultsData(context, _dropdownValue);
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
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(setGPName(value)),
        );
      }).toList(),
    );
  }

  String setGPName(String round) {
    switch (round) {
      case 'round1':
        {
          return '01: Barwa Grand Prix of Qatar';
        }
      case 'round2':
        {
          return '02: Tissot Grand Prix of Doha';
        }
      case 'round3':
        {
          return '03: Grande Prémio 888 De Portugal';
        }
      case 'round4':
        {
          return '04: Gran Premio Red Bull De España';
        }
      case 'round5':
        {
          return '05: Shark Grand Prix De France';
        }
      case 'round6':
        {
          return "06: Gran Premio D'italia Oakley";
        }
      case 'round7':
        {
          return '07: Gran Premi Monster Energy De Catalunya';
        }
      case 'round8':
        {
          return '08: Liqui Moly Motorrad Grand Prix Deutschland';
        }
      case 'round9':
        {
          return '09: Motul TT Assen';
        }
      case 'round10':
        {
          return '10: Michelin® Grand Prix of Styria';
        }
      case 'round11':
        {
          return '11: Bitci Motorrad Grand Prix Von Österreich';
        }
      case 'round12':
        {
          return '12: Monster Energy British Grand Prix';
        }
      case 'round13':
        {
          return '13: Gran Premio Tissot De Aragón';
        }
      case 'round14':
        {
          return '14: Gran Premio Octo Di San Marino E Della Riviera Di Rimini';
        }
      case 'round15':
        {
          return '15: Red Bull Grand Prix Of The Americas';
        }
      case 'round16':
        {
          return "16: Gran Premio Nolan Del Made In Italy E Dell'emilia-Romagna";
        }
      case 'round17':
        {
          return '17: Grande Prémio Brembo Do Algarve';
        }
      case 'round18':
        {
          return '18: Gran Premio Motul De La Comunitat Valenciana';
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
                  child: dropDownBoxWidget(context),
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
