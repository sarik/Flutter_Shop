import 'package:flutter/material.dart';

class MealItem extends StatelessWidget {
  final String name;
  final String description;

  MealItem(this.name, this.description);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text(name, style: Theme.of(context).textTheme.title),
          Text(description)
        ],
      ),
    );
  }
}
