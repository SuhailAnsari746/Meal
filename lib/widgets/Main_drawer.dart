import 'package:flutter/material.dart';
import 'package:meal_app/models/Recipe_discription.dart';
import 'package:meal_app/widgets/Tabbar_screen.dart';
import './Filtermeal.dart';

class OurDrawer extends StatefulWidget {
  Function _showRequiredMeal;
  List<Meal> _availableMeal;
  OurDrawer(this._showRequiredMeal,this._availableMeal);

  @override
  _OurDrawerState createState() => _OurDrawerState();
}

class _OurDrawerState extends State<OurDrawer> {
  void mealHandler(BuildContext ctx) {
    Navigator.of(ctx).pushReplacement(
      MaterialPageRoute(builder: (_) {
        return TabBars(
          widget._showRequiredMeal,
          widget._availableMeal,
        );
      }),
    );
  }

  void filterHandler(BuildContext ctx) {
    Navigator.of(ctx).pushReplacement(
      MaterialPageRoute(builder: (_) {
        return FilterMeal(widget._showRequiredMeal,widget._availableMeal);
      }),
    );
  }

  Widget drawerItem(String txt, IconData icon, Function _selectHandler) {
    return ListTile(
      leading: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10, left: 10),
        child: Icon(icon, size: 26),
      ),
      title: Text(
        txt,
        style: TextStyle(
          fontFamily: 'Railway',
          fontSize: 28,
          color: Colors.purple,
          fontWeight: FontWeight.w700,
        ),
      ),
      onTap: _selectHandler,
    );
  }

  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 150,
            width: double.infinity,
            color: Theme.of(context).accentColor,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(20),
            child: Text("Cooking Up!!",
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 36,
                )),
          ),
          SizedBox(height: 10),
          drawerItem('Meals', Icons.restaurant, () => mealHandler(context)),
          drawerItem('Settings', Icons.settings, () => filterHandler(context)),
        ],
      ),
    );
  }
}
