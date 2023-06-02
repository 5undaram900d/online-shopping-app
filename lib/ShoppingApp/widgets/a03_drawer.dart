
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

String? drawerName = '';
String? drawerEmail = '';


class MyDrawer extends StatelessWidget {

  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Drawer(
      child: Container(
        color: Colors.blue,
        child: ListView(
          children: [
            DrawerHeader(
              // for doing 0 padding
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                // for doing 0 margin
                margin: EdgeInsets.zero,
                currentAccountPicture: const SizedBox(
                  width: 80,
                  height: 80,
                  child: Center(child: Icon(CupertinoIcons.profile_circled, size: 100,),),
                ),
                accountName: Center(child: Text(drawerName.toString(), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20,),),),
                accountEmail: Center(child: Text(drawerEmail.toString(),),),
              ),
            ),
            const ListTile(
              leading: Icon(CupertinoIcons.house, color: Colors.white,),
              title: Text('Home', textScaleFactor: 1.2, style: TextStyle(color: Colors.white,fontSize: 20),),
            ),
            const ListTile(
              leading: Icon(CupertinoIcons.profile_circled, color: Colors.white,),
              title: Text('Profile', textScaleFactor: 1.2, style: TextStyle(color: Colors.white,fontSize: 20),),
            ),
            const ListTile(
              leading: Icon(CupertinoIcons.mail, color: Colors.white,),
              title: Text('Email me', textScaleFactor: 1.2, style: TextStyle(color: Colors.white,fontSize: 20),),
            )
          ],
        ),
      ),
    );
  }
}
