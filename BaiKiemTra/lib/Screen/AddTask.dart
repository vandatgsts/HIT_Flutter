import 'package:baikiemtra/Compoment/ListData.dart';
import 'package:baikiemtra/Compoment/TaskInfo.dart';
import 'package:baikiemtra/Screen/BoardScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class AddTask extends StatefulWidget {
  static String id = 'Add_Task';

  const AddTask({Key? key}) : super(key: key);

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  DateTime date = DateTime.utc(2022, 12, 23);
  TimeOfDay timeOfDayFrom = TimeOfDay(hour: 11, minute: 00);
  TimeOfDay timeOfDayEnd = TimeOfDay(hour: 11, minute: 00);
  TaskInfo newTask = TaskInfo();
  bool chooseColor = true;
  TextEditingController checkCotroler=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Add Task',
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Title',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: checkCotroler,
              obscureText: false,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Design team meeting'),
              onChanged: (text) {
                newTask.title = text;
              },
            ),
            const Text(
              'DeaLine',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            Stack(
              alignment: Alignment.centerRight,
              children: [
                Container(
                  height: 50,
                  width: double.infinity,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black26),
                      borderRadius: BorderRadius.circular(2)),
                  child: Text(
                    '${date.day}/${date.month}/${date.year}',
                    style: const TextStyle(color: Colors.black45, fontSize: 15),
                  ),
                ),
                IconButton(
                    onPressed: () => _selectDate(context),
                    icon: Icon(
                      Icons.calendar_today,
                      size: 20,
                    ))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Start Time',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      Stack(
                        alignment: Alignment.centerRight,
                        children: [
                          Container(
                            height: 50,
                            width: double.infinity,
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black26),
                                borderRadius: BorderRadius.circular(2)),
                            child: Text(
                              '${timeOfDayFrom.hour}:${timeOfDayFrom.minute} ',
                              style: TextStyle(
                                  color: Colors.black45, fontSize: 15),
                            ),
                          ),
                          IconButton(
                              onPressed: () async {
                                final TimeOfDay? picked = await showTimePicker(
                                  context: context,
                                  initialTime: timeOfDayFrom,
                                );
                                if (picked != null && picked != timeOfDayFrom)
                                  setState(() {
                                    timeOfDayFrom = picked;
                                    newTask.fromTime= '${timeOfDayFrom.hour}:${timeOfDayFrom.minute} ';
                                  });
                              },
                              icon: const Icon(
                                Icons.timer,
                                size: 20,
                              ))
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'End Time',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  // chon gio end
                  Stack(
                    alignment: Alignment.centerRight,
                    children: [
                      Container(
                        height: 50,
                        width: double.infinity,
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black26),
                            borderRadius: BorderRadius.circular(2)),
                        child: Text(
                          '${timeOfDayEnd.hour}:${timeOfDayEnd.minute }',
                          style: TextStyle(
                              color: Colors.black45, fontSize: 15),
                        ),
                      ),
                      IconButton(
                          onPressed: () async {
                            final TimeOfDay? picked = await showTimePicker(
                              context: context,
                              initialTime: timeOfDayEnd,
                            );
                            if (picked != null && picked != timeOfDayEnd)
                              setState(() {
                                timeOfDayEnd = picked;
                                newTask.endTime=  '${timeOfDayEnd.hour}:${timeOfDayEnd.minute }';
                              });
                          },
                          icon: const Icon(
                            Icons.timer,
                            size: 20,
                          ))
                    ],
                  ),
                  ],
                ))
              ],
            ),
            const Text(
              'Remind',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            const TextField(
              obscureText: false,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: '10 minute early'),
            ),
            const Text(
              'Repeat',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            const TextField(
              obscureText: false,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Weakly'),
            ),
            Container(
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black12,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    //ColorTask(Colors.red, !chooseColor),
                    // ColorTask(Colors.yellow,chooseColor),
                    // ColorTask(Colors.cyan,!chooseColor),
                    // ColorTask(Colors.purple,!chooseColor),
                    // ColorTask(Colors.green,!chooseColor),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.red,
                        //  border: Border.all(color: colorBoder)
                      ),
                      child: Checkbox(
                        value: chooseColor,
                        onChanged: (bool? value) {
                          setState(() {
                            chooseColor = value!;
                          });
                        },
                      ),
                    ),
                  ],
                )),
            Container(
              height: 50,
              width: double.infinity,
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.green, borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                onPressed: () {
                  if (checkCotroler.text.isNotEmpty) {
                    listTask.add(newTask);
                    listTaskUnCompleted.add(newTask);
                    Navigator.popAndPushNamed(context, BoardScreen.id);
                    TaskInfo.idTask++;
                  } else {
                    _showToast(context);
                  }
                },
                child: const Text(
                  'Create a task',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _showToast(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text('Input title'),
        action: SnackBarAction(
            label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: date,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != date)
      setState(() {
        date = picked;
        newTask.dealine = '${date.day}/${date.month}/${date.year}';
      });
  }

}
