import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simventory/providers/building_plans_provider.dart';

class PlanDescription extends StatelessWidget {
  PlanDescription(this.index);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Provider.of<BuildingPlanBook>(context)
            .book
            .values
            .toList()[index]
            .name),
      ),
    );
  }
}
