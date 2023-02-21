import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_catelog_app/screens/login_page.dart';
import 'package:my_catelog_app/screens/my_home_page.dart';
import 'package:my_catelog_app/utils/routes.dart';
import 'package:my_catelog_app/widgets/themes.dart';

void main() {
  runApp(MyApp());
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
        MyRoutes.loginRoute:(context) => LoginPage()
      },
    );
  }
}
