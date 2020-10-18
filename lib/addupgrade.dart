import 'package:flutter/material.dart';
import 'coda/items.dart';

class AddUpgrade extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Add a new building upgrade'),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 0,
          ),
          Container(
            height: 120,
            padding:
                EdgeInsets.fromLTRB(8.0, 0, 16.0, 0), //TODO add stateful child
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 0, 8.0),
            child: Divider(
              height: 5.0,
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 32.0),
            height: 550.0,
            child: ListView.builder(
              itemCount: Data.items.getList().length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(0, 8.0, 0, 8.0),
                  child: Card(
                    elevation: 3,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10.0),
                          height: 80,
                          width: 80,
                          color: Colors.black45,
                        ),
                        Container(
                          width: 80,
                          margin: EdgeInsets.fromLTRB(2.0, 0.0, 2.0, 0.0),
                          child: Center(
                            child: Text(
                              Data.items.getList()[index].name,
                              softWrap: true,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(4.0),
                          child: ItemCount(index),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton.extended(
          label: Text('Add'),
          onPressed: () {
            print(Data.upgrade.getAllMaterialList());
            Navigator.pop(context);
            Navigator.pop(context);
            Navigator.pushNamed(context, '/');
            Data.upgrade.addUpgrade();
          },
          icon: Icon(Icons.add),
          tooltip: 'Add new building upgrade',
        ),
      ),
    );
  }
}

class ItemCount extends StatefulWidget {
  final int index;
  ItemCount(this.index);
  @override
  _ItemCountState createState() => _ItemCountState(index);
}

class _ItemCountState extends State<ItemCount> {
  Data data = new Data();
  int index;
  _ItemCountState(this.index);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(0.0, 0.0, 4.0, 0.0),
          width: 50,
          child: Center(
            child: RaisedButton(
              color: Colors.blue,
              child: Icon(Icons.remove),
              onPressed: () {
                Data.upgrade
                    .getAllMaterialList()[Data.upgrade.upgradeCount()]
                    .decrementCount(index);
                // data.upgrade
                //     .removeItem(data.upgrade.materials.getList()[index]);
                setState(() {});
              },
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(4.0, 0.0, 4.0, 0.0),
          color: Colors.black12,
          height: 30,
          width: 60,
          child: Center(
            child: Text(Data.upgrade
                .getAllMaterialList()[0]
                .itemListCount(index)
                .toString()),
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(4.0, 0.0, 4.0, 0.0),
          width: 50,
          child: Center(
            child: RaisedButton(
              color: Colors.blue,
              child: Icon(Icons.add),
              onPressed: () {
                Data.upgrade
                    .getAllMaterialList()[Data.upgrade.upgradeCount()]
                    .incrementCount(index);
                setState(() {});
              },
            ),
          ),
        ),
      ],
    );
  }
}
