// this is working

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import './helpers/custom_route.dart';
import 'provider/great_places_data.dart';

import './screens/places_list_screen.dart';
import './screens/add_place_screen.dart';
import './screens/place_detail_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => GreatPlacesData(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Native Features',
        theme: ThemeData(
          primaryColor: Colors.indigo,
          accentColor: Colors.amber,
          fontFamily: 'Quicksand',
          pageTransitionsTheme: PageTransitionsTheme(
            builders: {
              TargetPlatform.android: CustomPageTransitionBuilder(),
              TargetPlatform.iOS: CustomPageTransitionBuilder(),
            },
          ),
        ),
        home: PlacesListScreen(),
        routes: {
          // '/': (_) => HomeScreen(),
          AddPlaceScreen.routeName: (_) => AddPlaceScreen(),
          PlaceDetailScreen.routeName: (_) => PlaceDetailScreen(),
        },
      ),
    );
  }
}
