import 'package:flutter/material.dart';
import 'package:meal_app/models/Recipe_discription.dart';
import './Main_drawer.dart';

class FilterMeal extends StatefulWidget {
  final Function _showRequiredMeal;
  List<Meal> _availableMeal;
  FilterMeal(this._showRequiredMeal,this._availableMeal);
  @override
  _FilterMealState createState() => _FilterMealState();
}

class _FilterMealState extends State<FilterMeal> {
  bool _glutenfree = false;
  bool _lactosefree = false;
  bool _vegan = false;
  bool _vegeterian = false;

  Widget selectingFilter(
      String category, String discription, bool filtervalue, Function handler) {
    return SwitchListTile(
      title: Text(
        category,
        style: TextStyle(
          fontSize: 22,
        ),
      ),
      value: filtervalue,
      subtitle: Text(discription),
      onChanged: handler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("hello"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final selectedOption = {
                  'gluten': _glutenfree,
                  'lactose': _lactosefree,
                  'vegan': _vegan,
                  'vegeterian': _vegeterian,
                };
                widget._showRequiredMeal(selectedOption);
              }
              ),
        ],
      ),
      drawer: OurDrawer(
        widget._showRequiredMeal,
        widget._availableMeal,
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding:
                const EdgeInsets.only(top: 14, bottom: 14, left: 14, right: 10),
            child: Text(
              "Adjust Your Meal Selection",
              style: TextStyle(
                fontSize: 28,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.w900,
                color: Colors.black54,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                selectingFilter(
                    "Gluten-Free", "Only inlude Gluten free meal", _glutenfree,
                    (value) {
                  setState(() {
                    _glutenfree = value;
                  });
                }),
                selectingFilter("Lactose-Free", "Only inlude Lactose free meal",
                    _lactosefree, (value) {
                  setState(() {
                    _lactosefree = value;
                  });
                }),
                selectingFilter("Vegan", "Only inlude Vegan meal", _vegan,
                    (value) {
                  setState(() {
                    _vegan = value;
                  });
                }),
                selectingFilter(
                    "Vegeterian", "Only inlude Vegeterian meal", _vegeterian,
                    (value) {
                  setState(() {
                    _vegeterian = value;
                  });
                }), //   selectingFilter("Gluten-Free","Only inlude Gluten free meal",_glutenfree),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
