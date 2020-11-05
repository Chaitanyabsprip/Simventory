import 'package:flutter/material.dart';
import '../providers/building_plans_provider.dart';

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
        margin: oneRow ? const EdgeInsets.symmetric(horizontal: 4) : null,
        width: allowEdit ? radius * 5.1 : radius * 3.5,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              radius: radius,
              child: Image.asset('assets/items/${item.imageName()}.png'),
              backgroundColor: Colors.transparent,
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
                        color: Color(0x09FF0000),
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
