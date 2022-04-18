import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';

import 'models_provider/rider_model.dart';
import './models_provider/authenticate.dart';
import './models_provider/grid_provider.dart';
import './models_provider/calculate_points.dart';
import './models_provider/firebase_actions.dart';
import './models_provider/rider_data.dart';
import './screens/login_screen.dart';
import './screens/screen_routing.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(FantasyMotogp());
}

class FantasyMotogp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Rider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Authenticate(),
        ),
        ChangeNotifierProvider<GridProvider>(
          create: (ctx) => GridProvider(),
        ),
        ChangeNotifierProvider<CalculatePoints>(
          create: (ctx) => CalculatePoints(),
        ),
        ChangeNotifierProvider<FirebaseActions>(
          create: (ctx) => FirebaseActions(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => RiderData(),
        ),
      ],
      child: MaterialApp(
        title: 'FantasyGP',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (ctx, userSnapshot) {
              if (!userSnapshot.hasData) {
                return AuthScreen();
              }
              return ScreenRouting();
            }),
        // routes: {
        //   GridScreen.routeName: (BuildContext ctx) => GridScreen(),
        //   CompareResultsScreen.routeName: (BuildContext ctx) =>
        //       CompareResultsScreen(),
        // },
      ),
    );
  }
}
