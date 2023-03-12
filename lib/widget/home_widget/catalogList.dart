import 'package:flutter/material.dart';
import 'package:flutter_learning_1/pages/home_details.dart';
import 'package:flutter_learning_1/widget/home_widget/catalogItem.dart';

// import 'package:flutter_learning_1/pages/home_widget/catalogItem.dart';

import '../../models/catalog.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true, // give your list to enough space to fit in
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items[index];
        return InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeDetailPage(catalog: catalog),
            ),
          ),
          child: CatalogItem(catalog: catalog),
        );
      },
    );
  }
}
