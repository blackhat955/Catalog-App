import 'package:flutter/material.dart';
// import 'package:flutter_learning_1/pages/home_widget/catalogImg.dart';
import 'package:flutter_learning_1/widget/home_widget/catalogImg.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../models/catalog.dart';
import '../../widget/theme.dart';

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
        Hero(
          tag: Key(
            catalog.id.toString(),
          ),
          child: CatalogImage(
            image: catalog.image,
          ),
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
