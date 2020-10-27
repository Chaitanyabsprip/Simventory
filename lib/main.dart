import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/building_plans_provider.dart';
import 'screens/home.dart';
import 'screens/new_building_plan.dart';

void main() {
  runApp(Simventory());
}

class Simventory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => BuildingPlanBook(),
      child: new MaterialApp(
        title: 'Simventory',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          accentColor: Colors.deepOrange,
        ),
        initialRoute: '/',
        routes: {
          '/': (_) => Home(),
          '/newBuildingPlan': (_) => NewBuildingPlan(),
        },
      ),
    );
  }
}
