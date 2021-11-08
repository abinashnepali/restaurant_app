import 'package:flutter/material.dart';
import 'package:restaurant_app/models/MealFilter.dart';

import '../widgets/Main_Drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/FiltersScreen';
  final Function updateFilters;
  final MealFilter _currentFilters;

  FiltersScreen(this._currentFilters, this.updateFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  MealFilter _selectedFilters = new MealFilter();

  @override
  initState() {
    _selectedFilters.isgluten = widget._currentFilters.isgluten;
    _selectedFilters.isvegetarain = widget._currentFilters.isvegetarain;
    _selectedFilters.isvegan = widget._currentFilters.isvegan;
    _selectedFilters.islactose = widget._currentFilters.islactose;
    //return _selectedFilters;
  }

  Widget buildSwitchListTile(
      {required String titleText,
      required String subtitleText,
      required bool currentValue,
      required Function updateValue}) {
    return SwitchListTile(
        title: Text(titleText),
        value: currentValue,
        subtitle: Text(subtitleText),
        onChanged: updateValue as Function(bool));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              widget.updateFilters(_selectedFilters);
            },
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(15),
            alignment: Alignment.center,
            child: Text(
              'Adjust Your Meal Selection ',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
              child: ListView(
            children: <Widget>[
              // dynamic Widgest
              buildSwitchListTile(
                  titleText: 'Gluten-Free',
                  subtitleText: 'Only include Gluten-Free meal',
                  currentValue: _selectedFilters.isgluten,
                  updateValue: (newValue) {
                    setState(() {
                      _selectedFilters.isgluten = newValue;
                    });
                  }),

              buildSwitchListTile(
                  titleText: 'Vegetarian',
                  subtitleText: 'Only include Vegetarian meal',
                  currentValue: _selectedFilters.isvegetarain,
                  updateValue: (newValue) {
                    setState(() {
                      _selectedFilters.isvegetarain = newValue;
                    });
                  }),

              buildSwitchListTile(
                  titleText: 'Vegan',
                  subtitleText: 'Only include Vegan meal',
                  currentValue: _selectedFilters.isvegan,
                  updateValue: (newValue) {
                    setState(() {
                      _selectedFilters.isvegan = newValue;
                    });
                  }),

              buildSwitchListTile(
                  titleText: 'LactoseFree',
                  subtitleText: 'Only include Lactose-Free meal',
                  currentValue: _selectedFilters.islactose,
                  updateValue: (newValue) {
                    setState(() {
                      _selectedFilters.islactose = newValue;
                    });
                  }),
            ],
          ))
        ],
      ),
    );
  }
}
