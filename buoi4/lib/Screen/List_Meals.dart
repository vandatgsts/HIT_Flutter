import 'package:buoi4/Agument/Meals_Argument.dart';
import 'package:buoi4/borderCompoment/compomentListView.dart';
import 'package:buoi4/dummy_data.dart';
import 'package:flutter/material.dart';

import 'Meal_Inf.dart';

class ListMeals extends StatelessWidget {
  static final String id = 'List_Meals';
  int indexListCate;

  ListMeals({required this.indexListCate, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(DUMMY_CATEGORIES[indexListCate].title),
          backgroundColor: const Color(0xF6E5225A),
        ),
        backgroundColor: Colors.amberAccent[100],
        body: listView());
  }

  Widget listView() {
    List<int> indexDummy = [];
    for (int i = 0; i < DUMMY_MEALS.length; i++) {
      for (var element in DUMMY_MEALS[i].categories) {
        if (element == DUMMY_CATEGORIES[indexListCate].id) {
          indexDummy.add(i);
        }
      }
    }
    return ListView.builder(
        itemCount: indexDummy.length,
        itemBuilder: (BuildContext context, int index) {
          return TextButton(
              onPressed: () {
                Navigator.pushNamed(context, MealInf.id,
                    arguments: MealArugment(indexDummy[index]));
              },
              child: CompomentListView(
                title: DUMMY_MEALS[indexDummy[index]].title,
                textTimer: DUMMY_MEALS[indexDummy[index]].duration,
                imageUrl: DUMMY_MEALS[indexDummy[index]].imageUrl,
              ));
        });
  }
}
