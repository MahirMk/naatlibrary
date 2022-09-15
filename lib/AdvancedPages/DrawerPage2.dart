import 'package:flutter/material.dart';
import 'package:naatlibrary/views/pages/BottomNavigationPage.dart';
import 'package:provider/provider.dart';

import '../provider/DarkThemeProvider.dart';
import '../resources/StyleResources.dart';

class DrawerPage2 extends StatefulWidget {

  @override
  State<DrawerPage2> createState() => _DrawerPage2State();
}

class _DrawerPage2State extends State<DrawerPage2> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context,listen: true);
    return Container(
      width: 250,
      color:  (themeChange.isdark)?StyleResources.BlackColorlight:StyleResources.whitecolorlight,
      child: ListTileTheme(
        textColor: Colors.white,
        iconColor: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: 128.0,
              height: 128.0,
              margin: EdgeInsets.only(
                top: 24.0,
                bottom: 64.0,
              ),
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: Colors.black26,
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                'img/App Icon.png',
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context)=>BottomNavigationPage())
                );
              },
              leading: Icon(Icons.home,color:  (themeChange.isdark)?StyleResources.whitecolor:StyleResources.whitecolor),
              title: Text('Home',style: TextStyle(color:  (themeChange.isdark)?StyleResources.whitecolor:StyleResources.whitecolor)),
            ),
            ListTile(
              leading: Icon(Icons.dark_mode_outlined,color: (themeChange.isdark)?StyleResources.whitecolor:StyleResources.whitecolor),
              title: Text('Dark/Light',style: TextStyle(color:  (themeChange.isdark)?StyleResources.whitecolor:StyleResources.whitecolor),),
              trailing: Switch(
                activeColor: Colors.green,
                inactiveThumbColor: Color(0xffE2E2E2),
                inactiveTrackColor: Color(0xff707070),
                value: themeChange.isdark,
                onChanged: (val)
                {
                  themeChange.darkTheme = val;
                },
              ),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(Icons.settings,color:  (themeChange.isdark)?StyleResources.whitecolor:StyleResources.whitecolor),
              title: Text('Settings',style: TextStyle(color:  (themeChange.isdark)?StyleResources.whitecolor:StyleResources.whitecolor)),
            ),
            Spacer(),
            DefaultTextStyle(
              style: TextStyle(
                fontSize: 12,
                color: Colors.white54,
              ),
              child: Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 16.0,
                ),
                child: Text('Terms of Service | Privacy Policy',style: TextStyle(color:  (themeChange.isdark)?StyleResources.whitecolor:StyleResources.whitecolor)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
