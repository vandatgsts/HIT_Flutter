import 'package:buoi4/Agument/List_Meals_Argument.dart';
import 'package:buoi4/Screen/Meal_Inf.dart';
import 'package:buoi4/borderCompoment/compoment.dart';
import 'package:buoi4/dummy_data.dart';
import 'package:flutter/material.dart';

import 'List_Meals.dart';

class Screen1 extends StatefulWidget {
  static const String id = 'Sreen_1';

  const Screen1({Key? key}) : super(key: key);

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color(0xF6E5225A),
          title: const Text(
            'Categories',
            style: TextStyle(color: Colors.white, fontSize: 20),
          )),
      drawer: const Drawer(),
      body: listCompoment(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xF6E5225A),
        selectedItemColor: Colors.yellow[200],
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: 'Catelogest'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Cateloges')
        ],
      ),
    );
  }

  Widget listCompoment() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: GridView.count(
        primary: true,
        crossAxisCount: 3,
        children: List.generate(DUMMY_CATEGORIES.length, (index) {
          return TextButton(
            onPressed: () {
              Navigator.pushNamed(context, ListMeals.id,
                  arguments: ListMealsArgument(index));
            },
            child: Center(
                child: Compoment(DUMMY_CATEGORIES[index].color,
                    DUMMY_CATEGORIES[index].title)),
          );
        }),
      ),
    );
  }
}
