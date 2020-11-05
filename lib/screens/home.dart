import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/building_plans_provider.dart';
import '../providers/new_building_plan_state_provider.dart';
import '../screens/new_building_plan.dart';
import '../screens/plan_description.dart';
import '../widgets/added_items.dart';
import '../widgets/app_bar.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //providers

    final buildingPlansProvider = Provider.of<BuildingPlanBook>(context);
    final bool planExists = buildingPlansProvider.book.length != 0;

    return Scaffold(
      appBar: AppBar(
        flexibleSpace: GradientAppBar(),
        title: Center(child: const Text('Simventory')),
      ),
      floatingActionButton: Container(
        width: 60,
        height: 60,
        margin: const EdgeInsets.all(16.0),
        child: FloatingActionButton(
          // backgroundColor: Color(0xFFFF630C),
          clipBehavior: Clip.hardEdge,
          elevation: 8,
          child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: <Color>[
                  Color(0xFFFF630C),
                  Color(0xFFBA3B0C),
                ],
                stops: [0.3, 1],
              ),
            ),
            child: Icon(
              Icons.add,
              color: Colors.white,
              size: 28,
            ),
          ),
          onPressed: () async {
            final BuildingPlan plan = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MultiProvider(
                  providers: [
                    ChangeNotifierProvider(
                      create: (context) => BuildingPlan(),
                    ),
                    ChangeNotifierProvider(
                      create: (context) => NewBuildingPlanState(),
                    ),
                  ],
                  child: NewBuildingPlan(),
                ),
              ),
            );
            if (plan != null) {
              print(plan);
              buildingPlansProvider.addPlan(plan);
            } else {
              BuildingPlan.id--;
            }
          },
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color.lerp(Color(0xFFC4F4FF), Color(0xFFFFFFFF), 0.5),
              Color.lerp(Color(0xFFC4F4FF), Color(0xFFFFFFFF), 0.7),
              Color.lerp(Color(0xFFC4F4FF), Color(0xFFFFFFFF), 0.9),
              Color(0xFFFFFFFF),
              Color(0xFFFFFFFF),
              Color(0xFFFFFFFF),
              Color.lerp(Color(0xFFC4F4FF), Color(0xFFFFFFFF), 0.9),
              Color.lerp(Color(0xFFC4F4FF), Color(0xFFFFFFFF), 0.7),
              Color.lerp(Color(0xFFC4F4FF), Color(0xFFFFFFFF), 0.5),
            ],
            // stops: [0.45, 1],
          ),
        ),
        child: !planExists ? DefaulWidget() : Book(),
      ),
    );
  }
}

class DefaulWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 150,
        child: const Text(
          "No Building Plans added yet",
          style: TextStyle(fontSize: 18, color: Color(0xAA014779)),
        ),
      ),
    );
  }
}

class Book extends StatelessWidget {
  Book({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final buildingPlansProvider = Provider.of<BuildingPlanBook>(context);
    return ListView.builder(
      itemCount: buildingPlansProvider.book.entries.length,
      itemBuilder: (BuildContext context, int index) {
        final plan = buildingPlansProvider.book.values.toList()[index];
        bool isExpanded = false;
        return Card(
          elevation: 3,
          color: Color(0xFCFEFCFF),
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: ExpansionTile(
            tilePadding: const EdgeInsets.only(right: 8.0),
            subtitle: Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Number of Items: ${plan.numberOfItems.toString()}',
                    style: TextStyle(color: Colors.black54),
                  ),
                  Text(
                    'Total Time: ${plan.convertedTime()}',
                    style: TextStyle(color: Colors.black54),
                  )
                ],
              ),
            ),
            children: [
              AddedItems(
                plan: plan,
                allowEdit: false,
                oneRow: true,
              ),
            ],
            onExpansionChanged: (value) {
              isExpanded = !isExpanded;
            },
            title: FlatButton(
              onPressed: () async {
                bool isDeleted = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChangeNotifierProvider(
                      create: (context) => NewBuildingPlanState(),
                      child: PlanDescription(
                        plan,
                      ),
                    ),
                  ),
                );
                isDeleted ??= false;
                if (isDeleted) buildingPlansProvider.removePlan(plan.name);
              },
              child: Container(
                width: double.infinity,
                child: Text(
                  buildingPlansProvider.book.values.toList()[index].name,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
