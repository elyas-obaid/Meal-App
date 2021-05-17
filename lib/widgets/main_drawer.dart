import 'package:Meal_App/screens/filters_screen.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(
      String title, IconData icon, void Function() tapHandler) {
    return ListTile(
      onTap: tapHandler,
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 24,
          fontFamily: 'RobotoCondensed',
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            color: Theme.of(context).accentColor,
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            child: Text(
              "Cooking Up!",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  color: Theme.of(context).primaryColor),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile("Meal", Icons.restaurant,
              () => Navigator.of(context).pushReplacementNamed('/')),
          buildListTile(
              "Filters",
              Icons.settings,
              () => Navigator.of(context)
                  .pushReplacementNamed(FilterScreen.routeName)),
        ],
      ),
    );
  }
}
