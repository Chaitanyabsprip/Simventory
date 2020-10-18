import 'package:flutter/material.dart';
import 'coda/items.dart';
import 'addupgrade.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Simventory',
      initialRoute: '/',
      routes: {
        '/': (context) => Simventory(),
        '/addupgrade': (context) => AddUpgrade()
      },
    ),
  );
}

class Simventory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Simventory'),
        ),
      ),
      body: Upgrades(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton.extended(
          onPressed: () {
            Data.upgrade.newUpgrade();
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddUpgrade()),
            );
          },
          tooltip: 'Add new building upgrade',
          icon: Icon(Icons.add),
          label: Text('New'),
        ),
      ),
    );
  }
}

class Upgrades extends StatefulWidget {
  @override
  _UpgradesState createState() => _UpgradesState();
}

class _UpgradesState extends State<Upgrades> {
  @override
  Widget build(BuildContext context) {
    // print(Data.upgrade.getAllMaterialList().length > 0);
    // ignore: dead_code
    if (Data.upgrade.getAllMaterialList().length > 0) {
      return ListView.builder(
        itemCount: Data.upgrade.getAllMaterialList().length,
        itemBuilder: (context, i) {
          return Card(
            child: Container(
              padding: EdgeInsets.all(1.0),
              height: 70,
              width: MediaQuery.of(context).size.width,
              color: Colors.white12,
              child: Center(
                child: FlatButton(
                  onPressed: () => () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Page(i)));
                  },
                  child: Text(Data.upgrade
                      .getAllMaterialList()[i]
                      .upgradeSerial
                      .toString()),
                ),
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
      print('executing');
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

class Page extends StatelessWidget {
  final int i;
  Page(this.i);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text('Simventory'),
          ),
        ),
        body: ListView.builder(
          itemBuilder: (context, j) {
            return (Text(Data.upgrade
                .getAllMaterialList()[i]
                .getList()[j]
                .name
                .toString()));
          },
        ));
  }
}
