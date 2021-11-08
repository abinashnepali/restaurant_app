import 'package:flutter/material.dart';

import 'Categories_Screen.dart';
import 'Favorites_Screen.dart';

class DefaultTabsScreen extends StatefulWidget {
  @override
  _DefaultTabsScreenState createState() => _DefaultTabsScreenState();
}

class _DefaultTabsScreenState extends State<DefaultTabsScreen> {
  @override
  Widget build(BuildContext context) {
    // it is default tab  contoller given by flutter framework
    //  DefaultTabController and tab are automatically connceted by flutter
    // it knows which tabs is tabed.
    return DefaultTabController(
        length: 2,
        //  initialIndex: 1, // it start form 0 , used to load tap 1st on screen
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Resturant',
              style: Theme.of(context).textTheme.title,
              textAlign: TextAlign.center,
            ),
            bottom: TabBar(
              //indicatorColor: Colors.white,
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: <Widget>[
                Tab(
                  icon: Icon(Icons.category),
                  text: 'Category',
                ),
                Tab(
                  icon: Icon(Icons.star),
                  text: 'Favorites',
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              CategoriesScreen(),
              //FavoritesScreen(),
            ],
          ),
        ));
  }
}
