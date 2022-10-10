import 'package:example/HomePage.dart';
import 'package:example/pages/test0page.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class MyPage extends Page{

  String routeName;
  MyPage({
    required LocalKey key,
    required this.routeName,
  }):super(key: key,name: routeName);

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
        settings: this,
        builder: (BuildContext context){
          return getWidget(routeName);
        },
    );
  }

  Widget getWidget(String route){
    Widget child = Container();
    switch(route){
      case "/":
        child = MyHomePage(title:"test");
        break;
      case "test":
        child = HomePage();
        break;
      case "0":
        child = test0Page();
        break;
    }
    return child;
  }
}