import 'package:flutter/material.dart';
import 'package:working/models/trip.dart';
import '../widgets/trip_item.dart';
import '../app_data.dart';

class CategoryTripsScreen extends StatefulWidget {
  static const screenRoute = '/category-trips';

  final List<Trip> availableTrips;

  CategoryTripsScreen(this.availableTrips);

  @override
  _CategoryTripsScreenState createState() => _CategoryTripsScreenState();
}

class _CategoryTripsScreenState extends State<CategoryTripsScreen> {
  String categoryTitle;
  List<Trip> filteredTrips;
  @override
  void initState() {
    //....
    super.initState();
  }

  @override
  void didChangeDependencies() {
    final routeArgument =
        ModalRoute.of(context).settings.arguments as Map<String, String>;

    final categoryId = routeArgument['id'];
    categoryTitle = routeArgument['title'];
    filteredTrips = widget.availableTrips.where((trip) {
      return trip.categories.contains(categoryId);
    }).toList();
    super.didChangeDependencies();
  }

  void _removeTrip(String tripId) {
    setState(() {
      filteredTrips.removeWhere((trip) => trip.id == tripId);
    });
  }

  @override
  Widget build(BuildContext context) {
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
                tripType: filteredTrips[index].tripType,
                removeItem: _removeTrip);
          },
          itemCount: filteredTrips.length,
        ));
  }
}
