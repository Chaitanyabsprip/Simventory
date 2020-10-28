import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/building_plans_provider.dart';
//ignore:unused_import
import 'new_building_plan.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //providers

    final buildingPlansProvider = Provider.of<BuildingPlanBook>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Simventory'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () async {
              BuildingPlan plan = await Navigator.pushNamed<dynamic>(
                  context, '/newBuildingPlan');
              if (plan != null) {
                buildingPlansProvider.addPlan(plan);
              }
            },
          ),
        ],
      ),
      body: (buildingPlansProvider.book.length == 0)
          ? Center(child: const Text("No Building Plans added yet"))
          : ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: buildingPlansProvider.book.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 100,
                  child: Card(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: buildingPlansProvider.book.values
                          .toList()[index]
                          .ingredients
                          .length,
                      itemBuilder: (BuildContext context, int i) => Card(
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.black12,
                              maxRadius: 25,
                            ),
                            Text(buildingPlansProvider
                                .book["Building Plan #$index"]
                                .ingredients[index]
                                .count
                                .toString()),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
