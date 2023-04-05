import 'package:baikiemtra/Screen/BoardScreen.dart';
import 'package:flutter/material.dart';

class AddTask extends StatelessWidget {
  static String id='Add_Task';
  const AddTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Add Task',style: TextStyle(fontSize: 20),),
      ),
      body: SafeArea(
        child: Column(
          children: [
           const Text('Title',style: TextStyle(color: Colors.black),),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Design team meeting'
              ),
            ),
          const Text('DeaLine',style: TextStyle(color: Colors.black),),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: '21-03-2022'
              ),
            )
         ,
          const Text('Title',style: TextStyle(color: Colors.black),),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: [
               Column(
                 children: [
                   const Text('Start Time',style: TextStyle(color: Colors.black),),
                   SizedBox(
                     width: 50,
                     child: TextField(
                       obscureText: true,
                       decoration: InputDecoration(
                           border: OutlineInputBorder(),
                           labelText: '11:00 AM'
                       ),
                     ),
                   )
                 ],
               ),
               Column(
                 children: [
                   const Text('End Time',style: TextStyle(color: Colors.black),),
                   SizedBox(
                     width: 50,
                     child: TextField(
                       obscureText: true,
                       decoration: InputDecoration(
                           border: OutlineInputBorder(),
                           labelText: '11:00 AM'
                       ),
                     ),
                   )
                 ],
               )
             ],
           )
         ,
         const  Text('Remind',style: TextStyle(color: Colors.black),),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: '10 minute early'
              ),
            ),
            const  Text('Repeat',style: TextStyle(color: Colors.black),),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Weakly'
              ),
            ),

            Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black12,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text('dada')
                  )
                ],
              ),
            ),
        Container(
          height: 50,
          width: double.infinity,
          margin: EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(20)
          ),
          child: TextButton(
            onPressed: (){
              Navigator.pop(context, BoardScreen.id);
            },
            child: Text('Create a task',style: TextStyle(
                color: Colors.white,
                fontSize: 20
            ),),
          ),
        )
          ],
        ),
      ),
    );
  }
}
