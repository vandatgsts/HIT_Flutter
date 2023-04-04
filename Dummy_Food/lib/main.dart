import 'package:buoi4/Screen/Categories.dart';
import 'package:buoi4/Agument/List_Meals_Argument.dart';
import 'package:flutter/material.dart';

import 'Agument/Meals_Argument.dart';
import 'Screen/List_Meals.dart';
import 'Screen/Meal_Inf.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Screen1.id,
      routes: {
        Screen1.id: (context) => Screen1(),
     //   Screen2.id:(context)=>Screen2(),
      },
      onGenerateRoute: (setting){
        if(setting.name==ListMeals.id)
          {
            final args=setting.arguments as ListMealsArgument;
            return MaterialPageRoute(builder: (context)
            {
              return ListMeals(indexListCate: args.index,);
            });
          }
        if(setting.name==MealInf.id)
          {
            final args=setting.arguments as MealArugment;
            return MaterialPageRoute(builder: (context)
            {
              return MealInf(
                idMeals: args.id,
              );
            }
            );
          }
    },
    );
  }
}
