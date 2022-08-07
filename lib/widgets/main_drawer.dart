// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Colors.amberAccent,
            child: Text(
              "Cooking Up",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
                color: Colors.red,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ListTile(
            leading: Icon(
              Icons.restaurant_outlined,
              size: 26,
            ),
            title: Text(
              'Meals',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          ListTile(
            leading: Icon(
              Icons.filter_outlined,
              size: 26,
            ),
            title: Text(
              'Filters',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.of(context).pushNamed('/filters');
            },
          ),
        ],
      ),
    );
  }
}
