import 'package:flutter/material.dart';
import './Meal_DetailScreen.dart';
import '../models/Recipe_discription.dart';

class MealSelection extends StatelessWidget {
  final id;
  final title;
  final image;
  final duration;
  final Complexity complexity;
  final Affordability affordability;
  final Function remove;

  MealSelection({
    @required this.id,
    @required this.title,
    @required this.image,
    @required this.duration,
    @required this.affordability,
    @required this.complexity,
    @required this.remove,
  });
  @override
  void details(BuildContext ctx) {
    Navigator.of(ctx).push(MaterialPageRoute(builder: (ctx) {
      return MealDeatilScreen(id);
    })).then((result) {
      if (result != null) {
        remove(result);
      }
    });
  }

  String affordabilityConverter() {
    if (affordability == Affordability.Luxurious) return 'Luxurious';
    if (affordability == Affordability.Affordable) return 'Affordable';
    if (affordability == Affordability.Pricey) return 'Pricey';
  }

  String complexityConverter() {
    if (complexity == Complexity.Challenging) return 'Challenging';
    if (complexity == Complexity.Hard) return 'Hard';
    if (complexity == Complexity.Simple) return 'Simple';
  }

  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => details(context),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            elevation: 5,
            child: Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                      child: Image.network(image,
                          height: 200,
                          width: double.infinity,
                          fit: BoxFit.cover),
                    ),
                    Positioned(
                      bottom: 10,
                      right: 10,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black38,
                        ),
                        width: 300,
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Text(
                          title,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontFamily: 'Raleway-Regular',
                          ),
                          softWrap: true,
                          overflow: TextOverflow.fade,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(Icons.schedule),
                          SizedBox(
                            width: 8,
                          ),
                          Text('$duration min',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Icon(Icons.work),
                          SizedBox(
                            width: 8,
                          ),
                          Text(complexityConverter(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Icon(Icons.attach_money),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            affordabilityConverter(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}
