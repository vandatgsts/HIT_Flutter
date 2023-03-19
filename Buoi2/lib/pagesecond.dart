import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

var urlBackGround = 'https://i0.wp.com/thatnhucuocsong.com.vn/wp-content/uploads/2022/01/hinh-nen-dien-thoai-4k.jpg?resize=338%2C600&ssl=1';
class PageSecond extends StatefulWidget{
  @override
  State<PageSecond> createState() =>_PageSecond();
}
class _PageSecond extends State<PageSecond> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(urlBackGround),
                fit: BoxFit.cover,
              )
          ),
          child: SizedBox(
            child: Column(
              children: [
                buildOption(),
                buildMoneyShow(),
                buildFuntion(),
                buildHistory()
              ],
            ),
          ),

        ),
      ),
    );
  }

  Widget buildMoneyShow() {
    return Container(
      alignment: Alignment.topRight,
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Container(
          height: 50,
          width: 150,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10)
          ),
          child: Row(
            children: [
              Icon(Icons.home_filled, color: Colors.red, size: 40),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text('Số dư khả dụng',
                    style: TextStyle(color: Colors.black26, fontSize: 13),),
                  Text(
                    '00000000000', style: TextStyle(fontFamily: 'RobotoBold'),
                    maxLines: 1,)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildOption() {
    return Container(
        alignment: Alignment.topLeft,

        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: IconButton(
              icon: const Icon(Icons.more_horiz, size: 25),
              onPressed: () {},
              color: Colors.black,
            ),
          ),
        )
    );
  }

  Widget buildFuntion() {
    return Container(
      margin: EdgeInsets.all(15),
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Funtion(iconData: listIcons[0],
            title: listNameFuntion[0]),
          Funtion(iconData: listIcons[1],
              title: listNameFuntion[1]),
          Funtion(iconData: listIcons[2],
              title: listNameFuntion[2]),
          Funtion(iconData: listIcons[3],
              title: listNameFuntion[3]),

        ],
      )
    );
  }
  // Widget listFuntion(){
  //   return ListView.builder(
  //     padding: EdgeInsets.all(12),
  //     itemCount: list.length,
  //     itemBuilder: (BuildContext context,int index){
  //       return Container(
  //         height: 40,
  //         child: list[index],
  //       );
  //     },
  //   );
  // }
  Widget buildHistory() {
    return Container(

      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
              const ListTile(
                title: Text('Lịch sử giao dịch',style: TextStyle(fontFamily: 'RobotoBold'),),
                trailing: Icon(Icons.sync),
              ),
          const SizedBox(height: 10),
          Container(
              margin:const EdgeInsets.only(left: 30),
              child:const Text('Hôm qua,5 Thg 1, 2023',style: TextStyle(color: Colors.black54,fontSize: 13),)),
          Column(
            children: [
              Transaction(iconData: Icons.arrow_forward, name: 'Truong Bach Chien', title2: 'chuyen tien hoc', money: '+ 10.000.000', color: Colors.greenAccent),
               Transaction(iconData: Icons.arrow_back, name: 'Truong Bach Chien', title2: 'thanh toan tien an', money: '- 5.000.000', color: Colors.redAccent),

            ],
          ),

        ],
      ),
    );
  }

}

class Transaction extends StatelessWidget{

    final IconData iconData;
    final String name;
    final String title2;
    final String money;
    final Color color;


    Transaction({required this.iconData,required this.name,required this.title2,required this.money,required this.color});

    @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(padding:const EdgeInsets.only(left: 5),
      child: ListTile(
        leading: Container(
          decoration:const BoxDecoration(
            color: Colors.white,
          ),
          child: Icon(iconData,color: color,),
        ),
        title: Text(name),
        subtitle: Text(title2),
        trailing: Text(money,maxLines: 1,style: TextStyle(fontWeight: FontWeight.bold),),
      ),
    );
  }
}
final List<IconData> listIcons=[Icons.wallet,Icons.attach_money,Icons.swap_horiz_rounded,Icons.qr_code_2];
final List<String> listNameFuntion=['Tài khoản và thẻ','Rút tiền','Chuyền tiền','Mã Qr code'];
class Funtion extends StatelessWidget{

  final IconData iconData;
  final String title;
  Funtion( {required this.iconData,required this.title});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(padding: EdgeInsets.zero,
      child: SizedBox(
        width:60,
        height: 70,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(iconData,color: Colors.orange),
            Text(title,maxLines:2,textAlign: TextAlign.center,style: const TextStyle(fontSize: 12),)
          ],
        ),
    ),
    );
  }


}


