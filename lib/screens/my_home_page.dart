import "dart:convert";

import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:my_catelog_app/models/catelog.dart";
import "package:my_catelog_app/widgets/drawer.dart";
import "package:my_catelog_app/widgets/themes.dart";

import "../widgets/item_widget.dart";

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final catelogJson = await rootBundle.loadString("res/files/catelog.json");
    final decodeData = jsonDecode(catelogJson);
    var productData = decodeData["products"];
    CatelogModels.items =
        List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

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
        child: (CatelogModels.items != null && CatelogModels.items!.isNotEmpty)
            ? ListView.builder(
                itemCount: CatelogModels.items!.length,
                itemBuilder: (context, index) =>
                    ItemWidget(item: CatelogModels.items![index]))
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
      drawer: MyDrawer(),
    );
  }
}
