import 'package:flutter/material.dart';
import 'package:restaurant_app/models/MealModel.dart';
import 'package:restaurant_app/widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<MealModel> favoriteMeal;

  FavoritesScreen(this.favoriteMeal);

  @override
  Widget build(BuildContext context) {
    print(favoriteMeal.length);
    if (favoriteMeal.isEmpty) {
      return Center(
        child: Text('You have no favorites yet!! Start adding Some'),
      );
    } else {
      return Center(
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              affordability: favoriteMeal[index].affordability,
              complexity: favoriteMeal[index].complexity,
              duration: favoriteMeal[index].duration,
              imageUrl: favoriteMeal[index].imageUrl,
              titile: favoriteMeal[index].title,
              id: favoriteMeal[index].id,
              // removeItem: null,
            );
            // return Text(
            //   categorymeal[index].title,
            //   textAlign: TextAlign.center,
            //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            // );
          },
          itemCount: favoriteMeal.length,
        ),
      );
    }
  }
}
