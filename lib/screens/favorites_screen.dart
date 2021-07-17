import 'package:flutter/material.dart';
import '../widgets/trip_item.dart';
import '../models/trip.dart';

class FavoritesScreen extends StatelessWidget {
  // const FavoritesScreen({Key key}) : super(key: key);

  final List<Trip> favoriteTrips;

  FavoritesScreen(this.favoriteTrips);

  @override
  Widget build(BuildContext context) {
    if (favoriteTrips.isEmpty) {
      return Center(
        child: Text('ليس لديك أي رحلة في قائمة المفضلة'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (context, index) {
          return TripItem(
              id: favoriteTrips[index].id,
              title: favoriteTrips[index].title,
              duration: favoriteTrips[index].duration,
              imageUrl: favoriteTrips[index].imageUrl,
              season: favoriteTrips[index].season,
              tripType: favoriteTrips[index].tripType,
              // removeItem: _removeTrip);
        },
        itemCount: favoriteTrips.length,
      );
    }
  }
}
