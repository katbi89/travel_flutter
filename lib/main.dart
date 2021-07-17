import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import '../app_data.dart';
import '../screens/categories_trips_screen.dart';
import '../screens/filters_screen.dart';
import '../screens/tabs_screen.dart';
import '../screens/trip_detail_screen.dart';

import 'models/trip.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'summer': false,
    'winter': false,
    'family': false,
  };

  List<Trip> _availableTrips = Trips_data;
  List<Trip> _favoriteTrips = [];

  void _changeFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableTrips = Trips_data.where((trip) {
        if (_filters['summer'] == true && trip.isInSummer != true) {
          return false;
        }
        if (_filters['winter'] == true && trip.isInWinter != true) {
          return false;
        }
        if (_filters['family'] == true && trip.isForFamilies != true) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _manageFavorite(String tripId) {
    final existingIndex =
        _favoriteTrips.indexWhere((trip) => trip.id == tripId);
    if (existingIndex >= 0) {
      setState(() {
        _favoriteTrips.removeAt(existingIndex);
      });
    }
      else {
        setState(() {
          _favoriteTrips.add(Trips_data.firstWhere((trip) => trip.id == tripId),);
        });
      }
    }

    bool _isFavorite(String id) {
       return _favoriteTrips.any((trip) => trip.id == id);
    }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('ar', 'AE'),
      ],
      title: 'Travel App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.amber,
        fontFamily: 'ElMessiri',
        textTheme: ThemeData.light().textTheme.copyWith(
              headline5: TextStyle(
                color: Colors.blue,
                fontFamily: 'ElMessiri',
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              headline6: TextStyle(
                color: Colors.white,
                fontFamily: 'ElMessiri',
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      // home: CategoriesScreen(),
      initialRoute: '/',
      routes: {
        '/': (context) => TabsScreen(_favoriteTrips),
        CategoryTripsScreen.screenRoute: (context) =>
            CategoryTripsScreen(_availableTrips),
        TripDetailScreen.screenRoute: (context) => TripDetailScreen(_manageFavorite, _isFavorite),
        FiltersScreen.screenRoute: (context) =>
            FiltersScreen(_filters, _changeFilters)
      },
    );
  }
}
