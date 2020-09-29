import 'package:flutter/material.dart';
import 'coda/items.dart';

class AddUpgrade extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Materials materials = new Materials();
    print(materials.itemList[4].count.toString());
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
            height: 150,
            child: GridView.count(
              crossAxisCount: 2,
              scrollDirection: Axis.horizontal,
              children: List.generate(100, (index) {
                return Center(
                  child: Text('Item $index'),
                );
              }),
            ),
          ),
          Divider(
            height: 5.0,
          ),
          Container(
            padding: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 32.0),
            height: 450.0,
            child: ListView.builder(
              itemCount: materials.itemList.length,
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
                                materials.itemList[index].name,
                                softWrap: true,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(4.0),
                            child: Row(
                              children: [
                                Container(
                                  margin:
                                      EdgeInsets.fromLTRB(0.0, 0.0, 4.0, 0.0),
                                  width: 50,
                                  child: Center(
                                    child: RaisedButton(
                                      color: Colors.blue,
                                      child: Icon(Icons.remove),
                                      onPressed: () => materials.itemList[index]
                                          .decrementCount(),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin:
                                      EdgeInsets.fromLTRB(4.0, 0.0, 4.0, 0.0),
                                  color: Colors.black12,
                                  height: 30,
                                  width: 60,
                                  child: Center(
                                    child: Text(materials.itemList[index].count
                                        .toString()),
                                  ),
                                ),
                                Container(
                                  margin:
                                      EdgeInsets.fromLTRB(4.0, 0.0, 4.0, 0.0),
                                  width: 50,
                                  child: Center(
                                    child: RaisedButton(
                                      color: Colors.blue,
                                      child: Icon(Icons.add),
                                      onPressed: () => materials.itemList[index]
                                          .incrementCount(),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      )),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
