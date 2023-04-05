import 'package:flutter/material.dart';

class TaskGui extends StatefulWidget {

  @override
  State<TaskGui> createState() => _TaskGuiState();
}

class _TaskGuiState extends State<TaskGui> {
  late String nameTask;
  late String from,time;
  IconData iconData=Icons.favorite_border;
  Color color=Colors.red;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(10)
      ),
      child: ListTile(
        leading: Checkbox(value: false,
          onChanged: (bool? value) {  },
        ),
        title: Text(nameTask,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
        subtitle: textInputtime(),
        trailing: TextButton(onPressed: (){

        },
            child: Icon(iconData,color: color,)),
      ),
    );
  }
  textInputtime()
  {
    return Column(
      children: [
        Text(from),
        Text(time)
      ],
    );
  }
}
