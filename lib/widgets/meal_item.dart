import 'package:flutter/material.dart';

import '../models/MealModel.dart';
import '../screens/meal_detail_screen.dart';

class MealItem extends StatelessWidget {
  final String titile;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final String id;
  //final Function removeItem;

  MealItem({
    required this.titile,
    required this.imageUrl,
    required this.duration,
    required this.complexity,
    required this.id,
    required this.affordability,
    //required this.removeItem
  });

  void selectMeal(BuildContext context) {
    Navigator.of(context)
        .pushNamed(
      MealdetailScreen.routeName,
      arguments: id,
    )
        .then((result) {
      if (result != null) {
        //removeItem(result);
      }
    });
  }

  // it is getter method
  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
        break;

      case Complexity.Hard:
        return 'Hard';
        break;

      case Complexity.Challenging:
        return 'Challenging';
        break;

      default:
        return 'Unknown';
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
        break;

      case Affordability.Luxurious:
        return 'Luxurious';
        break;

      case Affordability.Affordable:
        return 'Affordable';
        break;
      default:
        return 'Unknown';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.network(
                    imageUrl,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 8,
                  child: Container(
                    width: 300,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    color: Colors.black54,
                    child: Text(
                      titile,
                      style: TextStyle(fontSize: 24, color: Colors.white),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Row(children: <Widget>[
                      const Icon(
                        Icons.schedule,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text('$duration min')
                    ]),
                    Row(children: <Widget>[
                      const Icon(
                        Icons.work,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(complexityText)
                    ]),
                    Row(children: <Widget>[
                      const Icon(Icons.attach_money_rounded),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(affordabilityText)
                    ])
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
