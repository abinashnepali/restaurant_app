import 'package:flutter/material.dart';
import 'package:restaurant_app/models/dummy_data.dart';

import 'models/MealFilter.dart';
import 'models/MealModel.dart';
import 'screens/Category_Meals_Screen.dart';
import 'screens/Categories_Screen.dart';
import 'screens/Filters_Screen.dart';
import 'screens/Tabs_Screen.dart';
import 'screens/meal_detail_screen.dart';

void main() => runApp(MyRestaurant());

class MyRestaurant extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyRestaurantState createState() => _MyRestaurantState();
}

class _MyRestaurantState extends State<MyRestaurant> {
  MealFilter _filters = new MealFilter();

  List<MealModel> _availableMeals = DUMMY_MEALS;

// this list is for favoriteMeal items
  List<MealModel> _favoriteMeals = [];

// it is the flilter of meal choosen by the users
  _setFilters(MealFilter filterData) {
    setState(() {
      // _filters.isgluten = filterData.isgluten;
      // _filters.islactose = filterData.islactose;
      // _filters.isvegan = filterData.isvegan;
      // _filters.isvegetarain = filterData.isvegetarain;
      _filters = filterData;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters.isgluten && !meal.isGlutenFree) {
          return false;
        }
        if (_filters.islactose && !meal.isLactoseFree) {
          return false;
        }
        if (_filters.isvegan && !meal.isVegan) {
          return false;
        }
        if (_filters.isvegetarain && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

// it toogle favorite and unfavorite
  _toogleFavorite(String mealId) {
    final int existingIndex =
        _favoriteMeals.indexWhere((meal) => meal.id == mealId);
    print(existingIndex);
    if (existingIndex >= 0) {
      setState(() {
        //  var a = _favoriteMeals.length;

        _favoriteMeals.removeAt(existingIndex);
      });
    }
    setState(() {
      _favoriteMeals.add(
        DUMMY_MEALS.firstWhere((meal) => meal.id == mealId),
      );
      print(_favoriteMeals.length);
    });
  }

// it return list of favorireMeals
  bool _isMealFavorite(String mealID) {
    var _favoriteMealsLits = _favoriteMeals.any((meal) => meal.id == mealID);
    print(_favoriteMealsLits);
    return _favoriteMealsLits;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        accentColor: Colors.orangeAccent,
        canvasColor: Color.fromRGBO(245, 255, 250,
            1), //(218, 222, 196, 1),//245,255,250 //rgb(218,222,196)
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              body2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              title: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'RobotoCondensed',
              ),
            ),
      ),
      // home: CategoriesScreen(),
      initialRoute: '/', //defeault is
      routes: {
        // it is default route insite of using home
        '/': (ctx) => TabsScreen(_favoriteMeals),

        //'/Category_Meals_Screen': (ctx) => CategoryMealsScreen(),
        CategoryMealsScreen.routeName: (ctx) =>
            CategoryMealsScreen(_availableMeals),
        MealdetailScreen.routeName: (ctx) =>
            MealdetailScreen(_toogleFavorite, _isMealFavorite),
        FiltersScreen.routeName: (ctx) => FiltersScreen(_filters, _setFilters),
      },
      // onGenerateRoute is used when the route is dyanamic
      //
      /*
      onGenerateRoute: (settings) {
        print(settings.arguments);
        if (settings.name == '/meal-detail') {
          return ...;
        }
        else if (settings.name == '/CategoryMealsScreen'){
          return '';
        }

        return MaterialPageRoute(builder: (ctx) => CategoryMealsScreen());
      },
     */
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
    );
  }
}
