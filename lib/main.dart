import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';

import './models-provider/riderModel.dart';
import './screens/pick_rider_screen.dart';
import './screens/rider_selected_screen.dart';
import './models-provider/authenticate.dart';
import './widgets/login_screen.dart';
import 'models-provider/grid_model.dart';

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
        ChangeNotifierProvider<GridModel>(
          create: (ctx) => GridModel(),
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
              return RiderSelectedScreen();
            }),
        routes: {
          PickRiderScreen.routeName: (BuildContext ctx) => PickRiderScreen(),
          RiderSelectedScreen.routeName: (BuildContext ctx) =>
              RiderSelectedScreen(),
        },
      ),
    );
  }
}
