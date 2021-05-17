import 'package:Meal_App/models/meal.dart';
import 'package:Meal_App/original.dart';
import 'package:Meal_App/screens/category_meals_screen.dart';
import 'package:Meal_App/screens/filters_screen.dart';
import 'package:Meal_App/screens/meal_details_screen.dart';
import 'package:Meal_App/screens/tabs_screen.dart';
import 'package:flutter/material.dart';

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
    'vegetarian': false,
  };

  List<Meal> availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      availableMeals = DUMMY_MEALS.where((meal) {
        if (!_filters['gluten'] || meal.isGlutenFree) {
          if (!_filters['lactose'] || meal.isLactoseFree) {
            if (!_filters['vegan'] || meal.isVegan) {
              if (!_filters['vegetarian'] || meal.isVegetarian) {
                return true;
              }
            }
          }
        }
        return false;
      }).toList();
    });
  }

  void _toggleFavorite(String mealId) {
    final existingIndex = _favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeals
            .add(DUMMY_MEALS.firstWhere((element) => element.id == mealId));
      });
    }
  }

  bool isMealFavorite(String mealId) {
    return _favoriteMeals.any((element) => element.id == mealId);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          textTheme: ThemeData.light().textTheme.copyWith(
                body1: TextStyle(color: Color.fromRGBO(20, 50, 50, 1)),
                body2: TextStyle(color: Color.fromRGBO(20, 50, 50, 1)),
                title: TextStyle(fontSize: 24, fontFamily: "RobotoCondensed"),
              ),
        ),
        routes: {
          '/': (context) => TabsScreen(_favoriteMeals),
          CategoryMealsScreen.routeName: (context) =>
              CategoryMealsScreen(availableMeals),
          MealDetailScreen.routeName: (context) =>
              MealDetailScreen(_toggleFavorite,isMealFavorite),
          FilterScreen.routeName: (context) =>
              FilterScreen(_filters, _setFilters)
        });
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Flutter App"),
        ),
        body: null);
  }
}
