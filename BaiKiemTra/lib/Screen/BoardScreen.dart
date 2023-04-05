import 'package:baikiemtra/Screen/AddTask.dart';
import 'package:flutter/material.dart';

import '../Compoment/TaskGui.dart';

List<TaskGui> listTask=[];
class BoardScreen extends StatefulWidget {
  static String id='Board_Screen';
  const BoardScreen({Key? key}) : super(key: key);

  @override
  State<BoardScreen> createState() => _BoardScreenState();
}

class _BoardScreenState extends State<BoardScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text('Board',style: TextStyle(fontSize: 30,color: Colors.black87,fontWeight: FontWeight.bold,)),
          actions: [
            Icon(Icons.find_in_page_outlined,color: Colors.black54,),
            Icon(Icons.notifications,color: Colors.black54,),
            Icon(Icons.calendar_month,color: Colors.black54,)
          ],
          bottom:const  TabBar(
            labelColor: Colors.black54,
            tabs:<Widget> [
              Tab(
                text:'All',
              ),
              Tab(
                  text: 'Uncompleted',
              ),
              Tab(
                text: 'Completed',
              ),
              Tab(
                text: 'Favourite',
              )
            ],

          ),
        ),
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            TabBarView(
              children: <Widget>[
                Center(
                 child: (listTask.length==0?ScreenNoTask():ScreenHasTask()),
                ),
                Center(

                 child: (listTask.length==0?ScreenNoTask():ScreenHasTask()),
                ),
                Center(

                  child: (listTask.length==0?ScreenNoTask():ScreenHasTask()),
                ),
                Center(
                  child: (listTask.length==0?ScreenNoTask():ScreenHasTask()),
                )
              ],
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
                    Navigator.pushNamed(context, AddTask.id);
                },
                child: Text('Add Task',style: TextStyle(
                  color: Colors.white,
                  fontSize: 20
                ),),
              ),
            )
          ],
        )

      ),
    );
  }
  ScreenNoTask(){
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.table_rows_sharp,color: Colors.black54,size: 50,),
            Text('No task Yey, Please Insert Some Tasks',style: TextStyle(color: Colors.black54),),
          ],
        ),
      ),
    );
  }
  ScreenHasTask(){
    return ListView.builder(
        itemBuilder: (BuildContext context, index){
      return listTask[index];
    });
  }
}
