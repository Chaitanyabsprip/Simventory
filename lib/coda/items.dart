import 'dart:collection';

class Items {
  String name;
  int count;
  int time;
  Items materialsReqd;

  Items(this.name, this.time, {this.materialsReqd, this.count = 0});
}

class Materials {
  List<Items> _itemList = [
    Items('Metal', 1),
    Items('Wood', 3),
    Items('Minerals', 30),
    Items('Plastic', 9),
    Items('Seeds', 20),
    Items('Minerals', 30),
    Items('Chemicals', 120),
    Items('Textiles', 180),
    Items('Sugar and Spice', 240),
    Items('Glass', 300),
    Items('Animal Feed', 360),
    Items('Electronic Components', 420),
    Items('Nails', 5, materialsReqd: Items('Metals', 1, count: 2))
  ];

  // Items nails = new Items('Nails');
  // Items plank = new Items('Plank');
  // Items bricks = new Items('Bricks');
  // Items cement = new Items('Cement');
  // Items glue = new Items('Glue');
  // Items paint = new Items('Paint');

  // Items hammer = new Items('Hammer');
  // Items measuringTape = new Items('Measuring Tape');
  // Items shovel = new Items('Shovel');
  // Items cookingUtensils = new Items('Cooking Utensils');
  // Items ladder = new Items('Ladder');
  // Items drill = new Items('Drill');

  // Items vegetables = new Items('Vegetables');
  // Items flourBag = new Items('Flour Bag');
  // Items frutiAndBerries = new Items('Fruit and Berries');
  // Items cream = new Items('Cream');
  // Items corn = new Items('Corn');
  // Items cheese = new Items('Cheese');
  // Items beef = new Items('Beef');

  Materials();

  int itemListCount(index) => _itemList[index].count;

  void incrementCount(index) {
    // ignore: unnecessary_statements
    _itemList[index].count >= 0 ? _itemList[index].count += 1 : null;
    print(
        '${_itemList[index].name} - ${_itemList[index].count} at index $index');
  }

  void decrementCount(index) {
    // ignore: unnecessary_statements
    _itemList[index].count > 0 ? _itemList[index].count -= 1 : null;
    print(
        '${_itemList[index].name} - ${_itemList[index].count} at index $index');
  }

  UnmodifiableListView<Items> getList() {
    return UnmodifiableListView<Items>(_itemList);
  }
}

class MaterialList {
  List<Materials> materialList = [Materials()];

  List<Materials> getAllMaterialList() {
    return materialList;
  }

  void newUpgrade() {
    materialList.add(Materials());
    print(materialList.length);
  }
}

// class Upgrade {
//   Materials materials = new Materials();
//   List<Items> currentUpgrade = [];

//   void addItem(Items item) {
//     if (!currentUpgrade.contains(item)) {
//       currentUpgrade.add(item);
//     }
//   }

//   void removeItem(Items item) {
//     if (currentUpgrade.contains(item) && item.count == 0) {
//       currentUpgrade.remove(item);
//     }
//   }
// }

class Data {
  final Materials items = new Materials();
  final MaterialList upgrade = new MaterialList();

  Data();
}
