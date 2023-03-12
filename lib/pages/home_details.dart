import 'package:flutter/material.dart';
import 'package:flutter_learning_1/widget/theme.dart';
import 'package:velocity_x/velocity_x.dart';

import '../models/catalog.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailPage({Key? key, required this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // to add back button
      appBar: AppBar(),
      backgroundColor: Mytheme.creamColor,
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalog.price}".text.red800.xl4.make(),
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
            ).wh(100, 50)
          ],
        ).p32(),
      ),
      body: SafeArea(
        bottom: false, // this make safearea for bottom false
        child: Column(
          // Here we use Hero widget for the animation and you must both the respective widget
          // in hero widget to get the work done {like to hero work here I wrap both Image Here and ListItem.dart the Catalog on line 8 to get work done
          children: [
            Hero(
              tag: Key(catalog.id.toString()),
              child: Image.network(catalog.image),
            ).h32(context),
            Expanded(
              child: VxArc(
                height: 30.0,
                arcType: VxArcType.CONVEY,
                edge: VxEdge.TOP,
                child: Container(
                  color: Colors.white,
                  width:
                      context.screenWidth, // this allow you to take full length
                  child: Column(
                    children: [
                      catalog.name.text.xl4
                          .color(Mytheme.darkbluishColor)
                          .bold
                          .make(),
                      catalog.desc.text
                          .textStyle(context.captionStyle)
                          .xl
                          .make(),
                      10.heightBox,
                    ],
                  ).py64(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
