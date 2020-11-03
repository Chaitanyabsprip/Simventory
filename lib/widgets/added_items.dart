import 'package:flutter/material.dart';
import '../providers/building_plans_provider.dart';

/* class ItemList extends StatelessWidget {
  final BuildingPlan plan;
  final bool allowEdit;

  ItemList({@required this.plan, @required this.allowEdit});

  @override
  Widget build(BuildContext context) {
    List items = List<Widget>.generate(
      plan.ingredients.length,
      (index) => Container(
        width: 110,
        // padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              flex: 1,
              child: CircleAvatar(
                child: Image.asset(
                    "assets/items/${plan.ingredients.keys.toList()[index]}.png"),
                backgroundColor: Theme.of(context).bottomAppBarColor,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                plan.ingredients.values.toList()[index].count.toString(),
                style: TextStyle(fontSize: 18),
              ),
            ),
            allowEdit
                ? Container(
                    width: 28.0,
                    height: 28.0,
                    alignment: Alignment(0, 0),
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: Colors.red[50],
                    ),
                    child: IconButton(
                      padding: EdgeInsets.all(0),
                      icon: Icon(
                        Icons.clear,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        plan.ingredients.values.toList()[index].count = 0;
                        plan.removeItem(plan.ingredients.keys.toList()[index]);
                      },
                    ),
                  )
                : Text(""),
          ],
        ),
      ),
    );
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      height: 48.0 * ((items.length / 3).ceil()),
      child: Wrap(
          alignment: WrapAlignment.start,
          spacing: 8.0,
          direction: Axis.horizontal,
          children: items),
    );
  }
} */

class AddedItems extends StatelessWidget {
  AddedItems({
    @required this.plan,
    this.allowEdit = false,
    this.width,
    this.radius = 18,
    this.oneRow = false,
  });

  final BuildingPlan plan;
  final bool allowEdit;
  final bool oneRow;
  final double width;
  final double radius;
  @override
  Widget build(BuildContext context) {
    final List<Widget> itemsList =
        List.generate(plan.ingredients.length, (index) {
      final item = plan.ingredients.values.toList()[index];
      return Container(
        width: allowEdit ? radius * 5.1 : radius * 3.5,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              radius: radius,
              child: Image.asset('assets/items/${item.name}.png'),
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            ),
            Expanded(
              child: Text(
                '${item.count}',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
            ),
            Expanded(
              child: allowEdit
                  ? Container(
                      width: 28.0,
                      height: 28.0,
                      alignment: Alignment(0, 0),
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.red[50],
                      ),
                      child: IconButton(
                        padding: EdgeInsets.all(0),
                        icon: Icon(
                          Icons.clear,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          plan.ingredients.values.toList()[index].count = 0;
                          plan.removeItem(
                              plan.ingredients.keys.toList()[index]);
                        },
                      ),
                    )
                  : Text(""),
            )
          ],
        ),
      );
    });

    return AnimatedContainer(
      curve: Curves.fastOutSlowIn,
      duration: Duration(milliseconds: 800),
      height: allowEdit
          ? 50.0 * ((itemsList.length / 3).ceil())
          : (oneRow ? 50.0 : 50.0 * ((itemsList.length / 4).ceil())),
      width: 400,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      child: oneRow
          ? ListView(
              children: itemsList,
              scrollDirection: Axis.horizontal,
            )
          : Wrap(
              alignment: WrapAlignment.start,
              runSpacing: 12.0,
              spacing: allowEdit ? 40.0 : 12.0,
              direction: Axis.horizontal,
              children: itemsList,
            ),
    );
  }
}
