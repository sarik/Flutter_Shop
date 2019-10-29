import 'package:flutter/material.dart';
import './dummy_data.dart';
import './meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';
  //final String title;
  //final String id;

  //CategoryMealsScreen(this.id, this.title);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];

    final mealsForCategory = DUMMY_MEALS
        .where((val) => val.categories.indexOf(categoryId) > -1)
        .toList();

    print(
        'no of actual meals :: ${DUMMY_MEALS.length} :: ${mealsForCategory} :: ${categoryId}');
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return Row(
              children: mealsForCategory
                  .map((val) => MealItem(val.id, val.title))
                  .toList(),
            );
          },
          itemCount: mealsForCategory.length,
        ));
  }
}
