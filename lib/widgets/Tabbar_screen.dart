import 'package:flutter/material.dart';
import 'package:meal_app/models/Recipe_discription.dart';
import 'package:meal_app/widgets/Favourite.dart';
import 'package:meal_app/widgets/Main_drawer.dart';
import 'package:meal_app/widgets/ParticularGridBox.dart';

class TabBars extends StatefulWidget {
  Function _showAvailableMeal;
  List<Meal> _availableMeal;
  TabBars(this._showAvailableMeal, this._availableMeal);
  _TabBarsState createState() => _TabBarsState();
}

class _TabBarsState extends State<TabBars> {
  List<Map<String, Object>> pageSelected;
  int _selectedIndex = 0;
  void selectedOption(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void initState() {
    pageSelected = [
      {
        "title": Text("Category"),
        "page": ParticularGridBox(widget._availableMeal)
      },
      {"title": Text("Your Favourite"), "page": Favourite()}
    ];
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: pageSelected[_selectedIndex]["title"],
      ),
      drawer: OurDrawer(widget._showAvailableMeal, widget._availableMeal),
      body: pageSelected[_selectedIndex]["page"],
      bottomNavigationBar: BottomNavigationBar(
          onTap: selectedOption,
          backgroundColor: Theme.of(context).primaryColor,
          selectedItemColor: Theme.of(context).accentColor,
          unselectedItemColor: Colors.white,
          currentIndex: _selectedIndex,
          selectedFontSize: 15,
          unselectedFontSize: 15,
          iconSize: 26,
          type: BottomNavigationBarType.shifting,
          items: [
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.category),
              title: Text("Category"),
            ),
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.favorite),
              title: Text("Fovourite"),
            )
          ]),
    );
  }
}
