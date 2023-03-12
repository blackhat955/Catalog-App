import 'package:flutter/material.dart';
import 'package:flutter_learning_1/widget/theme.dart';
import 'package:velocity_x/velocity_x.dart';

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
