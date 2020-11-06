import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simventory/providers/home_screen_state_providers.dart';
import 'data/building_plans.dart';
import 'screens/home.dart';

void main() {
  runApp(Simventory());
}

class Simventory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<BuildingPlanBook>(
          create: (context) => BuildingPlanBook(),
        ),
        ChangeNotifierProvider<HomeScreenState>(
          create: (context) => HomeScreenState(),
        )
      ],
      child: MaterialApp(
        title: 'Simventory',
        theme: ThemeData(
            primaryColor: Color.fromRGBO(1, 76, 131, 1),
            scaffoldBackgroundColor: Color(0xFFFFFFFF),
            accentColor: Color(0xFF54DAF7),
            textTheme: TextTheme(
                headline6:
                    TextStyle(fontSize: 20, fontWeight: FontWeight.w400))),
        home: Home(),
      ),
    );
  }
}
