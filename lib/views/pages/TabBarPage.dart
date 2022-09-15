import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:naatlibrary/AdvancedPages/DrawerPage2.dart';
import 'package:naatlibrary/resources/StyleResources.dart';
import 'package:naatlibrary/views/pages/Favourite.dart';
import 'package:naatlibrary/views/pages/FirstPage.dart';
import '../../AdvancedPages/SearchPractice.dart';

class TabBarPage extends StatefulWidget {

  @override
  State<TabBarPage> createState() => _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPage> {
  final _advancedDrawerController = AdvancedDrawerController();
  Icon customIcon = Icon(Icons.search);
  Widget customSearchBar = Text("NAAT SHARIF");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SafeArea(
        child: DrawerPage2(),
      ),
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder:
              (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                actions: [
                  IconButton(
                    onPressed: () {
                      showSearch(
                          context: context,
                          delegate: CustomSearchDelegate()
                      );
                    },
                    icon: Icon(Icons.search),
                  )
                ],
                bottom: TabBar(
                  indicatorColor: StyleResources.whitecolor,
                  indicatorWeight: 2,
                  tabs: [
                    Tab(
                      child: Column(
                        children: [
                          Text("Naat Sharif"),
                          Icon(Icons.menu_book, color: Colors.white,),
                        ],
                      ),
                    ),
                    Tab(
                      child: Column(
                        children: [
                          Text("Favourite"),
                          Icon(Icons.favorite_border_rounded,color: Colors.red),
                        ],
                      ),
                    ),
                  ],
                ),
                expandedHeight: 220,
                backgroundColor: StyleResources.tealcolor,
                title: customSearchBar,
                automaticallyImplyLeading: true,
                snap: false,
                pinned: true,
                floating: false,
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                    color: Colors.black,
                    child: Opacity(
                      opacity: 0.8,
                      child: ImageSlideshow(
                        indicatorBackgroundColor: StyleResources.whitecolor,
                        indicatorColor: StyleResources.tealcoloraccent,
                        onPageChanged: (value) {
                          debugPrint('Page changed: $value');
                        },
                        autoPlayInterval: 5000,
                        isLoop: true,
                        children: [
                          Image.asset(
                            'img/Board2.jpg',
                            fit: BoxFit.cover,
                          ),
                          Image.asset(
                            'img/Mk1.png',
                            fit: BoxFit.fitHeight,
                          ),
                          Image.asset(
                            'img/Mk2.png',
                            fit: BoxFit.fitHeight,
                          ),
                          // Image.asset(
                          //   'img/moulaali.png',
                          //   fit: BoxFit.cover,
                          // ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              FirstPage(),
              Favourite(),
            ],
          ),
        ),
      ),
    );
  }

  void _handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    // _advancedDrawerController.value = AdvancedDrawerValue.visible();
    _advancedDrawerController.showDrawer();
  }
}
