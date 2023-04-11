import 'package:baikiemtra/Screen/AddTask.dart';
import 'package:flutter/material.dart';

import '../Compoment/ListData.dart';
import '../Compoment/TaskInfo.dart';


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
                Container(

                   child: (listTask.length==0?ScreenNoTask():ScreenHasTask(listTask)),

                ),
                Container(

                 child: (listTaskUnCompleted.length==0?ScreenNoTask():ScreenHasTask(listTaskUnCompleted)),
                ),
                Container(

                  child: (listTaskCompleted.length==0?ScreenNoTask():ScreenHasTask(listTaskCompleted)),
                ),
                Container(
                  child: (listTaskFavourited.length==0?ScreenNoTask():ScreenHasTask(listTaskFavourited)),
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
  ScreenHasTask(List<TaskInfo> list){
    return ListView.builder(
      itemCount: list.length,
      shrinkWrap: true,
        itemBuilder: (BuildContext context, index){
      return Container(
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: Colors.red, borderRadius: BorderRadius.circular(10)),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [TaskGui(list[index])]
        ),
      );

    });
  }
  TaskGui(TaskInfo taskInfo){
    IconData iconFavorite=Icons.favorite_border;
    return Container(
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: Colors.red, borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: Checkbox(
          value: taskInfo.checkCompleted,
          onChanged: (bool? value) {
            taskInfo.checkCompleted=value!;
            if(taskInfo.checkCompleted)
              {
                  listTaskCompleted.add(taskInfo);
                  listTaskUnCompleted.remove(taskInfo);
              }
            else{
              listTaskUnCompleted.add(taskInfo);
              listTaskCompleted.remove(taskInfo);
            }
            setState(() {});
          },

        ),
            title: Text(
              taskInfo.title,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            subtitle:Column(
              children: [
                Text('From: ${taskInfo.fromTime} To: ${taskInfo.endTime}'),
                Text('Dealine: ${taskInfo.dealine}')
              ],
            ),
        trailing: IconButton(
          onPressed: () {
            if(!taskInfo.checkFavourited)
              {
                iconFavorite=Icons.favorite;
                taskInfo.checkFavourited=true;
                listTaskFavourited.add(taskInfo);
              }
            else{
              iconFavorite=Icons.favorite_border;
              taskInfo.checkFavourited=false;
              listTaskFavourited.remove(taskInfo);
            }
            setState(() {});
          },
          icon: Icon(iconFavorite,color: (taskInfo.checkFavourited?Colors.pink:Colors.black),),
        ),
      ),
    );
  }
}
