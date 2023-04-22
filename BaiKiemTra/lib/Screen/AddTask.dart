import 'package:baikiemtra/Compoment/ListData.dart';
import 'package:baikiemtra/Compoment/TaskInfo.dart';
import 'package:baikiemtra/Screen/BoardScreen.dart';
import 'package:flutter/material.dart';

class AddTask extends StatefulWidget {
  static String id = 'Add_Task';

  const AddTask({Key? key}) : super(key: key);

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  DateTime date = DateTime.now();
  TimeOfDay timeOfDayFrom = const TimeOfDay(hour: 11, minute: 00);
  TimeOfDay timeOfDayEnd = const TimeOfDay(hour: 11, minute: 00);
  TaskInfo newTask = TaskInfo();
  TextEditingController checkCotroler = TextEditingController();

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
                    icon: const Icon(
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
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black26),
                                borderRadius: BorderRadius.circular(2)),
                            child: Text(
                              '${timeOfDayFrom.hour}:${timeOfDayFrom.minute} ',
                              style: const TextStyle(
                                  color: Colors.black45, fontSize: 15),
                            ),
                          ),
                          IconButton(
                              onPressed: () async {
                                await _getTime(context, (time){timeOfDayFrom = time;});
                                newTask.fromTime =
                                '${timeOfDayFrom.hour}:${timeOfDayFrom.minute} ';
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
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black26),
                              borderRadius: BorderRadius.circular(2)),
                          child: Text(
                            '${timeOfDayEnd.hour}:${timeOfDayEnd.minute}',
                            style:
                                const TextStyle(color: Colors.black45, fontSize: 15),
                          ),
                        ),
                        IconButton(
                            onPressed: () async {
                              await _getTime(context, (time){timeOfDayEnd = time;});
                              newTask.endTime =
                              '${timeOfDayEnd.hour}:${timeOfDayEnd.minute} ';
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
                    ColorTask(),
                    ColorTask(color: listColor[1], id: 1),
                    ColorTask(color: listColor[2], id: 2),
                    ColorTask(color: listColor[3], id: 3),
                    ColorTask(color: listColor[4], id: 4),
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

  Future<void> _getTime(BuildContext context, Function(TimeOfDay) myTime) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: timeOfDayFrom,
    );
    if (picked != null && picked != timeOfDayFrom) {
      setState(() {
        //timeOfDayFrom = picked;
        myTime(picked);
      });
    }
  }

  ColorTask({Color color = Colors.red, int id = 0}) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
          border:
              Border.all(color: (!listCheckColor[id] ? color : Colors.black))),
      child: Checkbox(
        value: listCheckColor[id],
        onChanged: (bool? value) {
          setState(() {
            listCheckColor[id] = value!;
            if (listCheckColor[id]) {
              for (int i = 0; i < listCheckColor.length; i++) {
                if (i != id)
                  listCheckColor[i] = false;
                else
                  newTask.color = color;
                print(newTask.color);
              }
            }
          });
        },
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
