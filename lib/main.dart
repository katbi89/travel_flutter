import 'package:flutter/material.dart';
import './screens/tabs_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'screens/categories_trips_screen.dart';
import 'screens/trip_detail_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
        '/': (context) => TabsScreen(),
        CategoryTripsScreen.screenRoute: (context) => CategoryTripsScreen(),
        TripDetailScreen.screenRoute: (context) => TripDetailScreen(),
      },
    );
  }
}
