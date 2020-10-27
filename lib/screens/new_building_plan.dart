import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/building_plans_provider.dart';
import '../providers/item_provider.dart';

class NewBuildingPlan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // provider variables

    final itemProvider = Provider.of<DerivedItem>(context);
    final planProvider = Provider.of<BuildingPlan>(context);
    return Scaffold(
      appBar: AppBar(title: const Text("New Building Plan")),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text("Done"),
        onPressed: () {
          Navigator.of(context).pop(planProvider);
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: AddedItemList(),
            ),
            Expanded(
              flex: 5,
              child: ListView.builder(
                itemCount: Info.itemList.length,
                itemBuilder: (BuildContext context, int index) {
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
                              Info.namesList[index],
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
                                    planProvider
                                        .removeItem(Info.namesList[index]);
                                  },
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Text(
                                  (planProvider.ingredients
                                          .containsKey(Info.namesList[index]))
                                      ? planProvider
                                          .ingredients[Info.namesList[index]]
                                          .count
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
                                  onPressed: () => planProvider.addItem(
                                    Item.add(Info.namesList[index]),
                                  ),
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

class AddedItemList extends StatefulWidget {
  @override
  _AddedItemListState createState() => _AddedItemListState();
}

class _AddedItemListState extends State<AddedItemList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 50,
      itemBuilder: (BuildContext context, int index) {
        return null; // TODO: add a stateful widget to show items that have been added and their count.
      },
    );
  }
}
