import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_learning_1/models/catalog.dart';
import 'package:flutter_learning_1/widget/theme.dart';
// import 'package:flutter_learning_1/widget/drawer.dart';
import 'package:velocity_x/velocity_x.dart';

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
    // here you declare a variable which helps you to manipulate things based on it
    final dummylist = List.generate(
        100,
        (index) => CatalogModel
            .items[0]); // this way you can generate a list of item for List
    return Scaffold(
        // resizeToAvoidBottomInset: true,
        backgroundColor: Mytheme.creamColor,
        body: SafeArea(
          child: Container(
            padding: Vx.m32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CatalogHeader(),
                if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                  CatalogList().expand()
                else
                  Center(
                    child: CircularProgressIndicator(),
                  )
              ],
            ),
          ),
        ));
  }
}

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App".text.xl5.bold.color(Mytheme.darkbluishColor).make(),
        "Trading Products".text.xl2.make()
      ],
    );
  }
}

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true, // give your list to enough space to fit in
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items[index];
        return CatalogItem(catalog: catalog);
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({Key? key, required this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        CatalogImage(
          image: catalog.image,
        ),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            catalog.name.text.lg.color(Mytheme.darkbluishColor).bold.make(),
            catalog.desc.text.textStyle(context.captionStyle).make(),
            10.heightBox,
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              buttonPadding: EdgeInsets.zero,
              children: [
                "\$${catalog.price}"
                    .text
                    .color(Mytheme.darkbluishColor)
                    .xl
                    .make(),
                ElevatedButton(
                  // Using Button Style you can change color very easily
                  style: ButtonStyle(
                    backgroundColor:
                        //MaterialStateProperty this helps you set the color despite whether button is pressed oer not
                        MaterialStateProperty.all(Mytheme.darkbluishColor),
                    shape: MaterialStateProperty.all(
                      StadiumBorder(),
                    ),
                  ),
                  onPressed: () {},
                  child: "Buy".text.make(),
                )
              ],
            ).pOnly(right: 8)
          ],
        ))
      ],
    )).white.rounded.square(150).make().py16();
  }
}

class CatalogImage extends StatelessWidget {
  final String image;

  const CatalogImage({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(image)
        .box
        .color(Mytheme.creamColor)
        .p16
        .color(Mytheme.creamColor)
        .make()
        .p16()
        .w40(context);
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
