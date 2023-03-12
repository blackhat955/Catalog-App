import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_learning_1/models/catalog.dart';
import 'package:flutter_learning_1/widget/drawer.dart';

// you can't do your operation in a stateless widget if you want to change the state you have to have a stateful widget
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // this will execute before the build method called so here we call our API data to load in the app
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(
      // this delay is used for waiting the app for the time till data receive.
      Duration(seconds: 2),
    );
    var resultString = await rootBundle.loadString(
        './assets/files/catalog.json'); // this return a string of the json which is further decode by dart converter package va
    var decodedData = jsonDecode(
        resultString); // this convert the string file to the json file// it return in map formate
    var productData = decodedData["products"];
    CatalogModel.items =
        List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // here you declare a varibale which helps you to menupulate things based on it
    final dummylist = List.generate(
        100,
        (index) => CatalogModel
            .items[0]); // this way you can generate a list of item for List
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text('Catalog App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
            ? GridView.builder(
                // Sliver is main thing behind things scrollable
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 16), // number of item in a row
                itemBuilder: (context, index) {
                  final item = CatalogModel.items[index];
                  return Card(
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: GridTile(
                      header: Container(
                        child: Text(
                          item.name,
                          style: TextStyle(color: Colors.white),
                        ),
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.deepPurple,
                        ),
                      ),
                      child: Image.network(item.image),
                      footer: Container(
                        child: Text(
                          item.price.toString(),
                          style: TextStyle(color: Colors.white),
                        ),
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  );
                },
                itemCount: CatalogModel.items.length,
              )
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
      drawer: MyDrawer(),
    );
  }
}

// ListView.builder(
// // building list view and only render this which is present on screen
// // itemCount: CatalogModel.items.length,
// // data load is so fast means list may be null for few minute and if in meantime  if build method called then it throw error
// // to make sure it not happen you have to write conditional check
// itemCount: CatalogModel.items.length,
// itemBuilder: (context, index) {
// return ItemWidget(
// // item: CatalogModel.items[index],
// item: CatalogModel.items[index],
// );
// },
// )

// in grid you each item always arrange one after other in a line but in listview items are being one after other in a stack fashion
