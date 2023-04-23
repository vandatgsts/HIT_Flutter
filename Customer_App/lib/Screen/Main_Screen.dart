import 'package:customerapp/Compoment/TaskGui.dart';
import 'package:customerapp/data/ClientInf.dart';
import 'package:customerapp/data/data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Add_Task.dart';

class MainScreen extends StatefulWidget {
  static String id = 'Main_Screen';

  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          //backgroundColor: Colors.blue,
          leading: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          title: const CupertinoSearchTextField(),
          bottom:
              const TabBar(isScrollable: true, labelColor: Colors.white, tabs: [
            Text('Tat ca'),
            Text('Khach hang'),
            Text('Khach hang va nha cung cap'),
            Text('Nha cung cap')
          ]),
          actions: [
            FloatingActionButton(
              backgroundColor: Colors.white,
              onPressed: () {
                Navigator.pushNamed(context, AddTask.id).then((value) {
                  setState(() {});
                });
              },
              child: const Icon(
                Icons.add,
                color: Colors.blue,
              ),
            )
          ],
        ),
        body: TabBarView(children: [
          Container(
            child: (listAll.isEmpty ? ScreenNoTask() : ScreenHasTask(listAll)),
          ),
          Container(
            child: ClientBuild(),
          ),
          Container(
            child: ClientAndSupplierBuild(),
          ),
          Container(
            child: SuppilerBuild(),
          )
        ]),
      ),
    );
  }

  ClientBuild() {
    List<ClientInf> listClient =
        listAll.where((element) => element.type == 1).toList();
    return (listClient.isEmpty ? ScreenNoTask() : ScreenHasTask(listClient));
  }

  ClientAndSupplierBuild() {
    List<ClientInf> listClientAndSupplier =
        listAll.where((element) => element.type == 2).toList();
    return (listClientAndSupplier.isEmpty
        ? ScreenNoTask()
        : ScreenHasTask(listClientAndSupplier));
  }

  SuppilerBuild() {
    List<ClientInf> listSuppiler =
        listAll.where((element) => element.type == 3).toList();
    return (listSuppiler.isEmpty
        ? ScreenNoTask()
        : ScreenHasTask(listSuppiler));
  }

  ScreenNoTask() {
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.table_rows_sharp,
              color: Colors.black54,
              size: 50,
            ),
            Text(
              'No task Yey, Please Insert Some Tasks',
              style: TextStyle(color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }

  ScreenHasTask(List<ClientInf> list) {
    return ListView.builder(
        itemCount: list.length,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, index) {
          return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TaskGui(
                    name: list[index].name,
                    phoneNumber: list[index].phoneNumber,
                    city: list[index].city,
                    district: list[index].district,
                    address: list[index].district,
                    email: list[index].email,
                    taxCode: list[index].taxCode,
                    idNumber: list[index].idNumber,
                    description: list[index].description)
              ]);
        });
  }
}
