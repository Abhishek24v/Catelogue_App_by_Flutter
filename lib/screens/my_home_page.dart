import "package:flutter/material.dart";
import "package:my_catelog_app/widgets/drawer.dart";

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Catelog App"),
      ),
      body: Center(
        // ignore: avoid_unnecessary_containers
        child: Container(
          child: const Text("Welcome to Flutter by Abhishek"),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}