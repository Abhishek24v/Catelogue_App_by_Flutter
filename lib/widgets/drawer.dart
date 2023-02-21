import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.deepPurple,
        child: ListView(
          padding: EdgeInsets.zero,
          children:[
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
                accountName: Text("Abhishek"), 
                accountEmail: Text("avish@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage("res/images/peeps_avatar.png"),
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.home,
                color: Colors.white),
                title: Text(
                  "Home",
                style: TextStyle(color: Colors.white),
                textScaleFactor: 1.2),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.profile_circled,
                color: Colors.white),
                title: Text(
                  "Profile",
                style: TextStyle(color: Colors.white),
                textScaleFactor: 1.2),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.mail,
                color: Colors.white),
                title: Text(
                  "Email me",
                style: TextStyle(color: Colors.white),
                textScaleFactor: 1.2),
            ),
          ],
        ),
      ),
    );
  }
}