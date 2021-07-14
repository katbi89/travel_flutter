import 'package:flutter/material.dart';
import 'package:working/widgets/app_drawer.dart';

class FiltersScreen extends StatelessWidget {
  const FiltersScreen({Key key}) : super(key: key);

  static const screenRoute = '/filters';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('الفلترة'),
      ),
      drawer: AppDrawer(),
      body: Center(
        child: Text('هذه صفحة الفلترة'),
      ),
    );
  }
}
