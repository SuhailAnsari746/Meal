import 'package:flutter/material.dart';
import 'package:meal_app/models/Recipe_discription.dart';
import 'package:meal_app/widgets/CategoryScreen.dart';

class Designing extends StatefulWidget {
  List<Meal> _availableMeal;

  final String title;
  final Color color;
  final String id;
  Designing(this.id, this.title, this.color,this._availableMeal);

  @override
  _DesigningState createState() => _DesigningState();
}

class _DesigningState extends State<Designing> {
  void addMeal(BuildContext ctx) {
    Navigator.of(ctx).push(
      MaterialPageRoute(
        builder: (_) {
          return CategoryScreen(widget.id, widget.title,widget._availableMeal);
        },
      ),
    );
  }

  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () {
        addMeal(context);
      },
      splashColor: Theme.of(context).primaryColor,
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Text(
          widget.title,
          style: Theme.of(context).textTheme.title,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              widget.color.withOpacity(0.8),
              widget.color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
