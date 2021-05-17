import 'package:Meal_App/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = "filterScreen";
  final Function saveFilters;
  final Map<String, bool> currentFilters;
  FilterScreen(this.currentFilters, this.saveFilters);
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  @override
  initState() {
    _glutenFree = widget.currentFilters['gluten'];
    _lactoseFree = widget.currentFilters['lactose'];
    _vegan = widget.currentFilters['vegan'];
    _vegetarian = widget.currentFilters['vegetarian'];
    super.initState();
  }

  bool _glutenFree;
  bool _lactoseFree;
  bool _vegan ;
  bool _vegetarian ;

  Widget buildSwitchListTile(
      {String title,
      String description,
      bool currentValue,
      Function updateValue}) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(description),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filters"),
        actions: [
          IconButton(
            onPressed: () {
              final Map<String, bool> selectedFilters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
              };
              widget.saveFilters(selectedFilters);
            },
            icon: Icon((Icons.save)),
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "Adjust your meal selection",
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              buildSwitchListTile(
                  title: 'Gluten-Free',
                  description: "Only include gluten-free meals",
                  currentValue: _glutenFree,
                  updateValue: (newVlue) {
                    setState(() {
                      _glutenFree = newVlue;
                    });
                  }),
              buildSwitchListTile(
                  title: 'Lactose-Free',
                  description: "Only include lactose-free meals",
                  currentValue: _lactoseFree,
                  updateValue: (newVlue) {
                    setState(() {
                      _lactoseFree = newVlue;
                    });
                  }),
              buildSwitchListTile(
                  title: 'Vegetarian',
                  description: "Only include vegetarian meals",
                  currentValue: _vegetarian,
                  updateValue: (newVlue) {
                    setState(() {
                      _vegetarian = newVlue;
                    });
                  }),
              buildSwitchListTile(
                  title: 'Vegan',
                  description: "Only include vegan meals",
                  currentValue: _vegan,
                  updateValue: (newVlue) {
                    setState(() {
                      _vegan = newVlue;
                    });
                  }),
            ],
          ))
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
