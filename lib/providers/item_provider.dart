import 'package:flutter/material.dart';

class Info {
  static final Map _itemsList = Map.unmodifiable(
    {
      "metal": {"name": "Metal", "time": 1},
      "wood": {"name": "Wood", "time": 3},
      "plastic": {"name": "Plastic", "time": 9},
      "seeds": {"name": "Seeds", "time": 20},
      "minerals": {"name": "Minerals", "time": 30},
      "chemicals": {"name": "Chemicals", "time": 120},
      "textiles": {"name": "Textiles", "time": 180},
      "sugar": {"name": "Sugar and Spices", "time": 240},
      "glass": {"name": "Glass", "time": 300},
    },
  );

  //getters

  static List<String> get namesList {
    List<String> namesList = new List();
    for (var value in _itemsList.values) {
      namesList.add(value["name"]);
    }
    return namesList.toList();
  }

  static Map get itemList => _itemsList;
}

class Item {
  //fields

  String name;
  int count;
  int time;

  //constructors

  Item();

  Item.add(String name) {
    this.name = name;
    this.time = Info.itemList[name.toLowerCase()]["time"];
    this.count = 1;
  }

  //methods

  void incrementCount() {
    count++;
  }

  void decrementCount() {
    count++;
  }

  String toString() => "{'$name', $count, ${count * time}}";
}

class DerivedItem extends Item with ChangeNotifier {
  // ignore: unused_field
  List<Item> _materialsRequired;

  DerivedItem(String name, {List<Item> materialsRequired}) {
    super.name = name;
    super.time = Info.itemList[name]["time"];
    super.count = 1;
    this._materialsRequired = materialsRequired;
  }

  void incrementCount() {
    count++;
    notifyListeners();
  }

  void decrementCount() {
    count--;
    notifyListeners();
  }
}
