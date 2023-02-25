import "dart:convert";

import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:my_catelog_app/core/store.dart";
import "package:my_catelog_app/models/cart.dart";
import "package:my_catelog_app/models/catelog.dart";
import "package:my_catelog_app/utils/routes.dart";
import "package:my_catelog_app/widgets/themes.dart";
import "package:velocity_x/velocity_x.dart";
import "../widgets/home_widgets/catelog_header.dart";
import '../widgets/home_widgets/catelog_list.dart';
import 'package:http/http.dart' as http;

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
    //await Future.delayed(Duration(seconds: 1));
    final catelogJson = await rootBundle.loadString("res/files/catelog.json");
    final decodeData = jsonDecode(catelogJson);
    var productData = decodeData["products"];
    CatelogModels.items =
        List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;

    return Scaffold(
      backgroundColor: context.canvasColor,
      floatingActionButton: VxBuilder(
        mutations: {AddMutation, RemoveMutation},
        builder: (context, _, status) => FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
          backgroundColor: context.theme.buttonColor,
          child: Icon(CupertinoIcons.cart, color: MyTheme.creamColor),
        ).badge(
            color: Colors.yellow[600],
            size: 20,
            count: _cart.items.length,
            textStyle:
                TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
      ),
      body: SafeArea(
          child: Container(
        padding: Vx.m32,
        child: Column(children: [
          CatelogHeader(),
          if (CatelogModels.items != null && CatelogModels.items!.isNotEmpty)
            CatelogList().py16().expand()
          else
            CircularProgressIndicator().centered().expand(),
        ]),
      )),
    );
  }
}
