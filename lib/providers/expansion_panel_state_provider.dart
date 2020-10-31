import 'package:flutter/cupertino.dart';

import 'building_plans_provider.dart';

class ExpansionPanelState extends ChangeNotifier {
  ExpansionPanelState({
    this.expandedValue,
    this.headerValue,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;

  void updateExpansionState() {
    isExpanded = !isExpanded;
    notifyListeners();
  }
}
