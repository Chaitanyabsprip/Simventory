import 'package:flutter/material.dart';
import '../providers/building_plans_provider.dart';

class AddedItems extends StatelessWidget {
  final BuildingPlan plan;
  final bool allowEdit;

  AddedItems({@required this.plan, @required this.allowEdit});

  @override
  Widget build(BuildContext context) {
    List items = List<Widget>.generate(
      plan.ingredients.length,
      (index) => Container(
        width: 110,
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
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
          runSpacing: 4.0,
          direction: Axis.horizontal,
          children: items),
    );
  }
}
