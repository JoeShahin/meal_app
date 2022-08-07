// ignore_for_file: prefer_const_constructors, prefer_final_fields, unused_field, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, invalid_required_positional_param, non_constant_identifier_names

import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  const FiltersScreen(
      @required this.saveFilters, @required this.currentFilters);
  final dynamic saveFilters;
  final Map<String, dynamic> currentFilters;
  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _lactoseFree = false;
  var _vegan = false;
  var _vegetarian = false;
  @override
  void initState() {
    _glutenFree = widget.currentFilters['gluten'];
    _lactoseFree = widget.currentFilters['lactose'];
    _vegan = widget.currentFilters['vegan'];
    _vegetarian = widget.currentFilters['vegetarian'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Your filters!'),
          actions: [
            IconButton(
              onPressed: () {
                final selectedFilters = {
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian,
                };
                widget.saveFilters(selectedFilters);
              },
              icon: Icon(Icons.save_outlined),
            ),
          ],
        ),
        endDrawer: MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust your meal selection.',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  _buildSwitchListTile(
                    title: 'Gluten Free',
                    description: 'Only include gluten free meals.',
                    currentValue: _glutenFree,
                    updateValue: (newValue) {
                      setState(() {
                        _glutenFree = newValue;
                      });
                    },
                  ),
                  _buildSwitchListTile(
                    currentValue: _lactoseFree,
                    title: 'Lactose free',
                    description: 'Only include lactose free meals',
                    updateValue: (newValue) {
                      setState(() {
                        _lactoseFree = newValue;
                      });
                    },
                  ),
                  _buildSwitchListTile(
                    currentValue: _vegan,
                    title: 'Vegan',
                    description: 'Only include vegan meals',
                    updateValue: (newValue) {
                      setState(() {
                        _vegan = newValue;
                      });
                    },
                  ),
                  _buildSwitchListTile(
                    currentValue: _vegetarian,
                    title: 'Vegetarian',
                    description: 'Only include vegetarian meals',
                    updateValue: (newValue) {
                      setState(() {
                        _vegetarian = newValue;
                      });
                    },
                  )
                ],
              ),
            ),
          ],
        ));
  }

  Widget _buildSwitchListTile(
      {required var currentValue,
      required String title,
      required String description,
      required Null Function(
        dynamic newValue,
      )
          updateValue}) {
    return SwitchListTile(
      title: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
      ),
      value: currentValue,
      subtitle: Text(
        description,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      onChanged: updateValue,
    );
  }
}
