import 'package:flutter/material.dart';
import 'package:flutter_learning_1/models/catalog.dart';
import 'package:flutter_learning_1/widget/drawer.dart';
import 'package:flutter_learning_1/widget/item_widget.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dummylist = List.generate(
        100,
        (index) => CatalogModel
            .items[0]); // this way you can generate a list of item for List
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text('Catalog App'),
      ),
      body: ListView.builder(
        // building list view and only render this which is present on screen
        // itemCount: CatalogModel.items.length,
        itemCount: dummylist.length,
        itemBuilder: (context, index) {
          return ItemWidget(
            // item: CatalogModel.items[index],
            item: dummylist[index],
          );
        },
      ),
      drawer: MyDrawer(),
    );
  }
}
