import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../widgets/category_item.dart';
import '../screens/filters_screen.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        height: MediaQuery.of(context).size.height - 160,
        child: GridView(
          padding: const EdgeInsets.all(25),
          children: DUMMY_CATEGORIES
              .map(
                (catData) => CategoryItem(
                  catData.id,
                  catData.title,
                  catData.color,
                ),
              )
              .toList(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
        ),
      ),
      Positioned(
        bottom: 20,
        right: 10,
        child: //Container(
            //width: 300,
            // color: Colors.black54,

            // child:
            FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
          },
          child: Icon(Icons.edit),
          //child: FittedBox(child:Text("Filters")),
          //backgroundColor: Color.fromRGBO(200, 200, 200, 0.5),
        ),
      ),
      //),
    ]);
  }
}
