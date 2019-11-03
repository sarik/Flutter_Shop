import 'package:flutter/material.dart';
import 'package:shop/models/meal.dart';
import '../dummy_data.dart';
import '../widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  List<Meal> displayedMeals;
  String categoryTitle;
  var loadedInitData = false;

  @override
  void didChangeDependencies() {
    if (!loadedInitData) {
      loadedInitData = true;
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title'];
      final categoryId = routeArgs['id'];

      displayedMeals = DUMMY_MEALS
          // .where((meal) =>  meal.categories.indexOf(categoryId) > -1)
          .where((meal) => meal.categories.contains(categoryId))
          .toList();
    }

    super.didChangeDependencies();
  }

  removeItem(String mealId) {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
                id: displayedMeals[index].id,
                title: displayedMeals[index].title,
                imageUrl: displayedMeals[index].imageUrl,
                affordability: displayedMeals[index].affordability,
                complexity: displayedMeals[index].complexity,
                duration: displayedMeals[index].duration,
                onRemove: removeItem);
          },
          itemCount: displayedMeals.length,
        ));
  }
}
