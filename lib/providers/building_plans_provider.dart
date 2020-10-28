import 'package:flutter/Material.dart';
import 'item_provider.dart';

class BuildingPlan with ChangeNotifier {
  //fields

  static int id = 0;
  int uid;
  String name;
  List<Item> ingredients = [];

  /* int numberOfItems;
  int totalNumberOfItems; */

  BuildingPlan() {
    id++;
    uid = id;
    name = "Building Plan #$uid";
  }

  //methods

  void addItem(Item item) {
    if (!ingredients.contains(item)) {
      ingredients.add(item);
    }
    item.incrementCount();
    notifyListeners();
  }

  void removeItem(String itemName) {
    Item item;
    for (var i in ingredients) {
      if (itemName == i.name) item = i;
    }
    if (ingredients.contains(item) && item.count > 0) {
      item.decrementCount();

      if (item.count == 1) {
        ingredients.remove(itemName);
      }
    }
    notifyListeners();
  }
}

class BuildingPlanBook with ChangeNotifier {
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

  BuildingPlanBook();

  void newBuildingPlan() {
    buildingPlan = new BuildingPlan();
    notifyListeners();
  }

  void addPlan(BuildingPlan plan) {
    /* if (buildingPlanName == "") {
      _buildingPlan.name = buildingPlanName;
    } */
    book[plan.name] = plan;
    notifyListeners();
  }

  void removeBuildingPlan(String name) {
    if (book.containsKey(name)) {
      book.remove(name);
    }
    notifyListeners();
  }
}
