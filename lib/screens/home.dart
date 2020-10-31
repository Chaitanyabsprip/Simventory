import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// ignore: unused_import
import 'package:simventory/providers/expansion_panel_state_provider.dart';
import '../providers/building_plans_provider.dart';
import '../widgets/added_items.dart';
import '../screens/new_building_plan.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //providers

    final buildingPlansProvider = Provider.of<BuildingPlanBook>(context);
    final bool planExists = buildingPlansProvider.book.length != 0;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Simventory'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () async {
              final BuildingPlan plan = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChangeNotifierProvider(
                    create: (context) => BuildingPlan(),
                    child: NewBuildingPlan(),
                  ),
                ),
              );
              if (plan != null) {
                print(plan);
                buildingPlansProvider.addPlan(plan);
              }
            }, //TODO: Add a description Page to show the details of an existing plan.
          ),
        ],
      ),
      //TODO: Add a text field to show the Building Plan name on top of the card.
      body: !planExists
          ? DefaulWidget(buildingPlansProvider: buildingPlansProvider)
          : PlansBook(buildingPlansProvider: buildingPlansProvider),
    );
  }
}

class DefaulWidget extends StatelessWidget {
  final buildingPlansProvider;

  DefaulWidget({Key key, @required this.buildingPlansProvider});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text("No Building Plans added yet"),
            RaisedButton(
              child: const Text("Add"),
              onPressed: () async {
                final BuildingPlan plan = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChangeNotifierProvider(
                      create: (context) => BuildingPlan(),
                      child: NewBuildingPlan(),
                    ),
                  ),
                );
                if (plan != null) {
                  print(plan);
                  buildingPlansProvider.addPlan(plan);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class PlansBook extends StatelessWidget {
  final buildingPlansProvider;

  const PlansBook({Key key, @required this.buildingPlansProvider})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: buildingPlansProvider.book.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)),
            margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: AddedItems(
                plan: buildingPlansProvider.book.values.toList()[index],
                allowEdit: false,
              ),
            ),
          ),
        );
      },
    );
  }
}

//* Expansion Panel List

class Book extends StatelessWidget {
  Book({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: ExpansionPanelList(
          animationDuration: Duration(milliseconds: 800),
          expansionCallback: (int index, bool isExpanded) => {},
          children: List.generate(
              0, (index) => ExpansionPanel(headerBuilder: null, body: null)),
        ),
      ),
    );
  }
}
