import 'package:flutter/material.dart';
import 'package:meal_app/models/Recipe_discription.dart';
import './DesigningBox.dart';
import './Dummy_data.dart';

class ParticularGridBox extends StatefulWidget {
  List<Meal> _availableMeal;
  ParticularGridBox(this._availableMeal);

  @override
  _ParticularGridBoxState createState() => _ParticularGridBoxState();
}

class _ParticularGridBoxState extends State<ParticularGridBox> {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(20),
      children: DUMMY_CATEGORIES.map(
        (catdata) {
          return Designing(catdata.id, catdata.title, catdata.color, widget._availableMeal);
        },
      ).toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
      ),
    );
  }
}
