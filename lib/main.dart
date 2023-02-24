import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_catelog_app/core/store.dart';
import 'package:my_catelog_app/screens/cart_screen.dart';
import 'package:my_catelog_app/screens/login_page.dart';
import 'package:my_catelog_app/screens/my_home_page.dart';
import 'package:my_catelog_app/utils/routes.dart';
import 'package:my_catelog_app/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

void main() {
  runApp(VxState(
    store: MyStore(),
    child: MyApp()
    ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: MyTheme.lightTheme(context),
      debugShowCheckedModeBanner: false,
      darkTheme: MyTheme.darkTheme(context),
      initialRoute: MyRoutes.homeRoute,
      routes: {
        "/" :(context) => LoginPage(),
        MyRoutes.homeRoute:(context) => MyHomePage(),
        MyRoutes.loginRoute:(context) => LoginPage(),
        MyRoutes.cartRoute:(context) => MyCartPage()
      },
    );
  }
}
