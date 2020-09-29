import 'package:flutter/material.dart';
import 'coda/items.dart';
import 'addupgrade.dart';

void main() {
  runApp(MaterialApp(title: 'Simventory', home: Simventory()));
}

class Simventory extends StatelessWidget {
  final Data data = new Data();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Simventory'),
        ),
      ),
      body: BuildList(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddUpgrade()),
          );
        },
        tooltip: 'Add new building upgrade',
        icon: Icon(Icons.add),
        label: Text('New Upgrade'),
      ),
    );
  }
}

class BuildList extends StatefulWidget {
  BuildList({Key key}) : super(key: key);

  @override
  _BuildListState createState() => _BuildListState();
}

class _BuildListState extends State<BuildList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Upgrades(),
    );
  }
}

class Upgrades extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: dead_code
    if (false) {
      return ListView.builder(
        itemCount: 0,
        itemBuilder: (context, index) {
          return Card(
            child: Container(
              padding: EdgeInsets.all(1.0),
              height: 70,
              width: MediaQuery.of(context).size.width,
              color: Colors.white12,
              child: Center(
                child: Text(''),
              ),
              // child: Row(
              //   children: [
              //     ListView.builder(
              //       itemCount: 1,
              //       itemBuilder: (context, index) {
              //         return Text(ongoingUpgradesList.ongoingUpgrades[index]);
              //       },
              //     ),
              //   ],
              // ),
            ),
          );
        },
      );
    } else {
      return Container(
        height: 100,
        padding: EdgeInsets.all(15),
        child: Center(
          child: Text(
            'No current upgrade going on in your city. Have a nice day Mayor!',
            style: TextStyle(fontSize: 20),
          ),
        ),
      );
    }
  }
}
