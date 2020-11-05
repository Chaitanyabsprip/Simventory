import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simventory/providers/building_plans_provider.dart';
import '../providers/new_building_plan_state_provider.dart';

class EditName extends StatelessWidget {
  EditName(this.labelText, this.hintText, this.plan);

  final String labelText;
  final BuildingPlan plan;
  final String hintText;
  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller = new TextEditingController();
    final titleEditingState = Provider.of<NewBuildingPlanState>(context);

    return Container(
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
                  copy: true, cut: true, paste: true, selectAll: true),
              decoration: InputDecoration(
                labelText: labelText,
                hintText: hintText,
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
                plan.changeNameTo(newName);
                debugPrint("value: $newName \n name: ${plan.name}");
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
                  plan.changeNameTo(_controller.value.text);
                } else {
                  String newName = "Building Plan #${plan.uid}";
                  plan.changeNameTo(newName);
                }
                titleEditingState.edit();
              },
            ),
          )
        ],
      ),
    );
  }
}
