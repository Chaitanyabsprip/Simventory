class Info {
  final Map itemsList = Map.unmodifiable(
    {
      'metal': {'name': 'Metal', 'time': 1},
      'wood': {'name': 'Wood', 'time': 3},
      'palstic': {'name': 'Plastic', 'time': 9},
      'seeds': {'name': 'Seeds', 'time': 20},
      'minerals': {'name': 'Minerals', 'time': 30},
      'chemicals': {'name': 'Chemicals', 'time': 120},
      'textiles': {'name': 'Textiles', 'time': 180},
      'sugar': {'name': 'Sugar and Spices', 'time': 240},
      'glass': {
        'name': 'Glass',
        'time': 300
      }, //? Does this make sense or should I add another layer specifying which shop the item's made in?
    },
  );
}

class Item extends Info {
  String name;
  int time;
  int count;
  Item();
  Item.add(Map itemInfo) {
    this.name = itemInfo["name"];
    this.time = itemInfo["time"];
    this.count = 1;
  }

  String get itemName {
    return name;
  }

  int get itemTime {
    return time;
  }
}

class DerivedItems extends Item {
  Item materialsReqd;

  DerivedItems();

  DerivedItems.add(Map itemInfo) {
    super.name = itemInfo["name"];
    this.materialsReqd = itemInfo['materialsReqd'];
  }
}

class Recipe {
  int id;
  int numberOfItems;
  int totalNumberOfItems;
  List itemList;
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

  Recipe();

//TODO: Add functionality to these methods

  void addItem(Map itemInfo) {
    itemList.add(new Item.add(itemInfo));
  }

  void removeItem() {}
  void calculateTotalTime() {}
  void calculateTotalValue() {}
//!I dont think these method should be a part of this class
  void addRecipe() {}
  void removeRecipe() {}
  void recipeComplete() {}
}

class Data extends Recipe {}
