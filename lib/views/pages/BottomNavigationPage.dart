import 'package:flutter/material.dart';
import 'package:naatlibrary/resources/StyleResources.dart';
import 'package:naatlibrary/views/other/HomePage.dart';
import 'package:provider/provider.dart';

import '../../provider/DarkThemeProvider.dart';
import 'TabBarPage.dart';

class BottomNavigationPage extends StatefulWidget {

  @override
  State<BottomNavigationPage> createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {

  int pageIndex = 0;

  final pages = [
    TabBarPage(),
    HomePage(),
    HomePage(),
    HomePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: StyleResources.tealcolor,
        onPressed: (){
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context)=>TabBarPage())
          );
        },
        child: Text("OKK"),
      ),
      body: pages[pageIndex],
      bottomNavigationBar: buildMyNavBar(context),
    );
  }

  Container buildMyNavBar(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context,listen: true);
    return Container(
      height: 60,
      color:  (themeChange.isdark)?StyleResources.AppBackgroundDark:StyleResources.whitecolor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 1;
              });
            },
            icon: pageIndex == 1
                ? Icon(
              Icons.info,
              color:  (themeChange.isdark)?StyleResources.tealcoloraccent:StyleResources.tealcolor,
              size: 35,
            )
                : Icon(
              Icons.info_outlined,
              color:  (themeChange.isdark)?StyleResources.tealcoloraccent:StyleResources.tealcolor,
              size: 35,
            ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 0;
              });
            },
            icon: pageIndex == 0
                ? Icon(
              Icons.home_filled,
              color:  (themeChange.isdark)?StyleResources.tealcoloraccent:StyleResources.tealcolor,
              size: 35,
            )
                : Icon(
              Icons.home_outlined,
              color:  (themeChange.isdark)?StyleResources.tealcoloraccent:StyleResources.tealcolor,
              size: 35,
            ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 2;
              });
            },
            icon: pageIndex == 2
                ? Icon(
              Icons.widgets_rounded,
              color:  (themeChange.isdark)?StyleResources.tealcoloraccent:StyleResources.tealcolor,
              size: 35,
            ) : Icon(
              Icons.widgets_outlined,
              color:  (themeChange.isdark)?StyleResources.tealcoloraccent:StyleResources.tealcolor,
              size: 35,
            ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 3;
              });
            },
            icon: pageIndex == 3
                ? Icon(
              Icons.settings_applications_sharp,
              color:  (themeChange.isdark)?StyleResources.tealcoloraccent:StyleResources.tealcolor,
              size: 35,
            )
                : Icon(
              Icons.settings_applications_outlined,
              color:  (themeChange.isdark)?StyleResources.tealcoloraccent:StyleResources.tealcolor,
              size: 35,
            ),
          ),
        ],
      ),
    );
  }
}
