import 'package:flutter/material.dart';
import 'package:working/widgets/trip_item.dart';
import 'package:working/app_data.dart';

class CategoryTripsScreen extends StatelessWidget {
  static const screenRoute = '/category-trips';
  // final String categoryId;
  // final String categoryTitle;

  // CategoryTripsScreen(this.categoryId, this.categoryTitle);
  @override
  Widget build(BuildContext context) {
    final routeArgument =
        ModalRoute.of(context).settings.arguments as Map<String, String>;

    final categoryId = routeArgument['id'];
    final categoryTitle = routeArgument['title'];
    final filteredTrips = Trips_data.where((trip) {
      return trip.categories.contains(categoryId);
    }).toList();
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return TripItem(
                id: filteredTrips[index].id,
                title: filteredTrips[index].title,
                duration: filteredTrips[index].duration,
                imageUrl: filteredTrips[index].imageUrl,
                season: filteredTrips[index].season,
                tripType: filteredTrips[index].tripType);
          },
          itemCount: filteredTrips.length,
        ));
  }
}
