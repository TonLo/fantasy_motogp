import 'package:flutter/material.dart';

import 'compare_results_screen.dart';
import 'grid_screen.dart';

class ScreenRouting extends StatefulWidget {
  @override
  State<ScreenRouting> createState() => _ScreenRoutingState();
}

class _ScreenRoutingState extends State<ScreenRouting> {
  final _navigatorKey = GlobalKey<NavigatorState>();
  int _selectedIndex = 0;

  void _navBarTappedItem(int index) {
    setState(() {
      _selectedIndex = index;
    });
    switch (index) {
      case 0:
        _navigatorKey.currentState.pushReplacementNamed('/');
        break;
      case 1:
        _navigatorKey.currentState
            .pushReplacementNamed('/CompareResultsScreen');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          if (_navigatorKey.currentState.canPop()) {
            _navigatorKey.currentState.pop();
            return false;
          }
          return true;
        },
        child: Navigator(
          key: _navigatorKey,
          initialRoute: '/',
          onGenerateRoute: (RouteSettings routeSettings) {
            WidgetBuilder builder;
            switch (routeSettings.name) {
              case '/':
                builder = (BuildContext context) => GridScreen();
                break;
              case '/CompareResultsScreen':
                builder = (BuildContext context) => CompareResultsScreen();
                break;
              default:
                throw Exception('Invalid route: ${routeSettings.name}');
            }
            return MaterialPageRoute(
              builder: builder,
              settings: routeSettings,
            );
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.grid_view_rounded),
              label: 'Grid',
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined),
              label: 'Compare Results',
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(Icons.leaderboard),
              label: 'Week By Week',
              backgroundColor: Colors.white),
        ],
        backgroundColor: Colors.black38,
        selectedItemColor: Colors.amber[900],
        unselectedItemColor: Colors.white,
        currentIndex: _selectedIndex,
        onTap: _navBarTappedItem,
      ),
    );
  }
}
