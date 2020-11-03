import 'package:flutter/cupertino.dart';

class ExpansionPanelState extends ChangeNotifier {
  ExpansionPanelState({
    this.expandedValue,
    this.headerValue,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded = false;

  void updateExpansionState() {
    isExpanded = !isExpanded;
    print(isExpanded);
    notifyListeners();
  }
}
