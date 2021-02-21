import 'package:flutter/material.dart';
import './Dummy_data.dart';

class MealDeatilScreen extends StatelessWidget {
  final String id;
  MealDeatilScreen(this.id);
  @override
  Widget build(BuildContext context) {
    final correspondingMealId = DUMMY_MEALS.firstWhere((element) {
      return id == element.id;
    });
    return Scaffold(
      appBar: AppBar(
        title: Text("${correspondingMealId.title}"),
      ),
      body: SingleChildScrollView(
              child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
              border: Border.all(width:4,
              color:Colors.black
              ),
              borderRadius: BorderRadius.circular(10),
              ),
              margin: EdgeInsets.symmetric(vertical: 15),
              child: Image.network(correspondingMealId.imageUrl),
            ),
            Column(
              children: <Widget>[
                Text("Ingredients", style: Theme.of(context).textTheme.title),
                SizedBox(height: 10),
                Container(
                  height: 180,
                  width: 300,
                  margin:EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    border: Border.all(width: 4,color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                    
                    
                  ),
                  child: Card(
                    child: ListView.builder(
                      itemBuilder: (ctx, index) {
                        return Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            color:Theme.of(context).accentColor,
                            child: Text(correspondingMealId.ingredients[index],
                                style: Theme.of(context).textTheme.title),
                          ),
                        );
                      },
                      itemCount: correspondingMealId.ingredients.length,
                    ),
                  ),
                )

              ],
            ),
             Container(
                margin:EdgeInsets.only(top:5,right: 12),
                alignment: Alignment.centerRight,
                child: FloatingActionButton(
                  child: Icon(Icons.delete),

                   onPressed: ()=>Navigator.of(context).pop(id),
                ),
              ),
          
            Column(
              children: <Widget>[
                Text("Steps", style: Theme.of(context).textTheme.title),
                SizedBox(height: 10),
                Container(
                  height: 180,
                  width: 300,
                  margin:EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    border: Border.all(width: 4,
                    color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                child:Card(
                    child: ListView.builder(
                    itemBuilder: (ctx, index) {
                      return ListTile(
                        leading: CircleAvatar(
                          child: Text("${index+1}"),
                        ),
                        title: Text(correspondingMealId.steps[index],style:Theme.of(context).textTheme.title),
                      );
                    },
                    itemCount: correspondingMealId.steps.length,
                  ),
                ),),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
