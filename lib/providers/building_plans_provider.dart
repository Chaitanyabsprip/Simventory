import 'package:flutter/Material.dart';
import 'item_provider.dart';

class BuildingPlan with ChangeNotifier {
  //fields

  static int id = 0;
  int uid;
  String name;
  Map<String, Item> ingredients = {};

  /* int numberOfItems;
  int totalNumberOfItems; */

  BuildingPlan() {
    id++;
    uid = id;
    name = "Building Plan #$uid";
  }

  //methods

  void addItem(Item item) {
    if (ingredients.containsKey(item.name)) {
      ingredients[item.name].incrementCount();
    } else {
      ingredients[item.name] = item;
    }
    notifyListeners();
  }

  void removeItem(String itemName) {
    if (ingredients.containsKey(itemName) && ingredients[itemName].count > 0) {
      ingredients[itemName].decrementCount();

      if (ingredients[itemName].count == 0) {
        ingredients.remove(itemName);
      }
    }
    notifyListeners();
  }
}

class BuildingPlanBook with ChangeNotifier {
  BuildingPlan buildingPlan;
  Map<String, BuildingPlan> plans = {};
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
    plans[plan.name] = plan;
    notifyListeners();
  }

  void removeBuildingPlan(String name) {
    if (plans.containsKey(name)) {
      plans.remove(name);
    }
    notifyListeners();
  }
}
