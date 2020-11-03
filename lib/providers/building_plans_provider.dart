import 'package:flutter/Material.dart';
import 'item_provider.dart';

class BuildingPlan with ChangeNotifier {
  BuildingPlan() {
    id++;
    uid = id;
    name = "Building Plan #$uid";
  }

  //fields

  String name;
  int uid;
  static int id = 0;
  Map<String, Item> ingredients = {};

  //getters

  int get numberOfItems {
    int totalCount = 0;
    for (var item in ingredients.values) {
      totalCount += item.count;
    }
    return totalCount;
  }

  int get totalTimeTaken {
    int totalTime = 0;
    for (var item in ingredients.values) {
      totalTime += item.time;
    }
    return totalTime;
  }

  //methods

  void addItem(Item item) {
    if (!ingredients.containsValue(item)) {
      ingredients[item.name] = item;
    }
    ingredients[item.name].incrementCount();
    _sortIngredients();
    notifyListeners();
  }

  void removeItem(String itemName) {
    Item item = ingredients[itemName];
    if (ingredients.containsKey(itemName)) {
      item.decrementCount();
      if (ingredients[itemName].count <= 0) ingredients.remove(itemName);
    }
    notifyListeners();
  }

  void changeNameTo(String newName) {
    name = newName;
    notifyListeners();
  }

  void _sortIngredients() {
    Map<int, Item> timeToItem = {};
    List<int> sortedList;
    Map<String, Item> temp = {};
    for (var item in ingredients.values) {
      timeToItem[item.time] = item;
    }
    sortedList = timeToItem.keys.toList();
    sortedList.sort();
    for (var i in sortedList) {
      temp[timeToItem[i].name] = ingredients[timeToItem[i].name];
    }
    ingredients = temp;
  }

  void notify() => notifyListeners();

  @override
  String toString() => "$name: ${ingredients.values.toList()}";
}

class BuildingPlanBook extends ChangeNotifier {
  BuildingPlanBook();

  //fields

  BuildingPlan buildingPlan;
  Map<String, BuildingPlan> book = {};
  Map recipeType = Map.unmodifiable(
    {
      1: "Building",
      2: "Ship Shipment",
      3: [
        "Air Shipment",
        {1: "Paris", 2: "London", 3: "Tokyo"}
      ],
      4: "War Delivery",
      5: "Citizen Offers",
    }, //*not happy with this strucuture
  );

  //methods

  void addPlan(BuildingPlan plan) {
    book[plan.name] = plan;
    notifyListeners();
  }

  void removePlan(String name) {
    if (book.containsKey(name)) {
      book.remove(name);
    }
    notifyListeners();
  }
}
