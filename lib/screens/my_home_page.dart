import "package:flutter/material.dart";
import "package:my_catelog_app/models/catelog.dart";
import "package:my_catelog_app/widgets/drawer.dart";
import "package:my_catelog_app/widgets/themes.dart";

import "../widgets/item_widget.dart";

class MyHomePage extends StatelessWidget {

  final dummyList = List.generate(20, (index) => CatelogModels.items[0]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Catelog App",
          style: MyTheme.lightTheme(context).textTheme.bodyText1,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
            itemCount: dummyList.length,
            itemBuilder: (context, index) {
              return ItemWidget(item: dummyList[index]);
            }),
      ),
      drawer: MyDrawer(),
    );
  }
}
