import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/app_bar.dart';
import '../providers/building_plans_provider.dart';
import '../providers/item_provider.dart';
import '../providers/new_building_plan_state_provider.dart';
import '../widgets/added_items.dart';
import '../widgets/change_item_count_button.dart';

class NewBuildingPlan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // provider variables

    final titleEditingState = Provider.of<NewBuildingPlanState>(context);
    final planProvider = Provider.of<BuildingPlan>(context);
    final TextEditingController _controller = new TextEditingController();

    return Scaffold(
      appBar: AppBar(
        flexibleSpace: GradientAppBar(),
        title: Center(
          child: FlatButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Text(planProvider.name,
                style: TextStyle(color: Colors.white, fontSize: 18)),
            onPressed: () {
              titleEditingState.edit();
            },
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color(0xFFFFFFFF),
              Color(0xFFD8F6FD),
            ],
          ),
        ),
        child: Column(
          children: <Widget>[
            titleEditingState.editing
                ? Container(
                    height: 80,
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Expanded(
                          flex: 4,
                          child: TextField(
                            controller: _controller,
                            toolbarOptions: ToolbarOptions(
                                copy: true,
                                cut: true,
                                paste: true,
                                selectAll: true),
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
                              titleEditingState.edit();
                            },
                          ),
                        ),
                        Container(
                          height: 59,
                          width: 50,
                          decoration: BoxDecoration(
                            color: Color(0xFF1578B5),
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(15.0),
                              topRight: Radius.circular(15.0),
                            ),
                          ),
                          child: FlatButton(
                            padding: EdgeInsets.all(0),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            child: Icon(
                              Icons.check,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              if (_controller.value.text != '') {
                                planProvider
                                    .changeNameTo(_controller.value.text);
                              } else {
                                String newName =
                                    "Building Plan #${planProvider.uid}";
                                planProvider.changeNameTo(newName);
                              }
                              titleEditingState.edit();
                            },
                          ),
                        )
                      ],
                    ),
                  )
                : Container(),
            Divider(
              color: Colors.black45,
            ),
            AnimatedContainer(
              curve: Curves.fastOutSlowIn,
              duration: Duration(milliseconds: 800),
              height: planProvider.ingredients.length == 0
                  ? 0
                  : (planProvider.ingredients.length % 3 == 0
                      ? 50.0 *
                          ((planProvider.ingredients.length / 3).ceil() + 1)
                      : 50.0 * ((planProvider.ingredients.length / 3).ceil())),
              child: Stack(
                children: [
                  AddedItems(allowEdit: true, plan: planProvider),
                  Positioned(
                    bottom: 8.0,
                    right: 24.0,
                    child: AnimatedContainer(
                      curve: Curves.ease,
                      duration: Duration(milliseconds: 800),
                      height: planProvider.ingredients.length == 0 ? 0.0 : 36.0,
                      child: RaisedButton(
                        onPressed: () {
                          var result;
                          result = planProvider;
                          if (planProvider.ingredients.length == 0) {
                            result = null;
                            BuildingPlan.id--;
                          }
                          Navigator.pop(context, result);
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0)),
                        padding: EdgeInsets.all(0.0),
                        child: Ink(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color(0xFFFFE4D6),
                                  Color(0xFFFF630C),
                                ],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                              borderRadius: BorderRadius.circular(18.0)),
                          child: Container(
                            constraints:
                                BoxConstraints(maxWidth: 88.0, minHeight: 36.0),
                            alignment: Alignment.center,
                            child: Text(
                              "Done",
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ), //Todo: could use LayoutBuilder
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
      ),
    );
  }
}
