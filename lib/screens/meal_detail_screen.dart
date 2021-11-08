import 'package:flutter/material.dart';

import 'package:restaurant_app/models/dummy_data.dart';

class MealdetailScreen extends StatelessWidget {
  static const routeName = '/meal-detailScreen';

  final Function toogleFavorite;
  final Function _isFavorite;

  MealdetailScreen(this.toogleFavorite, this._isFavorite);

  @override
  Widget build(BuildContext context) {
    final mealId =
        ModalRoute.of(context)!.settings.arguments as String; // it finds mealid
    final getmealitem = DUMMY_MEALS.firstWhere((meal) =>
        meal.id ==
        mealId); // compare meal id get the all info of particular item

// it is a dynamic widgets to avoid code duplication
    Widget buildSectionTitle(BuildContext context, String textTitle) {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Text(
          textTitle,
          style: Theme.of(context).textTheme.title,
        ),
      );
    }

    Widget buildContainer(Widget containerchild) {
      return Container(
        height: 180,
        width: 400,
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.blueGrey,
              blurRadius: 4,
              spreadRadius: 1,
            )
          ],
        ),
        child: containerchild,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('${getmealitem.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                getmealitem.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, 'Ingredients'),
            // build container method is called and Listview.builder is passed as arugment down here
            buildContainer(
              ListView.builder(
                  itemBuilder: (ctx, index) => Card(
                        color: Theme.of(context).accentColor,
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          child: Text(
                            getmealitem.ingredients[index],
                            style: Theme.of(ctx).textTheme.subtitle1,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                  itemCount: getmealitem.ingredients.length),
            ),
            buildSectionTitle(context, 'Steps'),
            buildContainer(ListView.builder(
              itemBuilder: (ctx, index) => Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      child: Text('${index + 1}.'),
                    ),
                    title: Text(
                      getmealitem.steps[index],
                      style: Theme.of(ctx).textTheme.headline6,
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Divider(),
                ],
              ),
              itemCount: getmealitem.steps.length,
            )),
            // Row(
            //   children: <Widget>[
            //     FloatingActionButton(
            //       child: Icon(
            //         _isFavorite(mealId) ? Icons.star : Icons.star_border,
            //       ),
            //       onPressed: () => toogleFavorite(mealId),
            //     ),
            //   ],
            // )
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.delete),
      //   onPressed: () {
      //     // on POp we can pass many types of data dynamic data
      //     Navigator.of(context).pop(mealId);
      //   },
      // ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          _isFavorite(mealId) ? Icons.star : Icons.star_border,
        ),
        onPressed: () => toogleFavorite(mealId),
      ),
    );
  }
}
