import 'package:flutter/material.dart';
import 'package:naatlibrary/resources/StyleResources.dart';
import 'package:naatlibrary/views/pages/HamdPage.dart';
import 'package:naatlibrary/widgets/FirstPageContainer.dart';
import 'package:provider/provider.dart';

import '../../provider/DarkThemeProvider.dart';

class FirstPage extends StatefulWidget {
  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context, listen: true);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: (themeChange.isdark)
              ? StyleResources.AppBackgroundDark
              : StyleResources.AppBackgorundLight,
          child: Column(
            children: [
              SizedBox(height: 30),
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(children: [
                  FirstPageContainer(
                    myimg: "img/kaabasharif1.png",
                    myimgbg: "img/kaabasharif1.png",
                    onclick: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context)=>HamdPage())
                      );
                    },
                    btntext: "Hamd",
                    text: "Hamd",
                  ),
                  SizedBox(height: 50),
                  FirstPageContainer(
                    myimg: "img/madinasharif2.png",
                    myimgbg: "img/madinasharif2.png",
                    onclick: () {},
                    btntext: "Naat",
                    text: "Naats",
                  ),
                  SizedBox(height: 50),
                  FirstPageContainer(
                    myimg: "img/moulaali.png",
                    myimgbg: "img/moulaali.png",
                    onclick: () {},
                    btntext: "Moula Ali",
                    text: "Moula Ali",
                  ),
                  SizedBox(height: 50),
                  FirstPageContainer(
                    myimg: "img/gauseaazam.png",
                    myimgbg: "img/gauseaazam.png",
                    onclick: () {},
                    btntext: "Gaus Paak",
                    text: "aazam",
                  ),
                  SizedBox(height: 50),
                  FirstPageContainer(
                    myimg: "img/gareebnawaz1.png",
                    myimgbg: "img/gareebnawaz1.png",
                    onclick: () {},
                    btntext: "Khwaja",
                    text: "nawaz",
                  ),
                  SizedBox(height: 50),
                  FirstPageContainer(
                    myimg: "img/AalaHazrat.png",
                    myimgbg: "img/AalaHazrat.png",
                    onclick: () {},
                    btntext: "aalahazrat",
                    text: "Aalahazrat",
                  ),
                ]
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
