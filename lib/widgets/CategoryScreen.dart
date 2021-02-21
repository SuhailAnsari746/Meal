import 'package:flutter/material.dart';
import '../models/Recipe_discription.dart';
import './Meal_Selection.dart';

class CategoryScreen extends StatefulWidget {
  final String id;
  final String title;
  List<Meal> _availableMeal;
  CategoryScreen(this.id, this.title,this._availableMeal);
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  List<Meal> _displayedMeals;
  void initState() {
    _displayedMeals = widget._availableMeal.where((element) {
      return element.categories.contains(widget.id);
    }).toList();
    super.initState();
  }

  void rem(String id) {
    setState(() {
      _displayedMeals.removeWhere((element) {
        return id == element.id;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealSelection(
            id: _displayedMeals[index].id,
            title: _displayedMeals[index].title,
            image: _displayedMeals[index].imageUrl,
            duration: _displayedMeals[index].duration,
            affordability: _displayedMeals[index].affordability,
            complexity: _displayedMeals[index].complexity,
            remove: rem,
          );
        },
        itemCount: _displayedMeals.length,
      ),
    );
  }
}
