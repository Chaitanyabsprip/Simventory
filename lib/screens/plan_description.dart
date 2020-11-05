import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simventory/widgets/edit_name.dart';
import '../providers/new_building_plan_state_provider.dart';
import '../widgets/app_bar.dart';
import '../providers/building_plans_provider.dart';
// ignore: unused_import
import '../widgets/added_items.dart';

class PlanDescription extends StatelessWidget {
  PlanDescription(this.plan);
  final BuildingPlan plan;
  @override
  Widget build(BuildContext context) {
    final titleEditingState = Provider.of<NewBuildingPlanState>(context);

    return Scaffold(
      appBar: AppBar(
        flexibleSpace: GradientAppBar(),
        title: Center(
          child: FlatButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Text(plan.name,
                style: TextStyle(color: Colors.white, fontSize: 18)),
            onPressed: () {
              titleEditingState.edit();
            },
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              Navigator.pop(context, true);
            },
          ),
        ],
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
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            children: [
              titleEditingState.editing
                  ? EditName("Name", "Add a name to your Building Plan", plan)
                  : Container(),
              Expanded(
                flex: 1,
                child: Card(
                  margin: const EdgeInsets.all(8.0),
                  elevation: 4,
                  child: Column(
                    children: [
                      Container(
                        padding:
                            const EdgeInsets.only(left: 8, right: 8, top: 8),
                        width: double.infinity,
                        child: Text("Added Items:"),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Card(
                        margin: const EdgeInsets.all(8.0),
                        elevation: 4,
                        child: Container(),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Card(
                        margin: const EdgeInsets.all(8.0),
                        elevation: 4,
                        child: Container(),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Card(
                  margin: const EdgeInsets.all(8.0),
                  elevation: 4,
                  child: Container(),
                ),
              ),
              Expanded(
                flex: 1,
                child: Card(
                  margin: const EdgeInsets.all(8.0),
                  elevation: 4,
                  child: Container(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
