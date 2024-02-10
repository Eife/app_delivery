import 'package:flutter/material.dart';
import 'package:hmelnaya_lavka_app/components/AdminPanel.dart';
import 'package:hmelnaya_lavka_app/utils/test_bd.dart';

class CatalogListViewComponent extends StatefulWidget {
  const CatalogListViewComponent({super.key});

  @override
  State<CatalogListViewComponent> createState() =>
      _CatalogListViewComponentState();
}

class _CatalogListViewComponentState extends State<CatalogListViewComponent> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: category.length * 2,
        itemBuilder: ((context, index) {
          final itemIndex = index ~/ 2;
          if (index.isOdd) return Divider();
          return ListTile(
            trailing: Icon(Icons.keyboard_arrow_right),
            title: Text(category[itemIndex]),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AdminPanel(
                          // changeItem: category[itemIndex]
                          )));
            },
          );
        }));
  }
}
