import 'package:flutter/material.dart';

class Info {
  static final Map<String, Map<String, dynamic>> _itemsList = Map.unmodifiable(
    {
      "Metal": {"time": 1},
      "Wood": {"time": 3},
      "Plastic": {"time": 9},
      "Seeds": {"time": 20},
      "Minerals": {"time": 30},
      "Chemicals": {"time": 120},
      "Textiles": {"time": 180},
      "Sugar and Spices": {"time": 240},
      "Glass": {"time": 300},
      "Animal Feed": {"time": 360},
      "Electrical Components": {"time": 420},
    },
  );

  static List<String> get namesList => _itemsList.keys.toList();

  static Map get itemList => _itemsList;
}

class Item {
  //fields

  String name;
  int count = 0;

  //constructors

  Item();

  Item.add(String name) {
    this.name = name;
    this.count = 0;
  }

  //getters

  int get time => Info.itemList[name]["time"];

  //methods

  void incrementCount() {
    this.count++;
  }

  void decrementCount() {
    this.count++;
  }

  @override
  bool operator ==(Object other) => other is Item && name == other.name;

  @override
  int get hashCode => name.hashCode;

  @override
  String toString() => "($name, $count, $time)";
}

class DerivedItem extends Item with ChangeNotifier {
  // ignore: unused_field
  List<Item> _materialsRequired = [];

  DerivedItem(String name) {
    super.name = name;
    super.count = 0;
    this._materialsRequired = Info.itemList[name]["materialsRequired"];
  }

  int get time => Info.itemList[name]["time"];

  void incrementCount() {
    this.count++;
    notifyListeners();
  }

  void decrementCount() {
    this.count--;
    notifyListeners();
  }
}
