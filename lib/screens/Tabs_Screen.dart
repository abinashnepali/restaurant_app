import 'package:flutter/material.dart';
import 'package:restaurant_app/models/MealModel.dart';

import 'Categories_Screen.dart';
import 'Favorites_Screen.dart';
import '../widgets/Main_Drawer.dart';

class TabsScreen extends StatefulWidget {
  final List<MealModel> _favoriteMeals;

  TabsScreen(this._favoriteMeals);
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages = [];
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    //super.initState();
    _pages = [
      {'title': 'Categories', 'page': CategoriesScreen()},
      {'title': 'Favorites', 'page': FavoritesScreen(widget._favoriteMeals)},
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          (_pages[_selectedPageIndex]['title']) as String,
        ),
      ),
      drawer: MainDrawer(),
      body: (_pages[_selectedPageIndex]['page']) as Widget,
      bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          //backgroundColor: Theme.of(context).primaryColor,
          // since shifting is used we have to put backgorund on each item as below
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).accentColor,
          currentIndex: _selectedPageIndex,
          type: BottomNavigationBarType.shifting,
          items: [
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.category),
              label: 'Category',
            ),
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,

              icon: Icon(Icons.star),
              //title: Text('Favorites'),
              label: 'Favorites',
            ),
          ]),
    );
  }
}
