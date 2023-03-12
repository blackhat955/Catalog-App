import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../widget/theme.dart';

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
