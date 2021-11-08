import 'package:flutter/material.dart';

import '../screens/Category_Meals_Screen.dart';

class Categoryitem extends StatelessWidget {
  final String title;
  final Color color;
  final String id;

  Categoryitem(this.title, this.color, this.id);

  void selectCatagory(BuildContext ctx) {
    // before route
    // Navigator.of(ctx).push(MaterialPageRoute(
    //   builder: (_) {
    //     return CategoryMealsScreen(id, title);
    //   },
    //     )
    //  );
    /// before rotue ended

    Navigator.of(ctx).pushNamed(
      CategoryMealsScreen.routeName, // '/Category_Meals_Screen',
      arguments: {
        'id': id,
        'title': title,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCatagory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [color.withOpacity(0.8), color],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(15)),
        child: Text(
          title,
          style: Theme.of(context).textTheme.title,
        ),
      ),
    );
  }
}
