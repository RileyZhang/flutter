import 'package:flutter/material.dart';

import 'Navigator2/MyRouteDelegate.dart';

class HomePage extends StatefulWidget{
  @override
  HomePageState createState() =>HomePageState();

}

class HomePageState extends State<HomePage>{
  @override
  Widget build(BuildContext context) {
    Widget divider1=const Divider(color: Colors.blue,);
    Widget divider2=const Divider(color: Colors.green);
    return Scaffold(
      appBar: AppBar(
        title: const Text("test"),
      ),
      body: Container(
        child: ListView.separated(
          //分割器构造器
          separatorBuilder: (BuildContext context, int index) {
            return index%2==0?divider1:divider2;
          },
          itemCount: 20,
          itemBuilder: (BuildContext context, int index){
            return GestureDetector(
              onTap: ()=>MyRouteDelegate.of(context).push('$index'),
              child: ListTile(title: Text("$index"),),
            );
          },
        ),
      ),
    );
  }

  void test(){
    // Navigator.of(context).push(route);
    // final routerDelegate = RouterDelegate17();
  }
}