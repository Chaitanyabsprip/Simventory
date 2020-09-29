class Item {
  int _count = 0;
  int time;
  var materialsReqd;
  String name;

  Item(String name) {
    this.name = name;
  }
  int incrementCount() {
    if (_count >= 0) {
      _count += 1;
    }
    print('$_count $name');
    return _count;
  }

  int decrementCount() {
    if (_count != 0) {
      _count -= 1;
    }
    print('$_count $name');
    return _count;
  }

  int get count {
    return _count;
  }
}

class Materials {
  Item metal = new Item('Metal');
  Item wood = new Item('Wood');
  Item plastic = new Item('Plastic');
  Item seeds = new Item('Seeds');
  Item minerals = new Item('Minerals');
  Item chemicals = new Item('Chemicals');
  Item textiles = new Item('Textiles');
  Item sugarAndSpice = new Item('Sugar and Spice');
  Item glass = new Item('Glass');
  Item animalFeed = new Item('Animal Feed');
  Item electronicComponents = new Item('Electronic Components');

  Item nails = new Item('Nails');
  Item plank = new Item('Plank');
  Item bricks = new Item('Bricks');
  Item cement = new Item('Cement');
  Item glue = new Item('Glue');
  Item paint = new Item('Paint');

  Item hammer = new Item('Hammer');
  Item measuringTape = new Item('Measuring Tape');
  Item shovel = new Item('Shovel');
  Item cookingUtensils = new Item('Cooking Utensils');
  Item ladder = new Item('Ladder');
  Item drill = new Item('Drill');

  Item vegetables = new Item('Vegetables');
  Item flourBag = new Item('Flour Bag');
  Item frutiAndBerries = new Item('Fruit and Berries');
  Item cream = new Item('Cream');
  Item corn = new Item('Corn');
  Item cheese = new Item('Cheese');
  Item beef = new Item('Beef');

  var itemList;

  Materials() {
    itemList = <Item>[
      metal,
      wood,
      plastic,
      seeds,
      minerals,
      chemicals,
      textiles,
      sugarAndSpice,
      glass,
      animalFeed,
      electronicComponents,
      nails,
      plank,
      bricks,
      cement,
      glue,
      paint,
      hammer,
      measuringTape,
      shovel,
      cookingUtensils,
      ladder,
      drill,
      vegetables,
      flourBag,
      frutiAndBerries,
      cream,
      corn,
      cheese,
      beef,
    ];
  }
}

class Upgrade {}

class OngoingUpgradesList {
  var ongoingUpgrades = [];

  void addBuild(newUpgrade) {
    ongoingUpgrades.insert(0, newUpgrade);
  }
}
