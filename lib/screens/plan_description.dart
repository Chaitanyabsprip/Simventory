import 'package:flutter/material.dart';
import '../widgets/app_bar.dart';
import '../providers/building_plans_provider.dart';
import '../widgets/added_items.dart';

class PlanDescription extends StatelessWidget {
  PlanDescription(this.plan);
  final BuildingPlan plan;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(plan.name),
        flexibleSpace: GradientAppBar(),
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
              Color(0xFFFFFFFF),
              Color(0x73C4F4FF),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
              width: MediaQuery.of(context).size.width,
              child: Text("Added Items:",
                  style: Theme.of(context).textTheme.headline6,
                  textAlign: TextAlign.start),
            ),
            Hero(
              tag: plan.name,
              transitionOnUserGestures: true,
              child: Container(
                height: (plan.ingredients.entries.length > 6
                    ? 130
                    : 52.0 * (plan.ingredients.length / 3).ceil()),
                margin: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 4,
                  color: Color.fromRGBO(250, 250, 250, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(0),
                    scrollDirection: Axis.vertical,
                    child: AddedItems(
                      plan: plan,
                      allowEdit: false,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
