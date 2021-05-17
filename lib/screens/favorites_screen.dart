import 'package:Meal_App/models/meal.dart';
import 'package:Meal_App/widgets/meal_item.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;
  FavoriteScreen(this.favoriteMeals);

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    if (widget.favoriteMeals.isEmpty)
      return Center(
        child: Text("You have no favorites yet - start adding some!"),
      );
    else
      return ListView.builder(
        itemCount: widget.favoriteMeals.length,
        itemBuilder: (ctx, index) {return MealItem(
            id: widget.favoriteMeals[index].id,
            title: widget.favoriteMeals[index].title,
            imageUrl: widget.favoriteMeals[index].imageUrl,
            duration: widget.favoriteMeals[index].duration,
            complexity: widget.favoriteMeals[index].complexity,
            affordability: widget.favoriteMeals[index].affordability,
 
          );},
      );
  }
}
