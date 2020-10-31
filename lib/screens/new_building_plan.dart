import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/building_plans_provider.dart';
import '../providers/item_provider.dart';
import '../widgets/added_items.dart';
import '../widgets/change_item_count_button.dart';

class NewBuildingPlan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // provider variables

    final planProvider = Provider.of<BuildingPlan>(context);
    final TextEditingController _controller = new TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(planProvider.name),
        ),
        actions: [
          FlatButton.icon(
            onPressed: () {
              var result;
              result = planProvider;
              if (planProvider.ingredients.length == 0) {
                result = null;
                BuildingPlan.id--;
              }
              Navigator.pop(context, result);
            },
            icon: Icon(
              Icons.add,
              color: Colors.white,
            ),
            label: const Text(
              "Done",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 80,
            padding: const EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  flex: 4,
                  child: TextField(
                    // maxLength: 75,
                    controller: _controller,
                    toolbarOptions: ToolbarOptions(
                        copy: true, cut: true, paste: true, selectAll: true),
                    decoration: InputDecoration(
                      labelText: "Name",
                      hintText: "Add a name to your Building Plan",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                            topLeft: Radius.circular(15)),
                        borderSide: BorderSide(
                          color: Colors.black,
                          style: BorderStyle.solid,
                          width: 10,
                        ),
                      ),
                    ),
                    onSubmitted: (String newName) {
                      planProvider.changeNameTo(newName);
                      debugPrint(
                          "value: $newName \n name: ${planProvider.name}");
                    },
                  ),
                ),
                Container(
                  height: 59,
                  width: 80,
                  decoration: BoxDecoration(
                    color: Colors.deepPurpleAccent,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(15.0),
                      topRight: Radius.circular(15.0),
                    ),
                  ),
                  child: FlatButton(
                    padding: EdgeInsets.all(0),
                    color: Colors.deepPurpleAccent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    child: Text(
                      "Reset",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      String newName = "Building Plan #${planProvider.uid}";
                      planProvider.changeNameTo(newName);
                      _controller.value = TextEditingValue(text: newName);
                      // debugPrint(_controller.text);
                    },
                  ),
                )
              ],
            ),
          ),
          Divider(
            color: Colors.black45,
          ),
          AddedItems(
              allowEdit: true,
              plan: planProvider), //Todo: could use LayoutBuilder
          Divider(
            indent: 185,
            endIndent: 185,
            color: Colors.black45,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: Info.itemList.length,
              itemBuilder: (BuildContext context, int index) {
                // Making an object of <Item> DerivedItems for each listView Item but adding it to ingredients list only when add button is pressed.

                Item item = new DerivedItem(Info.namesList[index]);
                String itemName = Info.namesList[index];

                return Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
                          child: CircleAvatar(
                            child: Image.asset(
                              "assets/items/${Info.namesList[index]}.png",
                            ),
                            backgroundColor:
                                Theme.of(context).scaffoldBackgroundColor,
                          ),
                        ),
                      ),
                      Container(
                        width: 135,
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          item.name,
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: ChangeCount(
                                  add: false,
                                  function: planProvider.removeItem,
                                  item: item),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                (planProvider.ingredients.containsValue(item))
                                    ? planProvider.ingredients[itemName].count
                                        .toString()
                                    : "0",
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: ChangeCount(
                                  add: true,
                                  function: planProvider.addItem,
                                  item: item),
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
    );
  }
}
