import 'package:flutter/material.dart';
import 'package:restaurant_app/screens/Filters_Screen.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget buildListTile(
      String titleText, IconData iconData, Function tabHandler) {
    return ListTile(
      leading: Icon(iconData),
      title: Text(
        titleText,
        style: TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 20,
            fontWeight: FontWeight.bold),
      ),
      onTap: tabHandler as VoidCallback,
    );
  }

  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 100,
            width: double.infinity,
            padding: EdgeInsets.all(10),
            color: Theme.of(context).accentColor,
            alignment: Alignment.centerLeft,
            child: Text(
              'Cooking Up',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile('Meals', Icons.restaurant, () {
            // so the pushReplacementNamed remove the prevoius page from the stack no back navigation
            Navigator.of(context).pushReplacementNamed('/');
          }),
          buildListTile('Filters', Icons.settings, () {
            Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
          }),
        ],
      ),
    );
  }
}
