import 'package:flutter/material.dart';
import 'package:meal_app/models/Recipe_discription.dart';
import 'package:meal_app/widgets/ParticularGridBox.dart';
import './widgets/Tabbar_screen.dart';
import './widgets/Filtermeal.dart';
import './widgets/Dummy_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegeterian': false,
  };

  List<Meal>_availableMeal = DUMMY_MEALS;
  void _showRequiredMeal(Map<String, bool> mp) {
    setState(() {
      _filters = mp;
      _availableMeal = DUMMY_MEALS.where((ele) {
        if (_filters['gluten'] && !ele.isGlutenFree) return false;
        if (_filters['lactose'] && !ele.isLactoseFree) return false;
        if (_filters['vegan'] && !ele.isVegan) return false;
        if (_filters['vegeterian'] && !ele.isVegetarian) return false;
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {

   // FilterMeal(_showRequiredMeal, _availableMeal);

    return MaterialApp(
      title: 'MEAL APP',
      theme: ThemeData(
        primarySwatch: Colors.green,
        accentColor: Colors.amber,
        canvasColor: Colors.green[100],
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(
                  color: Colors.blueGrey, fontWeight: FontWeight.w700),
              body2: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.w700,
              ),
              title: TextStyle(
                fontFamily: 'Raleway',
                fontWeight: FontWeight.w700,
                fontSize: 20,
                //  color:Colors.black,
              ),
            ),
      ),
      home: TabBars(_showRequiredMeal, _availableMeal),
    );
  }
}
