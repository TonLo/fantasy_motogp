import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

class CompareResultsScreen extends StatefulWidget {
  static const routeName = '/CompareResultsScreen';
  @override
  _CompareResultsScreenState createState() => _CompareResultsScreenState();
}

class _CompareResultsScreenState extends State<CompareResultsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Compare Results'),
      ),
    );

    
  }
}
