class Info {
  final Map details = Map.unmodifiable({
    'metal': {'name': 'Metal', 'time': 1},
    'wood': {'name': 'Wood', 'time': 3},
    'palstic': {'name': 'Plastic', 'time': 9},
    'seeds': {'name': 'Seeds', 'time': 20},
    'minerals': {'name': 'Minerals', 'time': 30},
    'chemicals': {'name': 'Chemicals', 'time': 120},
    'textiles': {'name': 'Textiles', 'time': 180},
    'sugar': {'name': 'Sugar and Spices', 'time': 240},
    'glass': {'name': 'Glass', 'time': 300}
  });
}

class Items extends Info {
  String name;
  int time;
  Items();
  Items.add(this.name, this.time);
}

class Materials extends Items {
  Materials materialsReqd;
  Map details;
  Materials();

  Materials.add(Map details) {
    Items.add(details['name'], details['time']);
    this.materialsReqd = details['materialsReqd'];
  }
}

class Data extends Materials {
  final String string = 'inside class Data';
  Data();
}
