import 'package:flutter/material.dart';

class NewBuildingPlanState extends ChangeNotifier {
  bool editing = false;

  void edit() {
    editing = !editing;
    notifyListeners();
  }
}
