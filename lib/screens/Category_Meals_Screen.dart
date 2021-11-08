import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';
import '../models/MealModel.dart';

class CategoryMealsScreen extends StatefulWidget {
  // final String CategoryTitle;
  // final String id;
  // const CategoryMealsScreen(this.id, this.CategoryTitle);

  static const routeName = '/Category_Meals_Screen';

  final List<MealModel> availableMeals;

  CategoryMealsScreen(this.availableMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String? CategoryTitle;
  List<MealModel> displayMeals = [];

  var _loadedInitData = false;

  void initiState() {}

  void didChangeDependencies() {
    // it is false
    if (!_loadedInitData) {
      final routeArgs =
          ModalRoute.of(context)!.settings.arguments as Map<String, String>;
      CategoryTitle = routeArgs['title'];
      final categoryId = routeArgs['id'];
      displayMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _loadedInitData = true;
    }

    super.didChangeDependencies();
  }

  // void _removeMeal(String mealID) {
  //   setState(() {
  //     displayMeals.removeWhere((meal) => meal.id == mealID);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    // it gets the information about the routes that was loaded to display this widgets.

    return Scaffold(
      appBar: AppBar(
        title: Text(CategoryTitle as String),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            affordability: displayMeals[index].affordability,
            complexity: displayMeals[index].complexity,
            duration: displayMeals[index].duration,
            imageUrl: displayMeals[index].imageUrl,
            titile: displayMeals[index].title,
            id: displayMeals[index].id,
            //removeItem: _removeMeal,
          );
          // return Text(
          //   categorymeal[index].title,
          //   textAlign: TextAlign.center,
          //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          // );
        },
        itemCount: displayMeals.length,
      ),
    );
  }
}
