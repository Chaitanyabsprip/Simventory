import 'package:flutter/material.dart';

class ChangeCount extends StatelessWidget {
  final bool add;
  final Function function;
  final item;

  ChangeCount(
      {@required this.add, @required this.function, @required this.item});
  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(add ? Icons.add : Icons.remove),
        onPressed: () => add ? function(item) : function(item.name));
  }
}
