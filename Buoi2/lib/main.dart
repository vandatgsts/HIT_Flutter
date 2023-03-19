import 'package:android/pagesecond.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.red,
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      home: PageSecond(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
          buildHeading(),
            buildProfile(),
            buildFuntion(),
            Lougout()

        ],
      ),
      ),
    );
  }
  Widget buildHeading() {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text(
            "Profile",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            "Edit Profile",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue),
          )
        ],
      ),
    );
  }
  Widget buildProfile(){
    return Padding(
        padding: EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children:[
         const CircleAvatar(
            radius: 50,
            child: CircleAvatar(
              maxRadius: 50,
              backgroundImage: AssetImage('assets/images/img1.png'),
            ),
          ),
      const Text('    '),

      Column(
        children: const [
          Text(
              'Nguyen Van Dat',
            style: TextStyle(color: Colors.black, fontSize: 20,fontFamily: 'RobotoBold'),
          ),
          SizedBox(height:10),
          Text(
            '1234 5678 9101',
            style: TextStyle(color: Colors.black12,fontSize: 20),
          )
        ],
      )
        ],
      ),
    );
  }
  Widget buildFuntion(){
    return Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Option(Icons.calendar_today_outlined, 'Account', Colors.blue),
          Option(Icons.add_location_alt, 'Address', Colors.purpleAccent),
          Option(Icons.settings, 'Setting', Colors.orange),
          Option(Icons.help_center, 'Help Center', Colors.purpleAccent),
          Option(Icons.call,'Contact', Colors.blue)

          ],
        ),
    );
  }
  Widget Lougout(){
    return Padding(padding: EdgeInsets.all(12),
         child: SizedBox(
          width: double.infinity,
          height: 60,
            child: ElevatedButton(
                style:  ElevatedButton.styleFrom(backgroundColor: Colors.purpleAccent[200]),
                onPressed: () {},
                child:const Text('Log Out',style: TextStyle(fontSize: 20),)),

            ),

    );
  }
}

class Option extends StatelessWidget{
  final IconData iconButton;
  final String title;
  final Color color;
  Option(this.iconButton, this.title, this.color);

  @override
  Widget build(BuildContext context) {
    return  ListTile(
        contentPadding: const EdgeInsets.fromLTRB(30, 15, 30, 15),
      leading: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(20)
          ),
        child: Icon(iconButton),
          ),
      title: Text(title),
      trailing: Icon(Icons.arrow_forward_ios)
    );
  }

}
