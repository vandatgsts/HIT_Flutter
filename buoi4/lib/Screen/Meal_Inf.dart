import 'package:flutter/material.dart';

import '../dummy_data.dart';

class MealInf extends StatefulWidget {
  static final String id = 'Screen3';
  int idMeals;

  MealInf({super.key, required this.idMeals});

  @override
  State<MealInf> createState() => _MealInfState();
}

class _MealInfState extends State<MealInf> {
  late IconData iconButton=Icons.star_border;
  Color colorButton=Colors.black;
  bool checkButton=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xF6E5225A),
          title: Text(DUMMY_MEALS[widget.idMeals].title,
              style: const TextStyle(color: Colors.white, fontSize: 20)),
        ),
        body: SafeArea(
          child: Stack(
            alignment: Alignment.bottomRight,
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    Image.network(DUMMY_MEALS[widget.idMeals].imageUrl),
                    const Text('Ingredent', style: TextStyle(fontSize: 20)),
                    const SizedBox(
                      height: 5,
                    ),
                    listIngredent(),
                    const Text(
                      'Step',
                      style: TextStyle(fontSize: 20),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    listStep(),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(20),
                child: FloatingActionButton(
                  backgroundColor: Colors.yellowAccent,
                  onPressed: (){
                      setState(() {
                        if(!checkButton) {
                          checkButton=true;
                          iconButton = (Icons.star);
                          colorButton = Colors.pink;
                        }
                        else{
                          checkButton=false;
                          iconButton=(Icons.star_border);
                          colorButton=Colors.black;
                        }
                      });
                  },
                  child: Icon(iconButton,color: colorButton,),),
              )
            ],
          ),
        )
        );
  }

  Widget listIngredent() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: DUMMY_MEALS[widget.idMeals].ingredients.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          margin: const EdgeInsets.all(3),
          decoration: BoxDecoration(
              color: const Color(0xFFFFC400),
              borderRadius: BorderRadius.circular(10)),
          child: Text(DUMMY_MEALS[widget.idMeals].ingredients[index],
              style: const TextStyle(fontSize: 20)),
        );
      },
    );
  }

  Widget listStep() {
    return Scrollbar(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: DUMMY_MEALS[widget.idMeals].steps.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: const EdgeInsets.all(3),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.pink),
                  child: Text(
                    '#$index',
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                SizedBox(
                    width: 350,
                    child: Text(
                      DUMMY_MEALS[widget.idMeals].steps[index],
                      style: const TextStyle(fontSize: 15),
                    )),
              ],
            ),
          );
        },
      ),
    );
  }
}
