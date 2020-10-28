import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/building_plans_provider.dart';
import '../providers/item_provider.dart';

class NewBuildingPlan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // provider variables

    final planProvider = Provider.of<BuildingPlan>(context);
    debugPrint(planProvider.name);

    return Scaffold(
      appBar: AppBar(title: const Text("New Building Plan")),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text("Done"),
        onPressed: () {
          Navigator.pop(context, planProvider);
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Container(),
            ),
            Expanded(
              flex: 5,
              child: ListView.builder(
                itemCount: Info.itemList.length,
                itemBuilder: (BuildContext context, int index) {
                  // Making an object of <Item> DerivedItems for each listView Item but adding it to ingredients list only when add button is pressed.

                  Item item = new DerivedItem(Info.namesList[index]);

                  return Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: CircleAvatar(
                            backgroundColor: Colors.black12,
                            maxRadius: 25.0,
                            minRadius: 25.0,
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 24.0),
                            child: Text(
                              item.name,
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 5,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: FlatButton.icon(
                                  icon: Icon(Icons.remove),
                                  label: Text(""),
                                  onPressed: () {
                                    planProvider.removeItem(item.name);
                                  },
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Text(
                                  (planProvider.ingredients.contains(item))
                                      ? planProvider.ingredients[index].count
                                          .toString()
                                      : "0",
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: FlatButton.icon(
                                  icon: Icon(Icons.add),
                                  label: Text(""),
                                  onPressed: () => planProvider.addItem(item),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
